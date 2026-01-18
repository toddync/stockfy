<script lang="ts">
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import type { ContaFinanceira } from "@/types";
    import db from "@/db/db.svelte";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import TrendingDown from "@lucide/svelte/icons/trending-down";
    import TrendingUp from "@lucide/svelte/icons/trending-up";
    import Wallet from "@lucide/svelte/icons/wallet";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import { goto } from "$app/navigation";
    import Id from "@/id.svelte";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let contas = $state<Array<ContaFinanceira>>([]);
    let searchQuery = $state("");
    let page = $state(1);
    let perPage = 10;
    let totalItems = $state(0);

    // Summary statistics
    let totalPendente = $state(0);
    let totalLiquidado = $state(0);

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
        if (!confirm("Tem certeza que deseja excluir esta conta?")) return;
        try {
            await db.execute("DELETE FROM contas_financeiras WHERE id = $1", [
                id,
            ]);
            await load();
            toast.success("Conta excluída com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar conta: ${message}`);
            console.error("Erro ao deletar conta:", e);
        }
    }

    async function load() {
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM contas_financeiras";
            let selectQuery = "SELECT * FROM contas_financeiras";
            let params: any[] = [];
            let whereClauses: string[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                whereClauses.push("descricao LIKE $1 OR categoria LIKE $1");
                params.push(search);
            }

            if (whereClauses.length > 0) {
                const whereClause = " WHERE " + whereClauses.join(" AND ");
                countQuery += whereClause;
                selectQuery += whereClause;
            }

            selectQuery += ` ORDER BY data_vencimento DESC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            contas = (await db.select(
                selectQuery,
                params,
            )) as Array<ContaFinanceira>;

            // Calculate totals (need separate queries to aggregate over all data, not just paginated)
            // Ideally this should respect filters too, but for simplicity let's respect filters if applied.
            // Using SUM() in SQL is much more efficient.

            let pendenteQuery = `
                SELECT SUM(CASE WHEN tipo = 'receita' THEN valor_original - IFNULL(valor_pago, 0) ELSE -(valor_original - IFNULL(valor_pago, 0)) END) as total
                FROM contas_financeiras
                WHERE situacao NOT IN ('pago', 'cancelado')
            `;
            let liquidadoQuery = `
                SELECT SUM(CASE WHEN tipo = 'receita' THEN IFNULL(valor_pago, 0) ELSE -IFNULL(valor_pago, 0) END) as total
                FROM contas_financeiras
            `;

            if (whereClauses.length > 0) {
                const whereClause = " AND (" + whereClauses.join(" AND ") + ")";
                pendenteQuery += whereClause;
                // For liquidado, it typically considers everything, but if we filter by search query, maybe we should filter totals too?
                // The original code filtered 'contas' array which was filtered by search query.
                // So yes, let's append filter to liquidadoQuery too.
                // Note: liquidadoQuery doesn't have a WHERE clause yet, so start with WHERE
                liquidadoQuery += " WHERE " + whereClauses.join(" AND ");
            }

            const pendenteResult = (await db.select(pendenteQuery, params)) as [
                { total: number },
            ];
            totalPendente = pendenteResult[0]?.total || 0;

            const liquidadoResult = (await db.select(
                liquidadoQuery,
                params,
            )) as [{ total: number }];
            totalLiquidado = liquidadoResult[0]?.total || 0;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar dados: ${message}`);
            console.error("Erro ao carregar dados:", e);
        }
    }

    onMount(() => load());

    function formatCurrency(value: number) {
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }
</script>

