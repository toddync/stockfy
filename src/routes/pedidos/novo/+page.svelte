<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "$lib/components/ui/button/index";
    import * as Card from "$lib/components/ui/card/index.js";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "$lib/components/ui/label/index";
    import * as Table from "$lib/components/ui/table/index.js";
    import type { Cliente, PedidoItem, Produto, Vendedor } from "$lib/types";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Plus from "@lucide/svelte/icons/plus";
    import ShoppingCart from "@lucide/svelte/icons/shopping-cart";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let clientes = $state<Array<Cliente>>([]);
    let vendedores = $state<Array<Vendedor>>([]);
    let produtos = $state<Array<Produto>>([]);

    let orderData = $state({
        numero_pedido: "",
        cliente_id: 0,
        vendedor_id: 0,
        data_pedido: new Date().toISOString().split("T")[0],
        situacao: "pendente",
    });

    let items = $state<
        Array<Partial<PedidoItem> & { descricao?: string; codigo?: string }>
    >([]);
    let currentItem = $state({
        produto_id: 0,
        quantidade_saida: 1,
        preco_venda: 0,
    });

    let totalPrice = $derived(
        items.reduce(
            (acc, item) => acc + item.quantidade_saida! * item.preco_venda!,
            0,
        ),
    );

    async function addItem() {
        if (!currentItem.produto_id || currentItem.quantidade_saida <= 0) {
            toast.error("Selecione um produto e quantidade válidos.");
            return;
        }

        const produto = produtos.find((p) => p.id === currentItem.produto_id);
        if (!produto) return;

        items.push({
            ...currentItem,
            descricao: produto.descricao,
            codigo: produto.codigo,
        });

        // Reset current item form
        currentItem = {
            produto_id: 0,
            quantidade_saida: 1,
            preco_venda: 0,
        };
    }

    function removeItem(index: number) {
        items.splice(index, 1);
    }

    async function save() {
        if (!orderData.cliente_id || items.length === 0) {
            toast.error("Preencha o cliente e adicione pelo menos um item.");
            return;
        }

        try {
            const response = await fetch("http://localhost:3000/api/pedidos", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    pedido: { ...orderData, valor_total: totalPrice },
                    itens: items,
                }),
            });

            if (!response.ok) throw new Error("Erro ao salvar pedido");

            const savedOrder = await response.json();
            toast.success("Pedido realizado com sucesso!");
            goto("/pedidos");
        } catch (e: any) {
            toast.error(e.message);
        }
    }

    async function load() {
        try {
            const [clientesRes, vendedoresRes, produtosRes] = await Promise.all(
                [
                    fetch("http://localhost:3000/api/clientes"),
                    fetch("http://localhost:3000/api/vendedores"),
                    fetch("http://localhost:3000/api/produtos"),
                ],
            );

            clientes = await clientesRes.json();
            vendedores = await vendedoresRes.json();
            produtos = await produtosRes.json();
        } catch (e: any) {
            console.error(e);
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

<div class="p-6 max-w-5xl mx-auto space-y-6">
    <div class="flex items-center gap-4">
        <Button variant="ghost" size="icon" onclick={() => goto("/pedidos")}>
            <ArrowLeft class="h-5 w-5" />
        </Button>
        <h1 class="text-3xl font-bold">Novo Pedido</h1>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card.Root class="md:col-span-2">
            <Card.Header>
                <Card.Title>Informações do Pedido</Card.Title>
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="num">Nº Pedido</Label>
                        <Input
                            id="num"
                            bind:value={orderData.numero_pedido}
                            placeholder="Ex: PED-1001"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="date">Data</Label>
                        <Input
                            id="date"
                            type="date"
                            bind:value={orderData.data_pedido}
                        />
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="client">Cliente</Label>
                        <select
                            id="client"
                            bind:value={orderData.cliente_id}
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                        >
                            <option value={0}>Selecione um cliente...</option>
                            {#each clientes as c}
                                <option value={c.id}>{c.nome}</option>
                            {/each}
                        </select>
                    </div>
                    <div class="grid gap-2">
                        <Label for="seller">Vendedor</Label>
                        <select
                            id="seller"
                            bind:value={orderData.vendedor_id}
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                        >
                            <option value={0}>Selecione um vendedor...</option>
                            {#each vendedores as v}
                                <option value={v.id}>{v.nome}</option>
                            {/each}
                        </select>
                    </div>
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root>
            <Card.Header>
                <Card.Title>Resumo</Card.Title>
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="flex justify-between text-lg">
                    <span>Itens:</span>
                    <span class="font-bold">{items.length}</span>
                </div>
                <div
                    class="flex justify-between text-2xl font-bold pt-4 border-t"
                >
                    <span>Total:</span>
                    <span class="text-primary"
                        >{formatCurrency(totalPrice)}</span
                    >
                </div>
                <Button
                    class="w-full mt-4"
                    size="lg"
                    onclick={save}
                    disabled={items.length === 0}
                >
                    Finalizar Pedido
                </Button>
            </Card.Content>
        </Card.Root>
    </div>

    <Card.Root>
        <Card.Header>
            <Card.Title class="flex items-center gap-2">
                <ShoppingCart class="h-5 w-5" />
                Itens do Pedido
            </Card.Title>
        </Card.Header>
        <Card.Content class="space-y-6">
            <div
                class="grid grid-cols-4 gap-4 items-end bg-muted/30 p-4 rounded-lg"
            >
                <div class="grid gap-2 col-span-2">
                    <Label>Produto</Label>
                    <select
                        bind:value={currentItem.produto_id}
                        onchange={() => {
                            const p = produtos.find(
                                (p) => p.id === currentItem.produto_id,
                            );
                            if (p) currentItem.preco_venda = p.preco_venda || 0;
                        }}
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                    >
                        <option value={0}>Selecione um produto...</option>
                        {#each produtos as p}
                            <option value={p.id}
                                >{p.codigo} - {p.descricao}</option
                            >
                        {/each}
                    </select>
                </div>
                <div class="grid gap-2">
                    <Label>Qtd</Label>
                    <Input
                        type="number"
                        bind:value={currentItem.quantidade_saida}
                        min="1"
                    />
                </div>
                <Button variant="secondary" onclick={addItem}>
                    <Plus class="h-4 w-4 mr-2" />
                    Adicionar
                </Button>
            </div>

            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Cód.</Table.Head>
                        <Table.Head>Descrição</Table.Head>
                        <Table.Head class="text-right">Qtd</Table.Head>
                        <Table.Head class="text-right">Unitário</Table.Head>
                        <Table.Head class="text-right">Subtotal</Table.Head>
                        <Table.Head class="w-[50px]"></Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each items as item, i}
                        <Table.Row>
                            <Table.Cell>{item.codigo}</Table.Cell>
                            <Table.Cell>{item.descricao}</Table.Cell>
                            <Table.Cell class="text-right"
                                >{item.quantidade_saida}</Table.Cell
                            >
                            <Table.Cell class="text-right"
                                >{formatCurrency(
                                    item.preco_venda || 0,
                                )}</Table.Cell
                            >
                            <Table.Cell class="text-right font-bold"
                                >{formatCurrency(
                                    (item.quantidade_saida || 0) *
                                        (item.preco_venda || 0),
                                )}</Table.Cell
                            >
                            <Table.Cell>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => removeItem(i)}
                                >
                                    <Trash2 class="h-4 w-4 text-destructive" />
                                </Button>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={6}
                                class="text-center py-10 text-muted-foreground italic"
                            >
                                Nenhum item adicionado ao pedido.
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                </Table.Body>
            </Table.Root>
        </Card.Content>
    </Card.Root>
</div>
