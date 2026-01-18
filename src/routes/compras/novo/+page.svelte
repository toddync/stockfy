<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import * as Select from "@/components/ui/select";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import { Textarea } from "@/components/ui/textarea/index";
    import * as Table from "@/components/ui/table/index.js";
    import type { Fornecedor, CompraItem, Produto } from "@/types";
    import db, { queryHelper } from "@/db/db.svelte";
    import Needed from "@/components/needed.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Plus from "@lucide/svelte/icons/plus";
    import ShoppingBag from "@lucide/svelte/icons/shopping-bag";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let fornecedores = $state<Array<Fornecedor>>([]);
    let produtos = $state<Array<Produto>>([]);

    let compraData = $state({
        numero_nota: "",
        fornecedor_id: "-1",
        data_emissao: new Date().toISOString().split("T")[0],
        data_entrada: new Date().toISOString().split("T")[0],
        observacoes: "",
    });

    let items = $state<
        Array<Partial<CompraItem> & { descricao?: string; codigo?: string }>
    >([]);

    let currentItem = $state({
        produto_id: "-1",
        quantidade: 1,
        preco_custo_un: 0,
    });

    let valor_total = $derived(
        items.reduce(
            (acc, item) =>
                acc + (item.quantidade || 0) * (item.preco_custo_un || 0),
            0,
        ),
    );

    async function addItem() {
        if (currentItem.produto_id === "-1" || currentItem.quantidade <= 0) {
            toast.error("Selecione um produto e quantidade válidos.");
            return;
        }

        const produto = produtos.find(
            (p) => String(p.id) === currentItem.produto_id,
        );
        if (!produto) return;

        items.push({
            produto_id: produto.id,
            quantidade: currentItem.quantidade,
            preco_custo_un: currentItem.preco_custo_un,
            descricao: produto.descricao,
            codigo: produto.codigo,
            valor_total: currentItem.quantidade * currentItem.preco_custo_un,
        });

        // Reset item selector
        currentItem = {
            produto_id: "-1",
            quantidade: 1,
            preco_custo_un: 0,
        };
    }

    function removeItem(index: number) {
        items.splice(index, 1);
    }

    async function save() {
        if (compraData.fornecedor_id === "-1" || items.length === 0) {
            toast.error(
                "Selecione o fornecedor e adicione pelo menos um item.",
            );
            return;
        }

        try {
            const compraToSave = {
                numero_nota: compraData.numero_nota || null,
                fornecedor_id: parseInt(compraData.fornecedor_id),
                data_emissao: compraData.data_emissao,
                data_entrada: compraData.data_entrada || null,
                valor_total: valor_total,
                observacoes: compraData.observacoes || null,
            };

            const savedCompra = await db.execute(
                `INSERT INTO compras (${queryHelper(compraToSave).columns}) VALUES (${queryHelper(compraToSave).placeholders})`,
                queryHelper(compraToSave).values,
            );

            const compraId = savedCompra.lastInsertId;

            for (const item of items) {
                const itemToSave = {
                    compra_id: compraId!,
                    produto_id: item.produto_id!,
                    quantidade: item.quantidade!,
                    preco_custo_un: item.preco_custo_un!,
                    valor_total:
                        (item.quantidade || 0) * (item.preco_custo_un || 0),
                };
                let qItem = queryHelper(itemToSave);
                await db.execute(
                    `INSERT INTO compra_itens (${qItem.columns}) VALUES (${qItem.placeholders})`,
                    qItem.values,
                );
            }

            toast.success("Compra registrada com sucesso!");
            goto("/compras");
        } catch (e: any) {
            toast.error(e.message || "Erro ao registrar compra");
            console.error(e);
        }
    }

    async function loadAuxiliaryData() {
        try {
            const [f, p] = await Promise.all([
                db.select(
                    "SELECT id, razao_social FROM fornecedores ORDER BY razao_social",
                    [],
                ),
                db.select(
                    "SELECT id, codigo, descricao, preco_custo FROM produtos ORDER BY descricao",
                    [],
                ),
            ]);
            fornecedores = f as Array<Fornecedor>;
            produtos = p as Array<Produto>;
        } catch (e: any) {
            console.error("Erro ao carregar dados auxiliares:", e);
        }
    }

    onMount(() => loadAuxiliaryData());

    function formatCurrency(value: number) {
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }
</script>

