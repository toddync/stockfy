<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Route from "@lucide/svelte/icons/route";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    interface RotaExt {
        id: number;
        codigo: string;
        nome: string;
        bairro: string | null;
        praca_nome: string | null;
    }

    let routes = $state<Array<RotaExt>>([]);
    let searchQuery = $state("");
    let loading = $state(true);

    // Pagination
    let page = $state(1);
    const perPage = 10;
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
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = `
                SELECT COUNT(*) as count 
                FROM rotas r
                LEFT JOIN pracas p ON r.praca_id = p.id
            `;
            let selectQuery = `
                SELECT r.*, p.nome as praca_nome
                FROM rotas r
                LEFT JOIN pracas p ON r.praca_id = p.id
            `;
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = `
                    WHERE r.nome LIKE $1 
                    OR r.codigo LIKE $1 
                    OR r.bairro LIKE $1 
                    OR p.nome LIKE $1
                `;
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY r.nome ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            routes = (await db.select(selectQuery, params)) as Array<RotaExt>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar rotas do banco de dados.");
        } finally {
            loading = false;
        }
    }

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir esta rota?")) return;
        try {
            await db.execute("DELETE FROM rotas WHERE id = $1", [id]);
            await load();
            toast.success("Rota excluída com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir rota");
            console.error(e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Route class="h-8 w-8 text-primary" />
                Gerenciamento de Rotas
            </Card.Title>
            <Card.Description>
                Controle de itinerários e bairros de atendimento.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer gap-2"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/rotas/novo");
            }}
        >
            <Plus class="h-4 w-4" />
            Nova Rota
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
                    placeholder="Pesquisar por nome, código, bairro ou praça..."
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
                        <Table.Head>Nome</Table.Head>
                        <Table.Head>Bairro</Table.Head>
                        <Table.Head>Praça (Área)</Table.Head>
                        <Table.Head class="w-24 text-right">Ações</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each routes as r (r.id)}
                        <Table.Row class="hover:bg-muted/50 transition-colors">
                            <Table.Cell
                                class="font-mono font-bold text-muted-foreground"
                                >{r.codigo}</Table.Cell
                            >
                            <Table.Cell class="font-bold text-primary">
                                {r.nome}
                            </Table.Cell>
                            <Table.Cell>{r.bairro || "—"}</Table.Cell>
                            <Table.Cell>
                                <span
                                    class="inline-flex items-center rounded-full bg-muted px-2 py-1 text-xs font-medium text-muted-foreground ring-1 ring-inset ring-border/50"
                                >
                                    {r.praca_nome || "Não atribuída"}
                                </span>
                            </Table.Cell>
                            <Table.Cell class="text-right whitespace-nowrap">
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = r.id;
                                        goto(`/rotas/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 text-lime-600"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => delete_(r.id)}
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
                                colspan={5}
                                class="text-center py-12 text-muted-foreground italic"
                            >
                                Nenhuma rota encontrada.
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
