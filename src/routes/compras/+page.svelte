<script lang="ts">
    import { Button } from "$lib/components/ui/button/index";
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "$lib/components/ui/label/index";
    import * as Table from "$lib/components/ui/table/index.js";
    import type { CompraItem, Fornecedor, Produto } from "$lib/types";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import ShoppingBag from "@lucide/svelte/icons/shopping-bag";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import db, { queryHelper } from "@/db/db.svelte";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let compras = $state<Array<any>>([]);
    let fornecedores = $state<Array<Fornecedor>>([]);
    let produtos = $state<Array<Produto>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredCompras = $derived(
        compras.filter(
            (c) =>
                c.numero_pedido
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                c.fornecedor_razao_social
                    ?.toLowerCase()
                    .includes(searchQuery.toLowerCase()),
        ),
    );

    // Form state for a new Compra
    let compraData = $state({
        numero_pedido: "",
        fornecedor_id: 0,
        data_pedido: new Date().toISOString().split("T")[0],
        situacao: "Pendente",
        observacoes: "",
    });

    // Form state for items within a Compra
    let items = $state<
        Array<Partial<CompraItem> & { descricao?: string; codigo?: string }>
    >([]);
    let currentItem = $state({
        produto_id: 0,
        quantidade: 1,
        preco_compra: 0,
        desconto: 0,
    });

    let totalPrice = $derived(
        items.reduce((acc, item) => acc + (item.valor_total || 0), 0),
    );

    async function addItem() {
        if (!currentItem.produto_id || currentItem.quantidade <= 0) {
            toast.error("Selecione um produto e quantidade válidos.");
            return;
        }

        const produto = produtos.find((p) => p.id === currentItem.produto_id);
        if (!produto) return;

        const valor_total =
            currentItem.quantidade *
            currentItem.preco_compra *
            (1 - currentItem.desconto / 100);

        items.push({
            ...currentItem,
            valor_total,
            descricao: produto.descricao,
            codigo: produto.codigo,
        });

        // Reset current item form
        currentItem = {
            produto_id: 0,
            quantidade: 1,
            preco_compra: 0,
            desconto: 0,
        };
    }

    function removeItem(index: number) {
        items.splice(index, 1);
    }

    async function save() {
        if (!compraData.fornecedor_id || items.length === 0) {
            toast.error("Preencha o fornecedor e adicione pelo menos um item.");
            return;
        }

        try {
            // First, insert the compra
            const compraToInsert = {
                ...compraData,
                valor_total_pedido: totalPrice,
                valor_total_nota: totalPrice,
            };

            let q = queryHelper(compraToInsert);
            const res = (await db.execute(
                `INSERT INTO compras (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            )) as any;
            const compraId = res.lastInsertId;

            // Then, insert the items
            for (const item of items) {
                const itemToInsert = {
                    compra_id: compraId,
                    produto_id: item.produto_id,
                    variacao_id: item.variacao_id || null,
                    quantidade: item.quantidade,
                    preco_compra: item.preco_compra,
                    desconto: item.desconto || 0,
                    valor_total: item.valor_total,
                };
                let qi = queryHelper(itemToInsert);
                await db.execute(
                    `INSERT INTO compra_itens (${qi.columns}) VALUES (${qi.placeholders})`,
                    qi.values,
                );
            }

            toast.success("Compra realizada com sucesso!");
            dialog = null;
            await load();
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar compra");
            console.error(e);
        }
    }

    async function load() {
        try {
            compras = (await db.select(
                `
                SELECT c.*, f.razao_social as fornecedor_razao_social
                FROM compras c
                JOIN fornecedores f ON c.fornecedor_id = f.id
            `,
                [],
            )) as Array<any>;

            fornecedores = (await db.select(
                "SELECT * FROM fornecedores",
                [],
            )) as Array<Fornecedor>;
            produtos = (await db.select(
                "SELECT * FROM produtos",
                [],
            )) as Array<Produto>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados do banco de dados.");
        }
    }

    onMount(() => load());

    function formatCurrency(value: number) {
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }

    function resetForm() {
        compraData = {
            numero_pedido: "",
            fornecedor_id: 0,
            data_pedido: new Date().toISOString().split("T")[0],
            situacao: "Pendente",
            observacoes: "",
        };
        items = [];
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <ShoppingBag class="h-8 w-8 text-primary" />
                Compras & Pedidos
            </Card.Title>
            <Card.Description>
                Gerencie as entradas de estoque e pedidos aos fornecedores.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                resetForm();
                dialog = "new";
            }}
        >
            Nova compra
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
                    placeholder="Pesquisar por pedido ou fornecedor..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Nº Pedido</Table.Head>
                    <Table.Head>Fornecedor</Table.Head>
                    <Table.Head>Data</Table.Head>
                    <Table.Head>Valor Total</Table.Head>
                    <Table.Head>Situação</Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredCompras as compra (compra.id)}
                    <Table.Row>
                        <Table.Cell class="font-bold">
                            {compra.numero_pedido}
                        </Table.Cell>
                        <Table.Cell>{compra.fornecedor_razao_social}</Table.Cell
                        >
                        <Table.Cell>
                            {new Date(compra.data_pedido).toLocaleDateString(
                                "pt-BR",
                            )}
                        </Table.Cell>
                        <Table.Cell class="font-medium">
                            {formatCurrency(compra.valor_total_pedido || 0)}
                        </Table.Cell>
                        <Table.Cell>
                            <span
                                class="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-muted"
                            >
                                {compra.situacao}
                            </span>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={5}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhuma compra encontrada.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root
    open={dialog != null}
    onOpenChange={(e) => {
        if (!e) {
            dialog = null;
        }
    }}
>
    <Dialog.Content class="sm:max-w-200 max-h-[90vh] flex flex-col">
        <Dialog.Header>
            <Dialog.Title>Nova Compra</Dialog.Title>
            <Dialog.Description
                >Preencha os dados do pedido e adicione os itens abaixo.</Dialog.Description
            >
        </Dialog.Header>

        <div class="flex-1 overflow-y-auto pr-2 space-y-6 py-4">
            <div class="grid grid-cols-3 gap-4">
                <div class="grid gap-2">
                    <Label for="num">Nº Pedido</Label>
                    <Input id="num" bind:value={compraData.numero_pedido} />
                </div>
                <div class="grid gap-2">
                    <Label for="forn">Fornecedor</Label>
                    <select
                        id="forn"
                        bind:value={compraData.fornecedor_id}
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                    >
                        <option value={0}>Selecione...</option>
                        {#each fornecedores as f}
                            <option value={f.id}>{f.razao_social}</option>
                        {/each}
                    </select>
                </div>
                <div class="grid gap-2">
                    <Label for="date">Data</Label>
                    <Input
                        id="date"
                        type="date"
                        bind:value={compraData.data_pedido}
                    />
                </div>
            </div>

            <div class="rounded-lg border bg-muted/40 p-4 space-y-4">
                <header class="flex items-center gap-2 font-semibold">
                    <ShoppingBag class="h-4 w-4" />
                    Adicionar Item
                </header>
                <div class="grid grid-cols-4 gap-4">
                    <div class="grid gap-2 col-span-2">
                        <Label>Produto</Label>
                        <select
                            bind:value={currentItem.produto_id}
                            onchange={() => {
                                const p = produtos.find(
                                    (p) => p.id === currentItem.produto_id,
                                );
                                if (p)
                                    currentItem.preco_compra =
                                        p.preco_compra || 0;
                            }}
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                        >
                            <option value={0}>Selecione um produto...</option>
                            {#each produtos as p}
                                <option value={p.id}>
                                    {p.codigo} - {p.descricao}
                                </option>
                            {/each}
                        </select>
                    </div>
                    <div class="grid gap-2">
                        <Label>Qtd</Label>
                        <Input
                            type="number"
                            bind:value={currentItem.quantidade}
                            min="1"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label>Preço Unit.</Label>
                        <Input
                            type="number"
                            bind:value={currentItem.preco_compra}
                            step="0.01"
                        />
                    </div>
                </div>
                <Button variant="secondary" class="w-full" onclick={addItem}>
                    Adicionar Item à Lista
                </Button>
            </div>

            {#if items.length > 0}
                <div class="rounded-lg border">
                    <Table.Root>
                        <Table.Header>
                            <Table.Row>
                                <Table.Head>Produto</Table.Head>
                                <Table.Head class="text-right">Qtd</Table.Head>
                                <Table.Head class="text-right">
                                    Unitário
                                </Table.Head>
                                <Table.Head class="text-right">
                                    Subtotal
                                </Table.Head>
                                <Table.Head></Table.Head>
                            </Table.Row>
                        </Table.Header>
                        <Table.Body>
                            {#each items as item, i}
                                <Table.Row>
                                    <Table.Cell>
                                        <span class="font-medium">
                                            {item.codigo}
                                        </span>
                                        <span
                                            class="block text-xs text-muted-foreground"
                                        >
                                            {item.descricao}
                                        </span>
                                    </Table.Cell>
                                    <Table.Cell class="text-right">
                                        {item.quantidade}
                                    </Table.Cell>
                                    <Table.Cell class="text-right">
                                        {formatCurrency(item.preco_compra || 0)}
                                    </Table.Cell>
                                    <Table.Cell class="text-right font-bold">
                                        {formatCurrency(item.valor_total || 0)}
                                    </Table.Cell>
                                    <Table.Cell>
                                        <Button
                                            variant="ghost"
                                            size="icon"
                                            onclick={() => removeItem(i)}
                                        >
                                            <Trash2
                                                class="h-4 w-4 text-destructive"
                                            />
                                        </Button>
                                    </Table.Cell>
                                </Table.Row>
                            {/each}
                        </Table.Body>
                    </Table.Root>
                </div>
                <div class="flex justify-end text-xl font-bold p-2">
                    Total: {formatCurrency(totalPrice || 0)}
                </div>
            {/if}
        </div>

        <Dialog.Footer class="border-t pt-4">
            <Button variant="outline" onclick={() => (dialog = null)}>
                Cancelar
            </Button>
            <Button onclick={save} disabled={items.length === 0}>
                Finalizar Pedido
            </Button>
        </Dialog.Footer>
    </Dialog.Content>
</Dialog.Root>
