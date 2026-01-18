<script lang="ts">
    import { goto } from "$app/navigation";
    import { Badge } from "@/components/ui/badge/index.js";
    import { Button } from "@/components/ui/button/index.js";
    import * as Card from "@/components/ui/card/index.js";
    import * as Table from "@/components/ui/table/index.js";
    import RevenueChart from "@/components/dashboard/revenue-chart.svelte";
    import db from "@/db/db.svelte";
    import AlertTriangle from "@lucide/svelte/icons/alert-triangle";
    import ArrowRight from "@lucide/svelte/icons/arrow-right";
    import Boxes from "@lucide/svelte/icons/boxes";
    import DollarSign from "@lucide/svelte/icons/dollar-sign";
    import HandBag from "@lucide/svelte/icons/handbag";
    import TrendingUp from "@lucide/svelte/icons/trending-up";
    import Users from "@lucide/svelte/icons/users";
    import { onMount } from "svelte";
    import Id from "@/id.svelte";

    let stats = $state({
        totalOrders: 0,
        totalClients: 0,
        totalProducts: 0,
        totalRevenue: 0,
        pendingOrders: 0,
    });

    let recentOrders = $state<any[]>([]);
    let topProducts = $state<any[]>([]);
    let lowStockItems = $state<any[]>([]);
    let revenueHistory = $state<any[]>([]);

    async function loadDashboardData() {
        try {
            const [
                ordersRes,
                clientsRes,
                productsRes,
                pendingRes,
                recentRes,
                topProdRes,
                lowStockRes,
                historyRes,
            ] = await Promise.all([
                db.select(
                    "SELECT COUNT(*) as count, SUM(valor_liquido) as revenue FROM pedidos WHERE situacao != 'cancelado'",
                    [],
                ),
                db.select(
                    "SELECT COUNT(*) as count FROM clientes WHERE ativo = 1",
                    [],
                ),
                db.select("SELECT COUNT(*) as count FROM produtos", []),
                db.select(
                    "SELECT COUNT(*) as count FROM pedidos WHERE situacao = 'pendente'",
                    [],
                ),
                db.select(
                    `
                    SELECT p.id, p.numero_pedido, c.nome as cliente, p.valor_liquido, p.situacao, p.data_pedido
                    FROM pedidos p
                    JOIN clientes c ON p.cliente_id = c.id
                    ORDER BY p.data_pedido DESC, p.id DESC
                    LIMIT 5
                `,
                    [],
                ),
                db.select(
                    `
                    SELECT p.descricao, SUM(pi.quantidade_saida - pi.quantidade_retorno) as total_sold
                    FROM pedido_itens pi
                    JOIN produtos p ON pi.produto_id = p.id
                    GROUP BY p.id
                    ORDER BY total_sold DESC
                    LIMIT 5
                `,
                    [],
                ),
                db.select(
                    `
                    SELECT p.descricao, pv.estoque_atual, pv.tamanho, pv.cor
                    FROM produtos p
                    JOIN produto_variacoes pv ON p.id = pv.produto_id
                    WHERE pv.estoque_atual < 10
                    ORDER BY pv.estoque_atual ASC
                    LIMIT 5
                `,
                    [],
                ),
                db.select(
                    `
                    SELECT strftime('%Y-%m', data_pedido) as month, SUM(valor_liquido) as revenue
                    FROM pedidos
                    WHERE situacao != 'cancelado'
                    GROUP BY month
                    ORDER BY month DESC
                    LIMIT 6
                `,
                    [],
                ),
            ]);

            const row0 = (ordersRes as any)[0];
            stats.totalOrders = row0?.count || 0;
            stats.totalRevenue = row0?.revenue || 0;
            stats.totalClients = (clientsRes as any)[0]?.count || 0;
            stats.totalProducts = (productsRes as any)[0]?.count || 0;
            stats.pendingOrders = (pendingRes as any)[0]?.count || 0;

            recentOrders = recentRes as any[];
            topProducts = topProdRes as any[];
            lowStockItems = lowStockRes as any[];

            // Format month labels for display
            revenueHistory = (historyRes as any[]).reverse().map((item) => ({
                month: item.month.split("-").reverse().join("/"),
                revenue: Number(item.revenue) || 0,
            }));
        } catch (e) {
            console.error("Failed to load dashboard data:", e);
        }
    }

    function formatCurrency(value: number) {
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }

    function getStatusColor(status: string) {
        switch (status) {
            case "faturado":
                return "bg-emerald-500/10 text-emerald-500 hover:bg-emerald-500/20";
            case "pendente":
                return "bg-amber-500/10 text-amber-500 hover:bg-amber-500/20";
            case "cancelado":
                return "bg-red-500/10 text-red-500 hover:bg-red-500/20";
            case "devolvido":
                return "bg-blue-500/10 text-blue-500 hover:bg-blue-500/20";
            default:
                return "bg-slate-500/10 text-slate-500";
        }
    }

    onMount(() => {
        loadDashboardData();
    });