<div class="m-10 space-y-6">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card.Root class="bg-primary/5 border-primary/20">
            <Card.Header class="pb-2">
                <Card.Description class="flex items-center gap-2">
                    <TrendingDown class="h-4 w-4 text-primary" />
                    Saldo Pendente (Estimado)
                </Card.Description>
                <Card.Title
                    class={`text-3xl font-bold ${totalPendente >= 0 ? "text-green-600" : "text-red-600"}`}
                >
                    {formatCurrency(totalPendente)}
                </Card.Title>
            </Card.Header>
        </Card.Root>
        <Card.Root class="bg-green-500/5 border-green-500/20">
            <Card.Header class="pb-2">
                <Card.Description class="flex items-center gap-2">
                    <TrendingUp class="h-4 w-4 text-green-600" />
                    Total Liquidado (Balanço)
                </Card.Description>
                <Card.Title
                    class={`text-3xl font-bold ${totalLiquidado >= 0 ? "text-green-600" : "text-red-600"}`}
                >
                    {formatCurrency(totalLiquidado)}
                </Card.Title>
            </Card.Header>
        </Card.Root>
    </div>

    <Card.Root>
        <Card.Header class="flex flex-row items-center">
            <div>
                <Card.Title class="text-3xl flex items-center gap-2">
                    <Wallet class="h-8 w-8 text-primary" />
                    Contas Financeiras
                </Card.Title>
                <Card.Description>
                    Gerencie suas receitas e despesas.
                </Card.Description>
            </div>
            <Button
                class="ml-auto cursor-pointer"
                variant="outline"
                size="lg"
                onclick={() => {
                    goto("/contas/novo");
                }}
            >
                Nova conta
                <Plus class="ml-2 h-4 w-4" />
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
                        placeholder="Pesquisar por descrição..."
                        class="pl-8"
                        bind:value={searchQuery}
                        oninput={handleSearch}
                    />
                </div>
            </div>

            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Descrição</Table.Head>
                        <Table.Head>Tipo</Table.Head>
                        <Table.Head>Valor Original</Table.Head>
                        <Table.Head>Valor Pago</Table.Head>
                        <Table.Head>Vencimento</Table.Head>
                        <Table.Head>Situação</Table.Head>
                        <Table.Head class="w-12.5"></Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each contas as conta (conta.id)}
                        <Table.Row>
                            <Table.Cell class="font-medium text-primary">
                                {conta.descricao}
                                {#if conta.categoria}
                                    <span
                                        class="block text-xs text-muted-foreground"
                                    >
                                        {conta.categoria}
                                    </span>
                                {/if}
                            </Table.Cell>
                            <Table.Cell>
                                <span
                                    class={`capitalize ${conta.tipo === "receita" ? "text-green-600" : "text-red-600"}`}
                                >
                                    {conta.tipo}
                                </span>
                            </Table.Cell>
                            <Table.Cell class="font-bold">
                                {formatCurrency(conta.valor_original)}
                            </Table.Cell>
                            <Table.Cell>
                                {formatCurrency(conta.valor_pago || 0)}
                            </Table.Cell>
                            <Table.Cell>
                                {new Date(
                                    conta.data_vencimento,
                                ).toLocaleDateString("pt-BR")}
                            </Table.Cell>
                            <Table.Cell>
                                <span
                                    class={`px-2.5 py-0.5 rounded-full text-xs font-semibold ${
                                        conta.situacao === "pago"
                                            ? "bg-green-100 text-green-800"
                                            : conta.situacao === "atrasado"
                                              ? "bg-red-100 text-red-800"
                                              : "bg-yellow-100 text-yellow-800"
                                    }`}
                                >
                                    {conta.situacao}
                                </span>
                            </Table.Cell>
                            <Table.Cell>
                                <Button
                                    variant="ghost"
                                    size="icon-lg"
                                    onclick={() => {
                                        Id.id = conta.id;
                                        goto(`/contas/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 stroke-lime-400"
                                    />
                                </Button>

                                <Button
                                    variant="ghost"
                                    size="icon-lg"
                                    onclick={() => delete_(conta.id)}
                                >
                                    <Trash2
                                        class="h-4 w-4 stroke-3 stroke-red-500"
                                    />
                                </Button>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={7}
                                class="text-center py-10 text-muted-foreground"
                            >
                                Nenhuma conta encontrada.
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
</div>
