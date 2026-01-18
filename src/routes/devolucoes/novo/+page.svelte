<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select/index.js";
    import type { Produto, ProdutoVariacao } from "@/types";
    import db from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Ban from "@lucide/svelte/icons/ban";
    import Truck from "@lucide/svelte/icons/truck";
    import X from "@lucide/svelte/icons/x";
    import { onMount, untrack } from "svelte";
    import { toast } from "svelte-sonner";

    import * as Command from "@/components/ui/command/index.js";
    import * as Popover from "@/components/ui/popover/index.js";
    import Check from "@lucide/svelte/icons/check";

    let loading = $state(false);
    let open = $state(false);
    let products = $state<Produto[]>([]);
    let variations = $state<ProdutoVariacao[]>([]);
    let searchTerm = $state("");

    let selectedProduto = $state<Produto | null>(null);
    let selectedVariacaoId = $state<string>("-1");
    let quantity = $state(1);

    const filteredProducts = $derived(
        products
            .filter(
                (p) =>
                    p.descricao
                        .toLowerCase()
                        .includes(searchTerm.toLowerCase()) ||
                    p.codigo.toLowerCase().includes(searchTerm.toLowerCase()),
            )
            .slice(0, 10),
    );

    async function loadProducts() {
        try {
            products = await db.select<Produto>(
                "SELECT * FROM produtos ORDER BY descricao ASC",
                [],
            );
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar produtos.");
        }
    }

    $effect(() => {
        if (selectedProduto) {
            untrack(async () => {
                try {
                    variations = await db.select<ProdutoVariacao>(
                        "SELECT * FROM produto_variacoes WHERE produto_id = $1",
                        [selectedProduto?.id],
                    );
                    if (variations.length > 0) {
                        selectedVariacaoId = String(variations[0].id);
                    }
                } catch (e: any) {
                    console.error(e);
                    toast.error("Erro ao carregar variações.");
                }
            });
        } else {
            variations = [];
            selectedVariacaoId = "-1";
        }
    });

    async function handleRegister(type: "devolucao" | "perda") {
        if (!selectedProduto || selectedVariacaoId === "-1") {
            toast.error("Por favor, selecione um produto e sua variação.");
            return;
        }

        loading = true;
        try {
            const movementData = {
                tipo: type, // 'devolucao' or 'perda'
                variacao_id: parseInt(selectedVariacaoId),
                quantidade: quantity,
                data_movimento: new Date().toISOString(),
            };

            // 1. Insert Movement Record
            const q = {
                columns: "tipo, variacao_id, quantidade, data_movimento",
                placeholders: "$1, $2, $3, $4",
                values: [
                    movementData.tipo,
                    movementData.variacao_id,
                    movementData.quantidade,
                    movementData.data_movimento,
                ],
            };

            await db.execute(
                `INSERT INTO movimentacoes_estoque (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            // 2. Update Stock
            // If it's a normal return, we ADD to stock.
            // If it's a defect (loss), we only record it (already recorded in movements).
            // Usually, losses (perda) should subtract from stock, but this app seems to use 'devolucao'
            // to bring items back from 'saida_venda'.
            if (type === "devolucao") {
                await db.execute(
                    "UPDATE produto_variacoes SET estoque_atual = estoque_atual + $1 WHERE id = $2",
                    [quantity, movementData.variacao_id],
                );
            }

            toast.success(
                type === "devolucao"
                    ? "Devolução registrada!"
                    : "Perda registrada!",
            );
            goto("/devolucoes");
        } catch (e: any) {
            toast.error(e.message || "Erro ao registrar.");
            console.error(e);
        } finally {
            loading = false;
        }
    }

    onMount(() => loadProducts());
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/devolucoes")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Nova Devolução
            </h1>
        </div>
    </div>

    <Card.Root class="shadow-xl border-2 border-primary/10 overflow-hidden">
        <Card.Header class="bg-primary/5 pb-8 pt-6 border-b">
            <div class="flex justify-center mb-4">
                <div class="p-3 rounded-full bg-primary/10">
                    <Truck class="h-8 w-8 text-primary" />
                </div>
            </div>
            <Card.Title class="text-2xl text-center">
                Registrar Retorno
            </Card.Title>
            <Card.Description class="text-center">
                Guia passo a passo para ajuste de estoque.
            </Card.Description>
        </Card.Header>

        <Card.Content class="p-10 space-y-10">
            <!-- Step 1: Product Selection -->
            <div class="space-y-4 w-full">
                <div class="flex items-center gap-2">
                    <span
                        class="flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs font-bold"
                    >
                        1
                    </span>
                    <Label class="text-lg font-bold">Selecione o Produto</Label>
                </div>

                {#if !selectedProduto}
                    <Popover.Root open={searchTerm.length > 0}>
                        <Popover.Trigger class="w-full">
                            <!-- <Button
                                variant="outline"
                                role="combobox"
                                aria-expanded={open}
                                class="w-full justify-between h-14 text-lg bg-muted/20 border-none shadow-inner px-4 hover:bg-muted/30"
                            >
                                <div class="flex items-center gap-3">
                                    <Search
                                        class="h-5 w-5 text-muted-foreground"
                                    />
                                    <span
                                        class="text-muted-foreground font-normal"
                                    >
                                        {searchTerm ||
                                            "Pesquise por nome ou código..."}
                                    </span>
                                </div>
                                <ChevronsUpDown
                                    class="ml-2 h-4 w-4 shrink-0 opacity-50"
                                />
                            </Button> -->

                            <Input
                                onclick={(e) => e.stopPropagation()}
                                placeholder="Pesquisar produto..."
                                bind:value={searchTerm}
                            />
                        </Popover.Trigger>
                        <Popover.Content
                            class=" p-0"
                            align="center"
                            onOpenAutoFocus={(e) => e.preventDefault()}
                        >
                            <Command.Root>
                                <Command.List class="?max-h-75 overflow-y-auto">
                                    <Command.Empty>
                                        Nenhum produto encontrado.
                                    </Command.Empty>
                                    <Command.Group>
                                        {#each filteredProducts as p}
                                            <Command.Item
                                                value={p.descricao +
                                                    " " +
                                                    p.codigo}
                                                onSelect={() => {
                                                    selectedProduto = p;
                                                    searchTerm = "";
                                                    open = false;
                                                }}
                                                class="flex flex-col items-start gap-1 p-3 cursor-pointer"
                                            >
                                                <div
                                                    class="flex items-center justify-between w-full"
                                                >
                                                    <span
                                                        class="font-black text-primary uppercase text-[10px] tracking-widest"
                                                    >
                                                        {p.codigo}
                                                    </span>
                                                    {#if selectedProduto?.id === p.id}
                                                        <Check
                                                            class="h-4 w-4 text-primary"
                                                        />
                                                    {/if}
                                                </div>
                                                <span
                                                    class="text-sm font-medium"
                                                >
                                                    {p.descricao}
                                                </span>
                                            </Command.Item>
                                        {/each}
                                    </Command.Group>
                                </Command.List>
                            </Command.Root>
                        </Popover.Content>
                    </Popover.Root>
                {:else}
                    <div
                        class="flex items-center justify-between p-5 rounded-2xl bg-primary/5 border-2 border-primary/20 animate-in slide-in-from-left-4 duration-300"
                    >
                        <div class="flex flex-col">
                            <span
                                class="text-xs font-black text-primary uppercase tracking-widest leading-none mb-1"
                                >{selectedProduto.codigo}</span
                            >
                            <span class="text-xl font-bold text-foreground"
                                >{selectedProduto.descricao}</span
                            >
                        </div>
                        <Button
                            variant="ghost"
                            size="icon"
                            onclick={() => (selectedProduto = null)}
                            class="rounded-full hover:bg-destructive/10 hover:text-destructive"
                        >
                            <X class="h-5 w-5" />
                        </Button>
                    </div>
                {/if}
            </div>

            {#if selectedProduto}
                <div
                    class="space-y-10 animate-in fade-in slide-in-from-bottom-4 duration-500"
                >
                    <!-- Step 2: Variation and Quantity -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <div class="space-y-4">
                            <div class="flex items-center gap-2">
                                <span
                                    class="flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs font-bold"
                                    >2</span
                                >
                                <Label class="text-lg font-bold">Variação</Label
                                >
                            </div>
                            <Select.Root
                                type="single"
                                bind:value={selectedVariacaoId}
                            >
                                <Select.Trigger
                                    class="h-14 text-lg font-bold w-full bg-muted/20 border-none"
                                >
                                    {@const v = variations.find(
                                        (v) =>
                                            String(v.id) === selectedVariacaoId,
                                    )}
                                    {v
                                        ? `${v.tamanho} / ${v.cor}`
                                        : "Selecione..."}
                                </Select.Trigger>
                                <Select.Content>
                                    {#each variations as v}
                                        <Select.Item
                                            value={String(v.id)}
                                            class="text-lg"
                                        >
                                            {v.tamanho} / {v.cor}
                                            <span
                                                class="ml-2 text-xs text-muted-foreground"
                                                >(Estoque: {v.estoque_atual})</span
                                            >
                                        </Select.Item>
                                    {/each}
                                </Select.Content>
                            </Select.Root>
                        </div>

                        <div class="space-y-4">
                            <div class="flex items-center gap-2">
                                <span
                                    class="flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs font-bold"
                                    >3</span
                                >
                                <Label class="text-lg font-bold"
                                    >Quantidade</Label
                                >
                            </div>
                            <Input
                                type="number"
                                min="1"
                                bind:value={quantity}
                                class="h-14 text-2xl font-black text-center bg-muted/20 border-none"
                            />
                        </div>
                    </div>

                    <!-- Step 3: Type Selection -->
                    <div class="pt-6 border-t space-y-6">
                        <div
                            class="text-center font-black uppercase tracking-widest text-muted-foreground text-sm"
                        >
                            Qual o motivo do retorno?
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <Button
                                variant="default"
                                class="h-28 flex-col gap-2 rounded-2xl shadow-lg hover:shadow-primary/20 transition-all border-b-4 border-primary/50"
                                disabled={loading}
                                onclick={() => handleRegister("devolucao")}
                            >
                                <Truck class="h-7 w-7" />
                                <div class="flex flex-col">
                                    <span class="text-lg font-black uppercase"
                                        >Devolução Normal</span
                                    >
                                    <span class="text-[10px] opacity-70"
                                        >SOMA AO ESTOQUE ATUAL</span
                                    >
                                </div>
                            </Button>

                            <Button
                                variant="destructive"
                                class="h-28 flex-col gap-2 rounded-2xl shadow-lg hover:shadow-destructive/20 transition-all border-b-4 border-destructive/50"
                                disabled={loading}
                                onclick={() => handleRegister("perda")}
                            >
                                <Ban class="h-7 w-7" />
                                <div class="flex flex-col">
                                    <span class="text-lg font-black uppercase"
                                        >Vício / Defeito</span
                                    >
                                    <span class="text-[10px] opacity-70"
                                        >REGISTRA APENAS A PERDA</span
                                    >
                                </div>
                            </Button>
                        </div>
                    </div>
                </div>
            {/if}
        </Card.Content>
    </Card.Root>
</div>