</script>

<div class="p-10 flex flex-col gap-10 bg-background/50 min-h-full">
    <div class="flex flex-col gap-2">
        <h1 class="text-4xl font-bold tracking-tight">Dashboard</h1>
        <p class="text-muted-foreground text-lg">
            Bem-vindo ao <span class="text-primary font-bold">Stockfy</span>.
            Visão geral do seu negócio.
        </p>
    </div>

    <!-- Main KPIs -->
    <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-4">
        <Card.Root
            class="shadow-lg border-primary/10 overflow-hidden relative group hover:border-primary/30 transition-all"
        >
            <div
                class="absolute top-0 right-0 p-3 opacity-10 group-hover:scale-110 transition-transform"
            >
                <DollarSign class="size-12" />
            </div>
            <Card.Header class="pb-2">
                <Card.Title
                    class="text-sm font-semibold uppercase tracking-wider text-muted-foreground"
                    >Faturamento Total</Card.Title
                >
            </Card.Header>
            <Card.Content>
                <div class="text-3xl font-bold text-primary">
                    {formatCurrency(stats.totalRevenue)}
                </div>
                <div
                    class="flex items-center gap-1 mt-1 text-emerald-500 text-xs font-bold"
                >
                    <TrendingUp class="size-3" />
                    Receita consolidada
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root
            class="shadow-lg border-primary/10 overflow-hidden relative group hover:border-primary/30 transition-all"
        >
            <div
                class="absolute top-0 right-0 p-3 opacity-10 group-hover:scale-110 transition-transform"
            >
                <HandBag class="size-12" />
            </div>
            <Card.Header class="pb-2">
                <Card.Title
                    class="text-sm font-semibold uppercase tracking-wider text-muted-foreground"
                    >Pedidos</Card.Title
                >
            </Card.Header>
            <Card.Content>
                <div class="text-3xl font-bold">{stats.totalOrders}</div>
                <div class="mt-1 text-muted-foreground text-xs font-medium">
                    {stats.pendingOrders} pendentes de faturamento
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root
            class="shadow-lg border-primary/10 overflow-hidden relative group hover:border-primary/30 transition-all"
        >
            <div
                class="absolute top-0 right-0 p-3 opacity-10 group-hover:scale-110 transition-transform"
            >
                <Users class="size-12" />
            </div>
            <Card.Header class="pb-2">
                <Card.Title
                    class="text-sm font-semibold uppercase tracking-wider text-muted-foreground"
                    >Base de Clientes</Card.Title
                >
            </Card.Header>
            <Card.Content>
                <div class="text-3xl font-bold">{stats.totalClients}</div>
                <div class="mt-1 text-muted-foreground text-xs font-medium">
                    Clientes ativos no sistema
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root
            class="shadow-lg border-primary/10 overflow-hidden relative group hover:border-primary/30 transition-all"
        >
            <div
                class="absolute top-0 right-0 p-3 opacity-10 group-hover:scale-110 transition-transform"
            >
                <Boxes class="size-12" />
            </div>
            <Card.Header class="pb-2">
                <Card.Title
                    class="text-sm font-semibold uppercase tracking-wider text-muted-foreground"
                    >Mix de Produtos</Card.Title
                >
            </Card.Header>
            <Card.Content>
                <div class="text-3xl font-bold">{stats.totalProducts}</div>
                <div class="mt-1 text-muted-foreground text-xs font-medium">
                    Categorias no catálogo
                </div>
            </Card.Content>
        </Card.Root>
    </div>

    <div class="grid- gap-8 lg:grid-cols-7 hidden">
        <!-- Revenue Chart -->
        <Card.Root
            class="lg:col-span-4 shadow-xl border-primary/5 h-full flex flex-col"
        >
            <Card.Header>
                <Card.Title>Histórico de Receita</Card.Title>
                <Card.Description
                    >Desempenho financeiro nos últimos 6 meses</Card.Description
                >
            </Card.Header>
            <Card.Content class="flex-1 min-h-[300px] w-full pt-4">
                <RevenueChart data={revenueHistory} />
            </Card.Content>
        </Card.Root>

        <!-- Low Stock Alerts -->
        <Card.Root
            class="lg:col-span-3 shadow-xl border-orange-500/10 bg-orange-500/[0.02]"
        >
            <Card.Header class="flex flex-row items-center justify-between">
                <div>
                    <Card.Title class="flex items-center gap-2 text-orange-600">
                        <AlertTriangle class="size-5" />
                        Alertas de Estoque
                    </Card.Title>
                    <Card.Description
                        >Itens com estoque abaixo do crítico</Card.Description
                    >
                </div>
            </Card.Header>
            <Card.Content>
                <div class="space-y-4">
                    {#each lowStockItems as item}
                        <div
                            class="flex items-center justify-between p-3 rounded-lg bg-background border border-orange-500/10 shadow-sm"
                        >
                            <div class="flex flex-col">
                                <span
                                    class="font-bold text-sm truncate max-w-[180px]"
                                    >{item.descricao}</span
                                >
                                <span
                                    class="text-[10px] text-muted-foreground font-bold uppercase"
                                    >{item.cor || ""} {item.tamanho || ""}</span
                                >
                            </div>
                            <Badge
                                variant="outline"
                                class="border-orange-500/50 text-orange-600 bg-orange-500/10"
                            >
                                {item.estoque_atual} un
                            </Badge>
                        </div>
                    {:else}
                        <div
                            class="text-center py-10 text-muted-foreground italic"
                        >
                            Tudo ok no estoque!
                        </div>
                    {/each}
                </div>
            </Card.Content>
        </Card.Root>
    </div>

    <div class="grid gap-8 lg:grid-cols-2">
        <!-- Recent Orders -->
        <Card.Root class="shadow-xl border-primary/5">
            <Card.Header class="flex flex-row items-center justify-between">
                <div>
                    <Card.Title>Pedidos Recentes</Card.Title>
                    <Card.Description
                        >As últimas transações realizadas</Card.Description
                    >
                </div>
                <Button
                    variant="ghost"
                    size="sm"
                    class="gap-2 font-bold"
                    onclick={() => goto("/pedidos")}
                >
                    Ver todos
                    <ArrowRight class="size-4" />
                </Button>
            </Card.Header>
            <Card.Content>
                <Table.Root>
                    <Table.Header>
                        <Table.Row>
                            <Table.Head>Pedido</Table.Head>
                            <Table.Head>Cliente</Table.Head>
                            <Table.Head>Valor</Table.Head>
                            <Table.Head>Status</Table.Head>
                        </Table.Row>
                    </Table.Header>
                    <Table.Body>
                        {#each recentOrders as order}
                            <Table.Row
                                class="group cursor-pointer"
                                onclick={() => {
                                    Id.id = order.id;
                                    goto(`/pedidos/id/edit`);
                                }}
                            >
                                <Table.Cell class="font-bold text-primary"
                                    >{order.numero_pedido}</Table.Cell
                                >
                                <Table.Cell class="max-w-[140px] truncate"
                                    >{order.cliente}</Table.Cell
                                >
                                <Table.Cell class="font-medium"
                                    >{formatCurrency(
                                        order.valor_liquido || 0,
                                    )}</Table.Cell
                                >
                                <Table.Cell>
                                    <Badge
                                        class={getStatusColor(order.situacao)}
                                    >
                                        {order.situacao}
                                    </Badge>
                                </Table.Cell>
                            </Table.Row>
                        {/each}
                    </Table.Body>
                </Table.Root>
            </Card.Content>
        </Card.Root>

        <!-- Top Selling Products -->
        <Card.Root class="shadow-xl border-primary/5">
            <Card.Header>
                <Card.Title>Mais Vendidos</Card.Title>
                <Card.Description
                    >Produtos com maior volume de saída</Card.Description
                >
            </Card.Header>
            <Card.Content>
                <div class="space-y-6">
                    {#each topProducts as product, i}
                        <div class="flex items-center gap-4">
                            <div
                                class="size-8 rounded-full bg-primary/10 flex items-center justify-center font-bold text-primary text-xs"
                            >
                                #{i + 1}
                            </div>
                            <div class="flex-1">
                                <div
                                    class="flex justify-between items-center mb-1"
                                >
                                    <span class="font-bold text-sm"
                                        >{product.descricao}</span
                                    >
                                    <span class="text-sm font-bold"
                                        >{product.total_sold} un</span
                                    >
                                </div>
                                <div class="w-full bg-muted rounded-full h-1.5">
                                    <div
                                        class="bg-primary h-full rounded-full transition-all duration-1000"
                                        style="width: {(product.total_sold /
                                            Math.max(
                                                ...topProducts.map(
                                                    (p) => p.total_sold,
                                                ),
                                            )) *
                                            100}%"
                                    ></div>
                                </div>
                            </div>
                        </div>
                    {/each}
                </div>
            </Card.Content>
        </Card.Root>
    </div>
</div>
