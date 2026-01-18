<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import * as Table from "@/components/ui/table/index.js";
    import type { Produto, ProdutoVariacao, Tag } from "@/types";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Layers from "@lucide/svelte/icons/layers";
    import Package from "@lucide/svelte/icons/package";
    import TrendingUp from "@lucide/svelte/icons/trending-up";
    import { onMount } from "svelte";

    let loading = $state(true);
    let produto = $state<(Produto & { grupo_descricao?: string }) | null>(null);
    let variacoes = $state<Array<ProdutoVariacao>>([]);
    let tags = $state<Array<Tag>>([]);

    const id = Id.id;

    async function load() {
        loading = true;
        try {
            const [pRes, vRes, tRes] = await Promise.all([
                db.select(
                    `
                    SELECT p.*, pg.descricao as grupo_descricao
                    FROM produtos p
                    LEFT JOIN produto_grupos pg ON p.grupo_id = pg.id
                    WHERE p.id = $1
                `,
                    [id],
                ) as any,
                db.select(
                    "SELECT * FROM produto_variacoes WHERE produto_id = $1 ORDER BY sku ASC",
                    [id],
                ) as any,
                db.select(
                    `
                    SELECT t.*
                    FROM tags t
                    JOIN produto_tags pt ON t.id = pt.tag_id
                    WHERE pt.produto_id = $1
                `,
                    [id],
                ) as any,
            ]);

            if (pRes && pRes[0]) {
                produto = pRes[0];
            } else {
                goto("/produtos");
            }
            variacoes = vRes;
            tags = tRes;
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

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center gap-4">
        <Button variant="ghost" size="icon" onclick={() => goto("/produtos")}>
            <ArrowLeft class="h-5 w-5" />
        </Button>
        <h1 class="text-3xl font-bold tracking-tight">Detalhes do Produto</h1>

        {#if produto}
            <div class="ml-auto">
                <Button
                    variant="outline"
                    onclick={() => {
                        Id.id = id;
                        goto(`/produtos/id/edit`);
                    }}
                >
                    Editar Produto
                </Button>
            </div>
        {/if}
    </div>

    {#if loading}
        <div class="flex h-100 items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else if produto}
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Main Info -->
            <Card.Root class="lg:col-span-2 shadow-sm">
                <Card.Header class="pb-4 border-b">
                    <div
                        class="flex items-center gap-2 text-muted-foreground text-xs uppercase font-black tracking-widest mb-1"
                    >
                        <Package class="h-3 w-3 text-primary" />
                        Produto {produto.codigo}
                    </div>
                    <Card.Title class="text-4xl font-black text-primary">
                        {produto.descricao}
                    </Card.Title>
                    <div class="flex gap-2 pt-2">
                        <span
                            class="inline-flex items-center rounded-full bg-green-400/10 px-2.5 py-0.5 text-xs font-semibold text-green-400 border-green-400/20 border"
                        >
                            {produto.grupo_descricao || "Sem Grupo"}
                        </span>

                        {#each tags as tag}
                            <span
                                class="inline-flex items-center rounded-full bg-primary/10 px-2.5 py-0.5 text-xs font-semibold text-primary border-primary/20 border"
                            >
                                {tag.nome}
                            </span>
                        {/each}
                    </div>
                </Card.Header>
                <Card.Content class="pt-6 space-y-8">
                    <!-- Prices -->
                    <div
                        class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4"
                    >
                        <div
                            class="p-4 bg-muted/30 rounded-xl border border-border"
                        >
                            <span
                                class="text-[10px] font-black uppercase text-muted-foreground tracking-widest"
                            >
                                Preço Custo
                            </span>
                            <p class="text-xl font-bold text-foreground">
                                {formatCurrency(produto.preco_custo)}
                            </p>
                        </div>

                        <div
                            class="p-4 bg-muted/30 rounded-xl border border-border"
                        >
                            <span
                                class="text-[10px] font-black uppercase text-muted-foreground tracking-widest"
                            >
                                Preço Mínimo
                            </span>
                            <p class="text-xl font-bold text-foreground">
                                {formatCurrency(produto.preco_minimo)}
                            </p>
                        </div>

                        <div
                            class="p-4 bg-primary/5 rounded-xl border border-primary/20"
                        >
                            <span
                                class="text-[10px] font-black uppercase text-primary tracking-widest"
                            >
                                Venda Tabela A
                            </span>
                            <p class="text-xl font-black text-primary">
                                {formatCurrency(produto.preco_venda)}
                            </p>
                        </div>
                        <div
                            class="p-4 bg-primary/5 rounded-xl border border-primary/20"
                        >
                            <span
                                class="text-[10px] font-black uppercase text-primary tracking-widest"
                            >
                                Venda Tabela B
                            </span>
                            <p class="text-xl font-black text-primary">
                                {formatCurrency(produto.preco_venda_b)}
                            </p>
                        </div>
                    </div>

                    <!-- Variations -->
                    <div class="space-y-4">
                        <div class="flex items-center gap-2">
                            <Layers class="h-5 w-5 text-primary" />
                            <h3 class="font-bold text-lg">
                                Variações e Estoque
                            </h3>
                        </div>
                        <div
                            class="rounded-xl border border-border overflow-hidden shadow-xs bg-background text-sm"
                        >
                            <Table.Root>
                                <Table.Header class="bg-muted/50">
                                    <Table.Row>
                                        <Table.Head>SKU</Table.Head>
                                        <Table.Head>Tamanho</Table.Head>
                                        <Table.Head>Cor</Table.Head>
                                        <Table.Head class="text-right">
                                            Estoque Atual
                                        </Table.Head>
                                    </Table.Row>
                                </Table.Header>
                                <Table.Body>
                                    {#each variacoes as varia}
                                        <Table.Row>
                                            <Table.Cell
                                                class="font-mono font-bold text-muted-foreground"
                                            >
                                                {varia.sku || "—"}
                                            </Table.Cell>
                                            <Table.Cell>
                                                {varia.tamanho || "—"}
                                            </Table.Cell>
                                            <Table.Cell>
                                                <div
                                                    class="flex items-center gap-2"
                                                >
                                                    {#if varia.cor}
                                                        <div
                                                            class="h-3 w-3 rounded-full border border-border"
                                                            style="background-color: {varia.cor.toLowerCase()}"
                                                        ></div>
                                                    {/if}
                                                    {varia.cor || "—"}
                                                </div>
                                            </Table.Cell>
                                            <Table.Cell
                                                class="text-right font-black text-primary"
                                            >
                                                {varia.estoque_atual}
                                            </Table.Cell>
                                        </Table.Row>
                                    {:else}
                                        <Table.Row>
                                            <Table.Cell
                                                colspan={4}
                                                class="text-center py-10 text-muted-foreground italic"
                                            >
                                                Nenhuma variação cadastrada.
                                            </Table.Cell>
                                        </Table.Row>
                                    {/each}
                                </Table.Body>
                            </Table.Root>
                        </div>
                    </div>
                </Card.Content>
            </Card.Root>

            <!-- Sidebar / Stats -->
            <div class="space-y-6">
                <Card.Root
                    class="bg-primary/5 text-primary shadow-lg border-primary/20"
                >
                    <Card.Header>
                        <Card.Title>Estoque Total</Card.Title>
                    </Card.Header>
                    <Card.Content>
                        <div class="flex flex-col gap-1">
                            <span
                                class="text-xs uppercase font-black tracking-widest opacity-70"
                            >
                                Soma das variações
                            </span>
                            <p class="text-6xl font-black">
                                {variacoes.reduce(
                                    (acc, v) => acc + v.estoque_atual,
                                    0,
                                )}
                            </p>
                        </div>
                        <div
                            class="mt-6 pt-4 border-t border-primary-foreground/20 text-sm flex justify-between"
                        >
                            <span class="opacity-70">Total de Variações</span>
                            <span class="font-bold">{variacoes.length}</span>
                        </div>
                    </Card.Content>
                </Card.Root>

                <Card.Root class="shadow-sm">
                    <Card.Header>
                        <Card.Title class="flex items-center gap-2">
                            <TrendingUp class="h-5 w-5 text-primary" />
                            Rentabilidade Est.
                        </Card.Title>
                    </Card.Header>
                    <Card.Content class="space-y-4 text-sm">
                        <div
                            class="flex justify-between items-center bg-muted/30 p-3 rounded-lg border"
                        >
                            <span class="text-muted-foreground">
                                Margem (Tab A)
                            </span>
                            <span class="font-bold text-emerald-600">
                                {produto.preco_custo
                                    ? (
                                          (((produto.preco_venda || 0) -
                                              produto.preco_custo) /
                                              (produto.preco_venda || 1)) *
                                          100
                                      ).toFixed(1) + "%"
                                    : "—"}
                            </span>
                        </div>
                        <div
                            class="flex justify-between items-center bg-muted/30 p-3 rounded-lg border"
                        >
                            <span class="text-muted-foreground">
                                Margem (Tab B)
                            </span>
                            <span class="font-bold text-emerald-600">
                                {produto.preco_custo
                                    ? (
                                          (((produto.preco_venda_b || 0) -
                                              produto.preco_custo) /
                                              (produto.preco_venda_b || 1)) *
                                          100
                                      ).toFixed(1) + "%"
                                    : "—"}
                            </span>
                        </div>
                    </Card.Content>
                </Card.Root>
            </div>
        </div>
    {/if}
</div>