<div class="p-6 w-full space-y-6">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/compras")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Nova Compra
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6">
            <Save class="h-4 w-4" />
            Salvar Compra
        </Button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card.Root class="md:col-span-2 shadow-sm">
            <Card.Header>
                <Card.Title>Informações do Fornecedor</Card.Title>
                <Card.Description
                    >Dados principais da nota e fornecedor.</Card.Description
                >
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="num">Nº da Nota</Label>
                        <Input
                            id="num"
                            bind:value={compraData.numero_nota}
                            placeholder="000.000.000"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="forn">Fornecedor <Needed /></Label>
                        <Select.Root
                            type="single"
                            bind:value={compraData.fornecedor_id}
                        >
                            <Select.Trigger class="w-full">
                                {fornecedores.find(
                                    (f) =>
                                        String(f.id) ===
                                        compraData.fornecedor_id,
                                )?.razao_social || "Selecione o fornecedor..."}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1"
                                    >Selecione o fornecedor...</Select.Item
                                >
                                {#each fornecedores as fornecedor}
                                    <Select.Item value={String(fornecedor.id)}
                                        >{fornecedor.razao_social}</Select.Item
                                    >
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="emissao">Data de Emissão</Label>
                        <Input
                            id="emissao"
                            type="date"
                            bind:value={compraData.data_emissao}
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="entrada">Data de Entrada</Label>
                        <Input
                            id="entrada"
                            type="date"
                            bind:value={compraData.data_entrada}
                        />
                    </div>
                </div>

                <div class="grid gap-2">
                    <Label for="obs">Observações</Label>
                    <Textarea
                        id="obs"
                        bind:value={compraData.observacoes}
                        placeholder="Observações adicionais sobre a compra..."
                        rows={3}
                    />
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root class="shadow-sm border-primary/20 bg-primary/5">
            <Card.Header>
                <Card.Title>Total da Compra</Card.Title>
                <Card.Description>Soma dos itens adicionados.</Card.Description>
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="flex justify-between items-center text-sm">
                    <span class="text-muted-foreground">Itens registrados:</span
                    >
                    <span class="font-bold">{items.length}</span>
                </div>
                <div class="border-t border-primary/10 pt-4">
                    <div class="flex flex-col gap-1">
                        <span
                            class="text-lg font-bold text-muted-foreground uppercase text-[10px] tracking-widest"
                            >Valor total da nota</span
                        >
                        <span class="text-4xl font-black text-primary"
                            >{formatCurrency(valor_total)}</span
                        >
                    </div>
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root class="md:col-span-3 shadow-sm border-t-4 border-t-primary">
            <Card.Header>
                <Card.Title class="flex items-center gap-2">
                    <ShoppingBag class="h-6 w-6 text-primary" />
                    Itens da Compra
                </Card.Title>
                <Card.Description
                    >Adicione os produtos recebidos nesta nota.</Card.Description
                >
            </Card.Header>
            <Card.Content class="space-y-6">
                <!-- Item Adder -->
                <div
                    class="grid grid-cols-1 md:grid-cols-4 gap-4 items-end bg-muted/40 p-4 rounded-xl border border-dashed border-primary/20"
                >
                    <div class="grid gap-2 md:col-span-2">
                        <Label>Produto</Label>
                        <Select.Root
                            type="single"
                            bind:value={currentItem.produto_id}
                            onValueChange={(v) => {
                                const p = produtos.find(
                                    (p) => String(p.id) === v,
                                );
                                if (p)
                                    currentItem.preco_custo_un =
                                        p.preco_custo || 0;
                            }}
                        >
                            <Select.Trigger class="w-full bg-background">
                                {produtos.find(
                                    (p) =>
                                        String(p.id) === currentItem.produto_id,
                                )?.descricao || "Pesquisar produto..."}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1"
                                    >Pesquisar produto...</Select.Item
                                >
                                {#each produtos as p}
                                    <Select.Item value={String(p.id)}
                                        >{p.codigo} - {p.descricao}</Select.Item
                                    >
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>
                    <div class="grid gap-2">
                        <Label>Quantidade</Label>
                        <Input
                            type="number"
                            min="1"
                            bind:value={currentItem.quantidade}
                            class="bg-background"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label>Custo Unitário (R$)</Label>
                        <Input
                            type="number"
                            step="0.01"
                            bind:value={currentItem.preco_custo_un}
                            class="bg-background"
                        />
                    </div>
                    <div class="md:col-span-4 flex justify-end">
                        <Button
                            variant="secondary"
                            onclick={addItem}
                            class="gap-2 shadow-sm"
                        >
                            <Plus class="h-4 w-4" />
                            Adicionar Item à Nota
                        </Button>
                    </div>
                </div>

                <Table.Root>
                    <Table.Header>
                        <Table.Row class="bg-muted/30">
                            <Table.Head>Cód.</Table.Head>
                            <Table.Head>Descrição</Table.Head>
                            <Table.Head class="text-center">Qtd</Table.Head>
                            <Table.Head class="text-right"
                                >Custo Unit.</Table.Head
                            >
                            <Table.Head class="text-right">Subtotal</Table.Head>
                            <Table.Head class="w-10"></Table.Head>
                        </Table.Row>
                    </Table.Header>
                    <Table.Body>
                        {#each items as item, i}
                            <Table.Row
                                class="hover:bg-muted/50 transition-colors"
                            >
                                <Table.Cell
                                    class="font-mono text-xs text-muted-foreground"
                                    >{item.codigo}</Table.Cell
                                >
                                <Table.Cell class="font-medium"
                                    >{item.descricao}</Table.Cell
                                >
                                <Table.Cell class="text-center font-bold"
                                    >{item.quantidade}</Table.Cell
                                >
                                <Table.Cell class="text-right"
                                    >{formatCurrency(
                                        item.preco_custo_un || 0,
                                    )}</Table.Cell
                                >
                                <Table.Cell
                                    class="text-right font-black text-primary"
                                >
                                    {formatCurrency(
                                        (item.quantidade || 0) *
                                            (item.preco_custo_un || 0),
                                    )}
                                </Table.Cell>
                                <Table.Cell>
                                    <Button
                                        variant="ghost"
                                        size="icon"
                                        onclick={() => removeItem(i)}
                                        class="hover:text-red-500"
                                    >
                                        <Trash2 class="h-4 w-4" />
                                    </Button>
                                </Table.Cell>
                            </Table.Row>
                        {:else}
                            <Table.Row>
                                <Table.Cell
                                    colspan={6}
                                    class="text-center py-16 text-muted-foreground italic"
                                >
                                    <div
                                        class="flex flex-col items-center gap-2 opacity-50"
                                    >
                                        <ShoppingBag class="h-10 w-10 mb-2" />
                                        <span
                                            >Nenhum item adicionado à nota
                                            ainda.</span
                                        >
                                    </div>
                                </Table.Cell>
                            </Table.Row>
                        {/each}
                    </Table.Body>
                </Table.Root>
            </Card.Content>
        </Card.Root>
    </div>
</div>
