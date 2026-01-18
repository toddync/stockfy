<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import MapPin from "@lucide/svelte/icons/map-pin";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    interface Praca {
        id: number;
        codigo: string;
        nome: string;
    }

    let pracas = $state<Array<Praca>>([]);
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

    async function load() {
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM pracas";
            let selectQuery = "SELECT * FROM pracas";
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = " WHERE nome LIKE $1 OR codigo LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY nome ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            pracas = (await db.select(selectQuery, params)) as Array<Praca>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar praças do banco de dados.");
        }
    }

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir esta praça?")) return;
        try {
            await db.execute("DELETE FROM pracas WHERE id = $1", [id]);
            await load();
            toast.success("Praça excluída com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir praça");
            console.error(e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <MapPin class="h-8 w-8 text-primary" />
                Gerenciamento de Praças
            </Card.Title>
            <Card.Description>
                Controle de regiões e áreas de atendimento.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer gap-2"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/pracas/novo");
            }}
        >
            <Plus class="h-4 w-4" />
            Nova Praça
        </Button>
    </Card.Header>
    <Card.Content>
        <div class="mb-6 flex items-center gap-4">
            <div class="relative flex-1 max-w-sm">
                <Search
                    class="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground"
                />
                <Input
                    type="search"
                    placeholder="Pesquisar por nome ou código..."
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
                    <Table.Head>Nome</Table.Head>
                    <Table.Head class="w-24 text-right">Ações</Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each pracas as p (p.id)}
                    <Table.Row class="hover:bg-muted/50 transition-colors">
                        <Table.Cell
                            class="font-mono font-bold text-muted-foreground"
                            >{p.codigo}</Table.Cell
                        >
                        <Table.Cell class="font-bold text-primary">
                            {p.nome}
                        </Table.Cell>
                        <Table.Cell class="text-right whitespace-nowrap">
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => {
                                    Id.id = p.id;
                                    goto(`/pracas/id/edit`);
                                }}
                            >
                                <PencilLine
                                    class="h-4 w-4 stroke-3 text-lime-600"
                                />
                            </Button>
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => delete_(p.id)}
                            >
                                <Trash2
                                    class="h-4 w-4 stroke-3  text-red-500"
                                />
                            </Button>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={3}
                            class="text-center py-12 text-muted-foreground italic"
                        >
                            Nenhuma praça encontrada.
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
