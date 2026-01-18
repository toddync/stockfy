<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import * as Table from "@/components/ui/table/index.js";
    import type { Compra, CompraItem, Fornecedor } from "@/types";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Calendar from "@lucide/svelte/icons/calendar";
    import ClipboardList from "@lucide/svelte/icons/clipboard-list";
    import Package from "@lucide/svelte/icons/package";
    import ShoppingBag from "@lucide/svelte/icons/shopping-bag";
    import User from "@lucide/svelte/icons/user";
    import { onMount } from "svelte";

    type ExtendedCompraItem = CompraItem & {
        codigo: string;
        descricao: string;
    };

    let compra = $state<Compra | null>(null);
    let items = $state<Array<ExtendedCompraItem>>([]);
    let fornecedor = $state<Fornecedor | null>(null);
    let loading = $state(true);

    const compraId = id.id;

    async function load() {
        loading = true;
        try {
            const [cRes, iRes] = await Promise.all([
                db.select("SELECT * FROM compras WHERE id = $1 LIMIT 1", [
                    compraId,
                ]),
                db.select(
                    `
                    SELECT ci.*, p.descricao, p.codigo
                    FROM compra_itens ci
                    LEFT JOIN produtos p ON ci.produto_id = p.id
                    WHERE ci.compra_id = $1`,
                    [compraId],
                ),
            ]);

            compra = (cRes as Array<Compra>)[0];
            items = iRes as Array<ExtendedCompraItem>;

            if (compra) {
                const fRes = await db.select(
                    "SELECT * FROM fornecedores WHERE id = $1",
                    [compra.fornecedor_id],
                );
                fornecedor = (fRes as Array<Fornecedor>)[0];
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

    function formatDate(dateString: string | null) {
        if (!dateString) return "—";
        return new Date(dateString).toLocaleDateString("pt-BR");
    }
</script>

<div class="p-6 w-full space-y-6">
    <div class="flex items-center gap-4">
        <Button variant="ghost" size="icon" onclick={() => goto("/compras")}>
            <ArrowLeft class="h-5 w-5" />
        </Button>
        <h1 class="text-3xl font-bold tracking-tight">Detalhes da Compra</h1>

        {#if compra}
            <div class="ml-auto flex gap-2">
                <Button
                    variant="outline"
                    onclick={() => {
                        Id.id = compraId;
                        goto(`/compras/id/edit`);
                    }}
                >
                    Editar Compra
                </Button>
            </div>
        {/if}
    </div>

    {#if loading}
        <div class="flex h-[400px] items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else if compra}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <Card.Root class="md:col-span-2 shadow-sm">
                <Card.Header class="pb-4 border-b">
                    <div class="flex justify-between items-start">
                        <div class="space-y-1">
                            <div
                                class="flex items-center gap-2 text-muted-foreground text-xs uppercase font-black tracking-widest mb-1"
                            >
                                <ClipboardList class="h-3 w-3 text-primary" />
                                Nota Fiscal
                            </div>
                            <Card.Title
                                class="text-3xl font-black text-primary"
                            >
                                {compra.numero_nota || "SEM NÚMERO"}
                            </Card.Title>
                            <Card.Description
                                class="flex items-center gap-4 pt-1"
                            >
                                <span class="flex items-center gap-2">
                                    <Calendar class="h-4 w-4" />
                                    Emissão: {formatDate(compra.data_emissao)}
                                </span>
                                <span class="flex items-center gap-2">
                                    <Calendar class="h-4 w-4" />
                                    Entrada: {formatDate(compra.data_entrada)}
                                </span>
                            </Card.Description>
                        </div>
                    </div>
                </Card.Header>
                <Card.Content class="space-y-8 pt-6">
                    <!-- Fornecedor Info -->
                    <div
                        class="bg-muted/30 p-6 rounded-2xl border border-border"
                    >
                        <div class="space-y-2">
                            <div
                                class="flex items-center gap-2 text-muted-foreground text-xs uppercase font-black tracking-widest"
                            >
                                <User class="h-3 w-3 text-primary" />
                                Fornecedor
                            </div>
                            <p
                                class="text-2xl font-bold leading-tight text-foreground"
                            >
                                {fornecedor?.razao_social || "—"}
                            </p>
                            <p class="text-sm text-muted-foreground">
                                {fornecedor?.cidade || ""}{fornecedor?.estado
                                    ? `/${fornecedor?.estado}`
                                    : ""}
                            </p>
                        </div>
                    </div>

                    <!-- Items Table -->
                    <div class="space-y-4">
                        <div class="flex items-center gap-2">
                            <Package class="h-5 w-5 text-primary" />
                            <h3 class="font-bold text-lg">
                                Produtos Recebidos
                            </h3>
                        </div>
                        <div
                            class="rounded-xl border border-border overflow-hidden bg-background shadow-xs"
                        >
                            <Table.Root>
                                <Table.Header class="bg-muted/50">
                                    <Table.Row>
                                        <Table.Head>Cód</Table.Head>
                                        <Table.Head>Descrição</Table.Head>
                                        <Table.Head class="text-center"
                                            >Qtd</Table.Head
                                        >
                                        <Table.Head class="text-right"
                                            >Custo Unit.</Table.Head
                                        >
                                        <Table.Head class="text-right"
                                            >Subtotal</Table.Head
                                        >
                                    </Table.Row>
                                </Table.Header>
                                <Table.Body>
                                    {#each items as item}
                                        <Table.Row>
                                            <Table.Cell
                                                class="font-mono text-xs text-muted-foreground"
                                                >{item.codigo}</Table.Cell
                                            >
                                            <Table.Cell class="font-medium"
                                                >{item.descricao}</Table.Cell
                                            >
                                            <Table.Cell
                                                class="text-center font-bold"
                                            >
                                                {item.quantidade}
                                            </Table.Cell>
                                            <Table.Cell class="text-right"
                                                >{formatCurrency(
                                                    item.preco_custo_un,
                                                )}</Table.Cell
                                            >
                                            <Table.Cell
                                                class="text-right font-black text-primary"
                                            >
                                                {formatCurrency(
                                                    (item.preco_custo_un || 0) *
                                                        (item.quantidade || 0),
                                                )}
                                            </Table.Cell>
                                        </Table.Row>
                                    {/each}
                                </Table.Body>
                            </Table.Root>
                        </div>
                    </div>

                    {#if compra.observacoes}
                        <div class="space-y-2">
                            <span
                                class="text-muted-foreground uppercase text-[10px] font-black tracking-wider"
                                >Observações</span
                            >
                            <p
                                class="bg-muted/20 p-4 rounded-lg border border-border text-sm leading-relaxed italic"
                            >
                                "{compra.observacoes}"
                            </p>
                        </div>
                    {/if}
                </Card.Content>
            </Card.Root>

            <div class="space-y-6">
                <!-- Resumo Financeiro -->
                <Card.Root
                    class="bg-primary shadow-lg border-none text-primary-foreground overflow-hidden relative"
                >
                    <div class="absolute top-0 right-0 p-4 opacity-10">
                        <ShoppingBag class="h-24 w-24" />
                    </div>
                    <Card.Header>
                        <Card.Title class="text-primary-foreground/90"
                            >Resumo Financeiro</Card.Title
                        >
                    </Card.Header>
                    <Card.Content class="space-y-6">
                        <div class="space-y-1">
                            <span
                                class="text-xs uppercase font-black tracking-widest text-primary-foreground/70"
                                >Total da Nota</span
                            >
                            <p class="text-5xl font-black">
                                {formatCurrency(compra.valor_total)}
                            </p>
                        </div>
                        <div
                            class="pt-4 border-t border-primary-foreground/20 text-sm"
                        >
                            <div class="flex justify-between">
                                <span class="opacity-70">Total de Itens</span>
                                <span class="font-bold"
                                    >{items.reduce(
                                        (acc, i) => acc + i.quantidade,
                                        0,
                                    )} un</span
                                >
                            </div>
                        </div>
                    </Card.Content>
                </Card.Root>

                <!-- Informações Logísticas -->
                <Card.Root class="shadow-sm">
                    <Card.Header>
                        <Card.Title>Logística</Card.Title>
                    </Card.Header>
                    <Card.Content class="space-y-4">
                        <div class="flex items-center gap-3">
                            <div class="bg-muted p-2 rounded-lg">
                                <Calendar class="h-4 w-4 text-primary" />
                            </div>
                            <div>
                                <p
                                    class="text-xs text-muted-foreground font-bold uppercase"
                                >
                                    Entrada no Sistema
                                </p>
                                <p class="font-semibold">
                                    {formatDate(compra.data_entrada)}
                                </p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3">
                            <div class="bg-muted p-2 rounded-lg">
                                <Calendar class="h-4 w-4 text-primary" />
                            </div>
                            <div>
                                <p
                                    class="text-xs text-muted-foreground font-bold uppercase"
                                >
                                    Emissão da Nota
                                </p>
                                <p class="font-semibold">
                                    {formatDate(compra.data_emissao)}
                                </p>
                            </div>
                        </div>
                    </Card.Content>
                </Card.Root>
            </div>
        </div>
    {:else}
        <div
            class="text-center py-20 bg-muted/20 rounded-3xl border border-dashed border-border"
        >
            <h2 class="text-2xl font-bold">Compra não encontrada.</h2>
            <Button
                variant="link"
                onclick={() => goto("/compras")}
                class="mt-4"
            >
                Voltar para a lista de compras
            </Button>
        </div>
    {/if}
</div>
