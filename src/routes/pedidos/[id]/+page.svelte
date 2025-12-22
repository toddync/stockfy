<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Badge } from "$lib/components/ui/badge/index";
    import { Button } from "$lib/components/ui/button/index";
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import type { Cliente, Pedido, PedidoItem, Vendedor } from "$lib/types";
    import ChevronLeft from "@lucide/svelte/icons/chevron-left";
    import Printer from "@lucide/svelte/icons/printer";
    import { onMount } from "svelte";

    let pedido = $state<Pedido | null>(null);
    let items = $state<Array<PedidoItem>>([]);
    let cliente = $state<Cliente | null>(null);
    let vendedor = $state<Vendedor | null>(null);
    let loading = $state(true);

    const pedidoId = page.params.id;

    async function load() {
        loading = true;
        try {
            const [pRes, iRes] = await Promise.all([
                fetch(`http://localhost:3000/api/pedidos/${pedidoId}`),
                fetch(`http://localhost:3000/api/pedidos/${pedidoId}/itens`),
            ]);
            pedido = await pRes.json();
            items = await iRes.json();

            if (pedido) {
                const [cRes, vRes] = await Promise.all([
                    fetch(
                        `http://localhost:3000/api/clientes/${pedido.cliente_id}`,
                    ),
                    pedido.vendedor_id
                        ? fetch(
                              `http://localhost:3000/api/vendedores/${pedido.vendedor_id}`,
                          )
                        : Promise.resolve(null),
                ]);
                cliente = await cRes.json();
                vendedor = vRes ? await vRes.json() : null;
            }
        } catch (e: any) {
            console.error(e);
        } finally {
            loading = false;
        }
    }

    onMount(() => load());

    function formatCurrency(v: number | null) {
        return (v || 0).toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }
</script>

<div class="p-6 max-w-4xl mx-auto space-y-6">
    <div class="flex items-center gap-4">
        <Button variant="ghost" size="icon" onclick={() => goto("/pedidos")}>
            <ChevronLeft class="h-6 w-6" />
        </Button>
        <h1 class="text-3xl font-bold">Detalhes do Pedido</h1>

        <Button
            variant="outline"
            class="ml-auto"
            onclick={() => window.print()}
        >
            <Printer class="mr-2 h-4 w-4" /> Imprimir
        </Button>
    </div>

    {#if loading}
        <div class="flex justify-center py-20">
            <div
                class="animate-spin rounded-full h-12 w-12 border-b-2 border-primary"
            ></div>
        </div>
    {:else if pedido}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <Card.Root class="md:col-span-2">
                <Card.Header>
                    <div class="flex justify-between items-center">
                        <Card.Title class="text-2xl text-primary"
                            >#{pedido.numero_pedido}</Card.Title
                        >
                        <Badge
                            variant="outline"
                            class="text-sm font-bold bg-primary/10"
                        >
                            {pedido.situacao}
                        </Badge>
                    </div>
                    <Card.Description>
                        Emitido em {new Date(
                            pedido.data_pedido,
                        ).toLocaleDateString("pt-BR")}
                    </Card.Description>
                </Card.Header>
                <Card.Content class="space-y-6">
                    <div class="grid grid-cols-2 gap-4 text-sm">
                        <div class="space-y-1">
                            <span
                                class="text-muted-foreground block text-xs uppercase tracking-wider font-bold"
                                >Cliente</span
                            >
                            <p class="text-lg font-semibold">
                                {cliente?.nome || "—"}
                            </p>
                        </div>
                        <div class="space-y-1">
                            <span
                                class="text-muted-foreground block text-xs uppercase tracking-wider font-bold"
                                >Vendedor</span
                            >
                            <p class="text-lg font-semibold">
                                {vendedor?.nome || "—"}
                            </p>
                        </div>
                    </div>

                    <div class="border-t pt-6">
                        <h3 class="font-bold mb-4 text-lg">Itens do Pedido</h3>
                        <Table.Root>
                            <Table.Header>
                                <Table.Row>
                                    <Table.Head>Cód</Table.Head>
                                    <Table.Head>Produto</Table.Head>
                                    <Table.Head class="text-center"
                                        >Qtd</Table.Head
                                    >
                                    <Table.Head class="text-right"
                                        >Unitário</Table.Head
                                    >
                                    <Table.Head class="text-right"
                                        >Subtotal</Table.Head
                                    >
                                </Table.Row>
                            </Table.Header>
                            <Table.Body>
                                {#each items as item}
                                    <Table.Row>
                                        <Table.Cell class="font-mono text-xs"
                                            >{item.produto_id}</Table.Cell
                                        >
                                        <Table.Cell class="font-medium">
                                            {item.produto_id ||
                                                "Produto"}</Table.Cell
                                        >
                                        <Table.Cell class="text-center"
                                            >{item.quantidade_saida -
                                                item.quantidade_retorno}</Table.Cell
                                        >
                                        <Table.Cell class="text-right"
                                            >{formatCurrency(
                                                item.preco_venda,
                                            )}</Table.Cell
                                        >
                                        <Table.Cell class="text-right font-bold"
                                            >{formatCurrency(
                                                (item.preco_venda || 0) *
                                                    (item.quantidade_saida -
                                                        item.quantidade_retorno),
                                            )}</Table.Cell
                                        >
                                    </Table.Row>
                                {/each}
                            </Table.Body>
                        </Table.Root>
                    </div>
                </Card.Content>
            </Card.Root>

            <div class="space-y-6">
                <Card.Root>
                    <Card.Header>
                        <Card.Title>Resumo Financeiro</Card.Title>
                    </Card.Header>
                    <Card.Content class="space-y-4">
                        <div class="flex justify-between text-sm">
                            <span class="text-muted-foreground"
                                >Valor Bruto</span
                            >
                            <span>{formatCurrency(pedido.valor_total)}</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-muted-foreground">Valor Pago</span
                            >
                            <span class="text-green-600 font-semibold"
                                >{formatCurrency(pedido.valor_pago)}</span
                            >
                        </div>
                        {#if (pedido.valor_total || 0) - (pedido.valor_pago || 0) > 0}
                            <div class="flex justify-between text-sm">
                                <span class="text-muted-foreground"
                                    >Saldo Devedor</span
                                >
                                <span class="text-destructive font-bold"
                                    >{formatCurrency(
                                        (pedido.valor_total || 0) -
                                            (pedido.valor_pago || 0),
                                    )}</span
                                >
                            </div>
                        {/if}
                        <div
                            class="border-t pt-4 flex justify-between items-center"
                        >
                            <span class="font-bold text-lg">Total</span>
                            <span class="text-2xl font-black text-primary"
                                >{formatCurrency(pedido.valor_total)}</span
                            >
                        </div>
                    </Card.Content>
                </Card.Root>

                {#if pedido.solicitacao_numero}
                    <Card.Root class="bg-primary/5">
                        <Card.Header class="pb-2">
                            <Card.Title class="text-sm"
                                >Solicitação Relacionada</Card.Title
                            >
                        </Card.Header>
                        <Card.Content>
                            <p class="font-bold text-lg">
                                #{pedido.solicitacao_numero}
                            </p>
                        </Card.Content>
                    </Card.Root>
                {/if}
            </div>
        </div>
    {:else}
        <div class="text-center py-20">
            <h2 class="text-xl font-bold">Pedido não encontrado.</h2>
            <Button variant="link" onclick={() => goto("/pedidos")}
                >Voltar para a lista</Button
            >
        </div>
    {/if}
</div>
