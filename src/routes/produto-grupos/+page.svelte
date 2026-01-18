<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import type { ProdutoGrupo } from "@/types";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import Boxes from "@lucide/svelte/icons/boxes";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let grupos = $state<Array<ProdutoGrupo>>([]);
    let searchQuery = $state("");
    let page = $state(1);
    let perPage = 10;
    let totalItems = $state(0);

    let debounceTimer: ReturnType<typeof setTimeout>;

    function handleSearch() {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            page = 1;
            load();
        }, 300);
    }

    $effect(() => {
        if (page) load();
    });

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir este grupo?")) return;
        try {
            await db.execute("DELETE FROM produto_grupos WHERE id = $1", [id]);
            await load();
            toast.success("Grupo excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar grupo: ${message}`);
            console.error("Erro ao deletar grupo:", e);
        }
    }

    async function load() {
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM produto_grupos";
            let selectQuery = "SELECT * FROM produto_grupos";
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause =
                    " WHERE descricao LIKE $1 OR codigo LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY descricao ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            grupos = (await db.select(
                selectQuery,
                params,
            )) as Array<ProdutoGrupo>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar grupos: ${message}`);
            console.error("Erro ao carregar grupos:", e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Boxes class="h-8 w-8 text-primary" />
                Grupos de Produtos
            </Card.Title>
            <Card.Description>
                Gerencie as categorias e agrupamentos de seus produtos.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer gap-2"
            variant="outline"
            size="lg"
            onclick={() => goto("/produto-grupos/novo")}
        >
            <Plus class="h-4 w-4" />
            Novo Grupo
        </Button>
    </Card.Header>
    <Card.Content>
        <div class="mb-6 flex items-center gap-4 h-full">
            <div class="relative flex-1 max-w-sm">
                <Search
                    class="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground"
                />
                <Input
                    type="search"
                    placeholder="Pesquisar por código ou descrição..."
                    class="pl-8"
                    bind:value={searchQuery}
                    oninput={handleSearch}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Código</Table.Head>
                    <Table.Head>Descrição</Table.Head>
                    <Table.Head class="text-right">Ações</Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each grupos as grupo (grupo.id)}
                    <Table.Row class="hover:bg-muted/50 transition-colors">
                        <Table.Cell
                            class="font-mono font-bold text-muted-foreground"
                        >
                            {grupo.codigo}
                        </Table.Cell>
                        <Table.Cell class="font-bold text-primary">
                            {grupo.descricao}
                        </Table.Cell>
                        <Table.Cell class="text-right whitespace-nowrap">
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => {
                                    Id.id = grupo.id;
                                    goto(`/produto-grupos/id/edit`);
                                }}
                            >
                                <PencilLine
                                    class="h-4 w-4 stroke-3 text-lime-600"
                                />
                            </Button>
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => delete_(grupo.id)}
                            >
                                <Trash2 class="h-4 w-4 stroke-3 text-red-500" />
                            </Button>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={3}
                            class="text-center py-10 text-muted-foreground italic"
                        >
                            Nenhum grupo encontrado.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>

        <div class="mt-4">
            <PaginationControl count={totalItems} {perPage} bind:page />
        </div>
    </Card.Content>
</Card.Root>
