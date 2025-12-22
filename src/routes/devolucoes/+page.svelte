<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "$lib/components/ui/label/index";
    import { Textarea } from "$lib/components/ui/textarea/index";
    import type { Produto } from "$lib/types";
    import db, { queryHelper } from "@/db/db.svelte";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import Truck from "@lucide/svelte/icons/truck";
    import Ban from "@lucide/svelte/icons/ban";
    import Search from "@lucide/svelte/icons/search";
    import X from "@lucide/svelte/icons/x";

    let produtos = $state<Array<Produto>>([]);
    let searchQuery = $state("");
    let filteredProdutos = $derived(
        produtos
            .filter(
                (p) =>
                    p.descricao
                        .toLowerCase()
                        .includes(searchQuery.toLowerCase()) ||
                    p.codigo.toLowerCase().includes(searchQuery.toLowerCase()),
            )
            .slice(0, 10),
    );

    let selectedProduto = $state<Produto | null>(null);
    let amount = $state(1);
    let observations = $state("");
    let loading = $state(false);

    async function load() {
        try {
            produtos = (await db.select(
                "SELECT * FROM produtos",
                [],
            )) as Array<Produto>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar produtos do banco de dados.");
        }
    }

    onMount(() => load());

    async function handleRegister(type: "devolucao" | "defeito") {
        if (!selectedProduto) {
            toast.error("Por favor, selecione um produto.");
            return;
        }

        loading = true;
        try {
            const dataToInsert = {
                produto_id: selectedProduto.id,
                quantidade: amount,
                tipo_movimentacao: type,
                observacoes: observations,
            };

            let q = queryHelper(dataToInsert);
            await db.execute(
                `INSERT INTO movimentacoes_estoque (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            // Important: We should also update the product's stock.
            // In a real app we might use a trigger or a transaction.
            // For now, let's just update it.
            if (type === "devolucao") {
                await db.execute(
                    "UPDATE produtos SET estoque_atual = estoque_atual + $1 WHERE id = $2",
                    [amount, selectedProduto.id],
                );
            } else if (type === "defeito") {
                // Maybe move to a different stock or just deduct?
                // In the original it seems it was just a register.
                // Let's assume for now it just records it.
            }

            toast.success("Devolução registrada com sucesso!");
            reset();
        } catch (e: any) {
            toast.error(e.message || "Erro ao registrar devolução");
            console.error(e);
        } finally {
            loading = false;
        }
    }

    function reset() {
        selectedProduto = null;
        amount = 1;
        observations = "";
        searchQuery = "";
    }
</script>

<div class="p-6 max-w-2xl mx-auto">
    <Card.Root class="overflow-hidden border-2 border-primary/20 shadow-xl">
        <Card.Header class="bg-primary/5 pb-8">
            <div class="flex justify-center mb-4">
                <div class="p-3 rounded-full bg-primary/10">
                    <Truck class="h-8 w-8 text-primary" />
                </div>
            </div>
            <Card.Title class="text-3xl text-center"
                >Registrar Devolução</Card.Title
            >
            <Card.Description class="text-center text-lg">
                Gerencie retornos de produtos e ajuste o estoque de forma
                simples.
            </Card.Description>
        </Card.Header>

        <Card.Content class="space-y-8 pt-8 px-10">
            <!-- Step 1: Find Product -->
            <div class="space-y-4">
                <Label class="text-lg font-semibold flex items-center gap-2">
                    <span
                        class="flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs"
                        >1</span
                    >
                    Encontre o produto
                </Label>

                {#if !selectedProduto}
                    <div class="relative">
                        <Search
                            class="absolute left-3 top-3 h-4 w-4 text-muted-foreground"
                        />
                        <Input
                            type="text"
                            placeholder="Digite o nome ou código do produto..."
                            class="pl-10 h-12 text-lg"
                            bind:value={searchQuery}
                        />

                        {#if searchQuery.length > 1}
                            <div
                                class="absolute z-10 w-full mt-2 bg-popover border rounded-md shadow-lg max-h-60 overflow-y-auto"
                            >
                                {#each filteredProdutos as p}
                                    <button
                                        class="w-full text-left px-4 py-3 hover:bg-accent hover:text-accent-foreground transition-colors border-b last:border-0"
                                        onclick={() => {
                                            selectedProduto = p;
                                            searchQuery = "";
                                        }}
                                    >
                                        <div class="font-bold">{p.codigo}</div>
                                        <div
                                            class="text-sm text-muted-foreground"
                                        >
                                            {p.descricao}
                                        </div>
                                    </button>
                                {:else}
                                    <div
                                        class="p-4 text-center text-muted-foreground"
                                    >
                                        Nenhum produto encontrado.
                                    </div>
                                {/each}
                            </div>
                        {/if}
                    </div>
                {:else}
                    <div
                        class="flex items-center justify-between p-4 rounded-lg bg-primary/5 border border-primary/20"
                    >
                        <div>
                            <div class="font-bold text-lg">
                                {selectedProduto.codigo}
                            </div>
                            <div class="text-muted-foreground">
                                {selectedProduto.descricao}
                            </div>
                        </div>
                        <Button
                            variant="ghost"
                            size="sm"
                            onclick={() => (selectedProduto = null)}
                        >
                            <X class="h-4 w-4" /> Alterar
                        </Button>
                    </div>
                {/if}
            </div>

            {#if selectedProduto}
                <!-- Step 2: Quantity -->
                <div
                    class="space-y-4 animate-in fade-in slide-in-from-top-4 duration-300"
                >
                    <Label
                        class="text-lg font-semibold flex items-center gap-2"
                    >
                        <span
                            class="flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs"
                            >2</span
                        >
                        Informe a quantidade
                    </Label>
                    <Input
                        type="number"
                        bind:value={amount}
                        min="1"
                        class="h-12 text-xl font-bold text-center"
                    />
                </div>

                <!-- Step 3: Observations -->
                <div
                    class="space-y-4 animate-in fade-in slide-in-from-top-4 duration-500"
                >
                    <Label
                        class="text-lg font-semibold flex items-center gap-2"
                    >
                        <span
                            class="flex items-center justify-center w-6 h-6 rounded-full bg-primary text-primary-foreground text-xs"
                            >3</span
                        >
                        Observações (Opcional)
                    </Label>
                    <Textarea
                        placeholder="Ex: Cliente desistiu da compra / Produto com costura solta..."
                        bind:value={observations}
                        class="min-h-[100px] text-lg"
                    />
                </div>

                <!-- Step 4: Reason/Action -->
                <div
                    class="space-y-6 pt-4 animate-in fade-in slide-in-from-top-4 duration-700"
                >
                    <div
                        class="text-center text-lg font-semibold text-muted-foreground"
                    >
                        Qual o motivo do retorno?
                    </div>
                    <div class="grid grid-cols-2 gap-6">
                        <Button
                            variant="default"
                            class="h-24 flex-col gap-2 text-lg shadow-lg hover:shadow-xl transition-all"
                            disabled={loading}
                            onclick={() => handleRegister("devolucao")}
                        >
                            <Truck class="h-6 w-6" />
                            <span>Devolução Normal</span>
                        </Button>
                        <Button
                            variant="destructive"
                            class="h-24 flex-col gap-2 text-lg shadow-lg hover:shadow-xl transition-all"
                            disabled={loading}
                            onclick={() => handleRegister("defeito")}
                        >
                            <Ban class="h-6 w-6" />
                            <span>Produto com Defeito</span>
                        </Button>
                    </div>
                    {#if loading}
                        <div class="flex justify-center">
                            <div
                                class="animate-spin rounded-full h-8 w-8 border-b-2 border-primary"
                            ></div>
                        </div>
                    {/if}
                </div>
            {/if}
        </Card.Content>
    </Card.Root>
</div>
