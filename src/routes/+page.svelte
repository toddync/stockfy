<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import db from "@/db/db.svelte";
    import { onMount } from "svelte";
    import Users from "@lucide/svelte/icons/users";
    import HandBag from "@lucide/svelte/icons/handbag";
    import Boxes from "@lucide/svelte/icons/boxes";
    import DollarSign from "@lucide/svelte/icons/dollar-sign";

    let stats = $state({
        totalOrders: 0,
        totalClients: 0,
        totalProducts: 0,
        totalRevenue: 0,
    });

    async function loadStats() {
        try {
            const orders = (await db.select(
                "SELECT COUNT(*) as count, SUM(valor_total) as revenue FROM pedidos",
                [],
            )) as any;
            const clients = (await db.select(
                "SELECT COUNT(*) as count FROM clientes",
                [],
            )) as any;
            const products = (await db.select(
                "SELECT COUNT(*) as count FROM produtos",
                [],
            )) as any;

            stats.totalOrders = orders[0]?.count || 0;
            stats.totalRevenue = orders[0]?.revenue || 0;
            stats.totalClients = clients[0]?.count || 0;
            stats.totalProducts = products[0]?.count || 0;
        } catch (e) {
            console.error("Failed to load dashboard stats:", e);
        }
    }

    onMount(() => {
        loadStats();
    });
</script>

<div class="p-10 flex flex-col gap-8">
    <div class="flex flex-col gap-2">
        <h1 class="text-4xl font-bold">Dashboard</h1>
        <p class="text-muted-foreground font-medium">
            Bem-vindo ao Stockfy. Aqui está um resumo do seu negócio.
        </p>
    </div>

    <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-4">
        <Card.Root>
            <Card.Header
                class="flex flex-row items-center justify-between pb-2"
            >
                <Card.Title class="text-sm font-medium"
                    >Total de Pedidos</Card.Title
                >
                <HandBag class="size-4 text-muted-foreground" />
            </Card.Header>
            <Card.Content>
                <div class="text-2xl font-bold">{stats.totalOrders}</div>
                <p class="text-xs text-muted-foreground font-medium">
                    Pedidos realizados
                </p>
            </Card.Content>
        </Card.Root>

        <Card.Root>
            <Card.Header
                class="flex flex-row items-center justify-between pb-2"
            >
                <Card.Title class="text-sm font-medium">Clientes</Card.Title>
                <Users class="size-4 text-muted-foreground" />
            </Card.Header>
            <Card.Content>
                <div class="text-2xl font-bold">{stats.totalClients}</div>
                <p class="text-xs text-muted-foreground font-medium">
                    Clientes cadastrados
                </p>
            </Card.Content>
        </Card.Root>

        <Card.Root>
            <Card.Header
                class="flex flex-row items-center justify-between pb-2"
            >
                <Card.Title class="text-sm font-medium">Produtos</Card.Title>
                <Boxes class="size-4 text-muted-foreground" />
            </Card.Header>
            <Card.Content>
                <div class="text-2xl font-bold">{stats.totalProducts}</div>
                <p class="text-xs text-muted-foreground font-medium">
                    Itens no catálogo
                </p>
            </Card.Content>
        </Card.Root>

        <Card.Root>
            <Card.Header
                class="flex flex-row items-center justify-between pb-2"
            >
                <Card.Title class="text-sm font-medium"
                    >Receita Total</Card.Title
                >
                <DollarSign class="size-4 text-muted-foreground" />
            </Card.Header>
            <Card.Content>
                <div class="text-2xl font-bold text-primary">
                    R$ {stats.totalRevenue.toLocaleString("pt-BR", {
                        minimumFractionDigits: 2,
                    })}
                </div>
                <p class="text-xs text-muted-foreground font-medium">
                    Volume total de vendas
                </p>
            </Card.Content>
        </Card.Root>
    </div>
</div>
