<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Spinner } from "@/components/ui/spinner";
    import * as Table from "@/components/ui/table/index.js";
    import db from "@/db/db.svelte";
    import Activity from "@lucide/svelte/icons/activity";
    import Calendar from "@lucide/svelte/icons/calendar";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Truck from "@lucide/svelte/icons/truck";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let movements = $state<any[]>([]);
    let loading = $state(true);
    let searchQuery = $state("");

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
                FROM movimentacoes_estoque m
                JOIN produto_variacoes v ON m.variacao_id = v.id
                JOIN produtos p ON v.produto_id = p.id
                WHERE m.tipo IN ('devolucao', 'perda')
            `;
            let selectQuery = `
                 SELECT
                    m.*,
                    p.descricao as produto_descricao,
                    p.codigo as produto_codigo,
                    v.tamanho,
                    v.cor
                 FROM movimentacoes_estoque m
                 JOIN produto_variacoes v ON m.variacao_id = v.id
                 JOIN produtos p ON v.produto_id = p.id
                 WHERE m.tipo IN ('devolucao', 'perda')
            `;
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = `
                    AND (p.descricao LIKE $1 OR p.codigo LIKE $1)
                `;
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY m.data_movimento DESC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [{ count: number }];
            totalItems = countResult[0].count;

            movements = (await db.select(
                selectQuery,
                params,
            )) as any[];
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar histórico de devoluções.");
        } finally {
            loading = false;
        }
    }

    function formatDate(dateStr: string) {
        return new Date(dateStr).toLocaleString("pt-BR", {
            day: "2-digit",
            month: "2-digit",
            year: "numeric",
            hour: "2-digit",
            minute: "2-digit",
        });
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Truck class="h-8 w-8 text-primary" />
                Histórico de Devoluções
            </Card.Title>
            <Card.Description>
                Registro de movimentações de retorno e produtos com defeito.
            </Card.Description>
        </div>
        <Button
            onclick={() => goto("/devolucoes/novo")}
            class="ml-auto cursor-pointer gap-2"
            variant="outline"
            size="lg"
        >
            <Plus class="h-4 w-4" />
            Nova Devolução
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
                    placeholder="Pesquisar por produto ou código..."
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
                        <Table.Head>Data</Table.Head>
                        <Table.Head>Produto</Table.Head>
                        <Table.Head>Variação</Table.Head>
                        <Table.Head>Tipo</Table.Head>
                        <Table.Head class="text-right">Qtd</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each movements as movement}
                        <Table.Row class="hover:bg-muted/50 transition-colors">
                            <Table.Cell>
                                <div
                                    class="flex items-center gap-2 text-muted-foreground font-medium"
                                >
                                    <Calendar class="h-4 w-4" />
                                    {formatDate(movement.data_movimento)}
                                </div>
                            </Table.Cell>
                            <Table.Cell>
                                <div class="flex flex-col">
                                    <span
                                        class="font-bold text-primary uppercase tracking-tight"
                                        >{movement.produto_codigo}</span
                                    >
                                    <span class="text-xs text-muted-foreground"
                                        >{movement.produto_descricao}</span
                                    >
                                </div>
                            </Table.Cell>
                            <Table.Cell>
                                <span
                                    class="inline-flex items-center rounded-md bg-zinc-100 px-2 py-1 text-xs font-medium text-zinc-600 ring-1 ring-inset ring-zinc-500/10"
                                >
                                    {movement.tamanho} / {movement.cor}
                                </span>
                            </Table.Cell>
                            <Table.Cell>
                                {#if movement.tipo === "devolucao"}
                                    <span
                                        class="inline-flex items-center gap-1.5 rounded-full bg-blue-500/10 px-2.5 py-0.5 text-xs font-bold text-blue-500 border border-blue-500/20 uppercase"
                                    >
                                        <Truck class="h-3 w-3" />
                                        Devolução
                                    </span>
                                {:else}
                                    <span
                                        class="inline-flex items-center gap-1.5 rounded-full bg-destructive/10 px-2.5 py-0.5 text-xs font-bold text-destructive border border-destructive/20 uppercase"
                                    >
                                        <Activity class="h-3 w-3" />
                                        Defeito
                                    </span>
                                {/if}
                            </Table.Cell>
                            <Table.Cell class="text-right font-black text-lg">
                                {movement.quantidade}
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={5}
                                class="h-32 text-center text-muted-foreground italic"
                                >Nenhuma devolução registrada.</Table.Cell
                            >
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
