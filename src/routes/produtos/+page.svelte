<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import type { Produto } from "@/types";
    import Eye from "@lucide/svelte/icons/eye";
    import Package from "@lucide/svelte/icons/package";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let produtos = $state<
        Array<
            Produto & {
                praca_nome?: string;
                estoque_atual?: number;
                grupo_descricao?: string;
            }
        >
    >([]);
    let searchQuery = $state("");
    let loading = $state(true);

    // Pagination
    let page = $state(1);
    const perPage = 15;
    let totalItems = $state(0);

    let debounceTimer: ReturnType<typeof setTimeout>;

    function handleSearch() {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            page = 1;
            load();
        }, 300);
    }

    async function delete_(id: number) {
        if (
            !confirm(
                "Tem certeza que deseja excluir este produto? Todas as variações e registros relacionados também serão excluídos.",
            )
        )
            return;
        try {
            await db.execute("DELETE FROM produtos WHERE id = $1", [id]);
            await load();
            toast.success("Produto excluído com sucesso!");
        } catch (e: any) {
            toast.error(`Falha ao deletar produto: ${e.message}`);
            console.error("Erro ao deletar produto:", e);
        }
    }

    async function load() {
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = `
                SELECT COUNT(*) as count 
                FROM produtos p
                LEFT JOIN produto_grupos pg ON p.grupo_id = pg.id
            `;
            let selectQuery = `
                 SELECT p.*,
                       pg.descricao as grupo_descricao,
                       (SELECT SUM(estoque_atual) FROM produto_variacoes WHERE produto_id = p.id) as estoque_atual
                FROM produtos p
                LEFT JOIN produto_grupos pg ON p.grupo_id = pg.id
            `;
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = `
                    WHERE p.descricao LIKE $1 OR p.codigo LIKE $1 OR pg.descricao LIKE $1
                 `;
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY p.descricao ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countRes = (await db.select(countQuery, params)) as any;
            totalItems = countRes[0]?.count || 0;

            produtos = (await db.select(selectQuery, params)) as any;
        } catch (e: any) {
            toast.error(`Falha ao carregar dados: ${e.message}`);
            console.error("Erro ao carregar dados:", e);
        } finally {
            loading = false;
        }
    }

    onMount(() => load());

    $effect(() => {
        if (page) load();
    });

    function formatCurrency(v: number | null) {
        return (v || 0).toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Package class="h-8 w-8 text-primary" />
                Gerenciamento de Produtos
            </Card.Title>
            <Card.Description>
                Catálogo completo de produtos, preços e controle de estoque
                agregado.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer gap-2"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/produtos/novo");
            }}
        >
            <Plus class="h-4 w-4" />
            Novo Produto
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
                    placeholder="Pesquisar por código, descrição ou grupo..."
                    class="pl-8"
                    bind:value={searchQuery}
                    oninput={handleSearch}
                />
            </div>
        </div>

        {#if loading}
            <div class="flex h-48 items-center justify-center">
                <Spinner class="h-8 w-8 text-primary" />
            </div>
        {:else}
            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Código</Table.Head>
                        <Table.Head>Descrição</Table.Head>
                        <Table.Head>Grupo</Table.Head>
                        <Table.Head class="text-right">Preço Venda</Table.Head>
                        <Table.Head class="text-center"
                            >Estoque Total</Table.Head
                        >
                        <Table.Head class="w-12.5 text-right">Ações</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each produtos as produto (produto.id)}
                        <Table.Row class="hover:bg-muted/50 transition-colors">
                            <Table.Cell
                                class="font-mono font-bold text-muted-foreground"
                                >{produto.codigo}</Table.Cell
                            >
                            <Table.Cell class="font-bold text-primary">
                                {produto.descricao}
                            </Table.Cell>
                            <Table.Cell>
                                <span
                                    class="inline-flex items-center rounded-md bg-zinc-100 px-2 py-1 text-xs font-medium text-zinc-600 ring-1 ring-inset ring-zinc-500/10"
                                >
                                    {produto.grupo_descricao || "Sem Grupo"}
                                </span>
                            </Table.Cell>
                            <Table.Cell class="text-right font-medium">
                                {formatCurrency(produto.preco_venda)}
                            </Table.Cell>
                            <Table.Cell class="text-center font-black">
                                {produto.estoque_atual ?? 0}
                            </Table.Cell>
                            <Table.Cell class="text-right whitespace-nowrap">
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = produto.id;
                                        goto(`/produtos/id`);
                                    }}
                                >
                                    <Eye
                                        class="h-4 w-4 stroke-3 text-primary"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id;
                                        goto(`/produtos/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 text-lime-600"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => delete_(produto.id)}
                                >
                                    <Trash2
                                        class="h-4 w-4 stroke-3 text-red-500"
                                    />
                                </Button>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={6}
                                class="text-center py-12 text-muted-foreground italic"
                            >
                                Nenhum produto encontrado.
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                </Table.Body>
            </Table.Root>
        {/if}

        <div class="mt-4">
            <PaginationControl count={totalItems} {perPage} bind:page />
        </div>
    </Card.Content>
</Card.Root>
