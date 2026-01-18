<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import { Textarea } from "@/components/ui/textarea/index";
    import * as Select from "@/components/ui/select";
    import * as Table from "@/components/ui/table/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import type {
        Cliente,
        Pedido,
        PedidoItem,
        Produto,
        Vendedor,
    } from "@/types";
    import db, { queryHelper } from "@/db/db.svelte";
    import Needed from "@/components/needed.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Plus from "@lucide/svelte/icons/plus";
    import ShoppingCart from "@lucide/svelte/icons/shopping-cart";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import Id from "@/id.svelte";

    const id = Id.id;
    let loading = $state(true);
    let clientes = $state<Array<Cliente>>([]);
    let vendedores = $state<Array<Vendedor>>([]);
    let produtos = $state<Array<Produto>>([]);

    let orderData = $state({
        numero_pedido: "",
        cliente_id: "-1",
        vendedor_id: "-1",
        data_pedido: "",
        data_entrega: "",
        situacao: "pendente",
        tipo_pedido: "venda",
        valor_desconto: 0,
        observacoes: "",
    });

    let items = $state<
        Array<Partial<PedidoItem> & { descricao?: string; codigo?: string }>
    >([]);

    let currentItem = $state({
        produto_id: "-1",
        quantidade_saida: 1,
        preco_unitario: 0,
    });

    let valor_bruto = $derived(
        items.reduce(
            (acc, item) =>
                acc + (item.quantidade_saida || 0) * (item.preco_unitario || 0),
            0,
        ),
    );

    let valor_liquido = $derived(
        valor_bruto - Number(orderData.valor_desconto),
    );

    async function addItem() {
        if (
            currentItem.produto_id === "-1" ||
            currentItem.quantidade_saida <= 0
        ) {
            toast.error("Selecione um produto e quantidade válidos.");
            return;
        }

        const produto = produtos.find(
            (p) => String(p.id) === currentItem.produto_id,
        );
        if (!produto) return;

        items.push({
            produto_id: produto.id,
            quantidade_saida: currentItem.quantidade_saida,
            preco_unitario: currentItem.preco_unitario,
            descricao: produto.descricao,
            codigo: produto.codigo,
        });

        currentItem = {
            produto_id: "-1",
            quantidade_saida: 1,
            preco_unitario: 0,
        };
    }

    function removeItem(index: number) {
        items.splice(index, 1);
    }

    async function save() {
        if (
            orderData.cliente_id === "-1" ||
            items.length === 0 ||
            !orderData.numero_pedido
        ) {
            toast.error(
                "Preencha o Nº do Pedido, Cliente e adicione pelo menos um item.",
            );
            return;
        }

        try {
            const pedidoToUpdate = {
                numero_pedido: orderData.numero_pedido,
                cliente_id: parseInt(orderData.cliente_id),
                vendedor_id:
                    orderData.vendedor_id !== "-1"
                        ? parseInt(orderData.vendedor_id)
                        : null,
                data_pedido: orderData.data_pedido,
                data_entrega: orderData.data_entrega || null,
                situacao: orderData.situacao,
                tipo_pedido: orderData.tipo_pedido,
                valor_bruto: valor_bruto,
                valor_desconto: Number(orderData.valor_desconto),
                valor_liquido: valor_liquido,
                observacoes: orderData.observacoes || null,
            };

            let q = queryHelper(pedidoToUpdate);
            await db.execute(
                `UPDATE pedidos SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            // Sync items: Delete existing and re-insert (simpler than complex diff)
            await db.execute("DELETE FROM pedido_itens WHERE pedido_id = $1", [
                id,
            ]);

            for (const item of items) {
                const itemToSave = {
                    pedido_id: parseInt(id),
                    produto_id: item.produto_id!,
                    quantidade_saida: item.quantidade_saida!,
                    quantidade_retorno: item.quantidade_retorno || 0,
                    preco_unitario: item.preco_unitario!,
                };
                let qItem = queryHelper(itemToSave);
                await db.execute(
                    `INSERT INTO pedido_itens (${qItem.columns}) VALUES (${qItem.placeholders})`,
                    qItem.values,
                );
            }

            toast.success("Pedido atualizado com sucesso!");
            goto("/pedidos");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar pedido");
            console.error(e);
        }
    }

    async function load() {
        loading = true;
        try {
            const [pRes, itemsRes, c, v, prod] = await Promise.all([
                db.select("SELECT * FROM pedidos WHERE id = $1", [id]),
                db.select(
                    `
                    SELECT pi.*, p.descricao, p.codigo
                    FROM pedido_itens pi
                    LEFT JOIN produtos p ON pi.produto_id = p.id
                    WHERE pi.pedido_id = $1
                `,
                    [id],
                ),
                db.select("SELECT id, nome FROM clientes ORDER BY nome", []),
                db.select("SELECT id, nome FROM vendedores ORDER BY nome", []),
                db.select(
                    "SELECT id, codigo, descricao, preco_venda FROM produtos ORDER BY descricao",
                    [],
                ),
            ]);

            const pedido = (pRes as any)[0];
            if (pedido) {
                orderData = {
                    numero_pedido: pedido.numero_pedido || "",
                    cliente_id: String(pedido.cliente_id),
                    vendedor_id: pedido.vendedor_id
                        ? String(pedido.vendedor_id)
                        : "-1",
                    data_pedido: pedido.data_pedido || "",
                    data_entrega: pedido.data_entrega || "",
                    situacao: pedido.situacao || "pendente",
                    tipo_pedido: pedido.tipo_pedido || "venda",
                    valor_desconto: pedido.valor_desconto || 0,
                    observacoes: pedido.observacoes || "",
                };
            } else {
                toast.error("Pedido não encontrado.");
                goto("/pedidos");
            }

            items = itemsRes as any;
            clientes = c as any;
            vendedores = v as any;
            produtos = prod as any;
        } catch (e: any) {
            console.error("Erro ao carregar dados:", e);
            toast.error("Erro ao carregar dados do pedido.");
        } finally {
            loading = false;
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

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/pedidos")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight">Editar Pedido</h1>
        </div>
        <Button onclick={save} class="gap-2" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Alterações
        </Button>
    </div>

    {#if loading}
        <div class="flex h-100 items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <Card.Root class="md:col-span-2">
                <Card.Header>
                    <Card.Title>Informações Gerais</Card.Title>
                    <Card.Description
                        >Dados principais da venda.</Card.Description
                    >
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="num">Nº do Pedido <Needed /></Label>
                            <Input
                                id="num"
                                bind:value={orderData.numero_pedido}
                                placeholder="Ex: PED-2023-001"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="tipo">Tipo de Pedido</Label>
                            <Select.Root
                                type="single"
                                bind:value={orderData.tipo_pedido}
                            >
                                <Select.Trigger class="w-full">
                                    {orderData.tipo_pedido === "venda"
                                        ? "Venda"
                                        : "Bonificação"}
                                </Select.Trigger>
                                <Select.Content>
                                    <Select.Item value="venda"
                                        >Venda</Select.Item
                                    >
                                    <Select.Item value="bonificacao"
                                        >Bonificação</Select.Item
                                    >
                                </Select.Content>
                            </Select.Root>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="cliente">Cliente <Needed /></Label>
                            <Select.Root
                                type="single"
                                bind:value={orderData.cliente_id}
                            >
                                <Select.Trigger class="w-full">
                                    {clientes.find(
                                        (c) =>
                                            String(c.id) ===
                                            orderData.cliente_id,
                                    )?.nome || "Selecione o cliente..."}
                                </Select.Trigger>
                                <Select.Content>
                                    <Select.Item value="-1"
                                        >Selecione o cliente...</Select.Item
                                    >
                                    {#each clientes as cliente}
                                        <Select.Item value={String(cliente.id)}
                                            >{cliente.nome}</Select.Item
                                        >
                                        {#each [] as _}{/each}
                                    {/each}
                                </Select.Content>
                            </Select.Root>
                        </div>
                        <div class="grid gap-2">
                            <Label for="vendedor">Vendedor</Label>
                            <Select.Root
                                type="single"
                                bind:value={orderData.vendedor_id}
                            >
                                <Select.Trigger class="w-full">
                                    {vendedores.find(
                                        (v) =>
                                            String(v.id) ===
                                            orderData.vendedor_id,
                                    )?.nome || "Selecione o vendedor..."}
                                </Select.Trigger>
                                <Select.Content>
                                    <Select.Item value="-1"
                                        >Selecione o vendedor...</Select.Item
                                    >
                                    {#each vendedores as vendedor}
                                        <Select.Item value={String(vendedor.id)}
                                            >{vendedor.nome}</Select.Item
                                        >
                                    {/each}
                                </Select.Content>
                            </Select.Root>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="data">Data do Pedido</Label>
                            <Input
                                id="data"
                                type="date"
                                bind:value={orderData.data_pedido}
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="entrega">Previsão de Entrega</Label>
                            <Input
                                id="entrega"
                                type="date"
                                bind:value={orderData.data_entrega}
                            />
                        </div>
                    </div>

                    <div class="grid gap-2">
                        <Label for="obs">Observações</Label>
                        <Textarea
                            id="obs"
                            bind:value={orderData.observacoes}
                            placeholder="Informações adicionais sobre o pedido..."
                            rows={3}
                        />
                    </div>
                </Card.Content>
            </Card.Root>

            <Card.Root>
                <Card.Header>
                    <Card.Title>Resumo Financeiro</Card.Title>
                    <Card.Description>Totais e descontos.</Card.Description>
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="flex justify-between items-center text-sm">
                        <span class="text-muted-foreground"
                            >Subtotal (Bruto):</span
                        >
                        <span class="font-medium"
                            >{formatCurrency(valor_bruto)}</span
                        >
                    </div>
                    <div class="grid gap-2">
                        <Label for="desconto">Desconto (R$)</Label>
                        <Input
                            id="desconto"
                            type="number"
                            step="0.01"
                            bind:value={orderData.valor_desconto}
                        />
                    </div>
                    <div class="border-t pt-4 space-y-2">
                        <div class="flex justify-between items-center">
                            <span class="text-lg font-bold">Total Líquido:</span
                            >
                            <span class="text-2xl font-black text-primary"
                                >{formatCurrency(valor_liquido)}</span
                            >
                        </div>
                    </div>
                    <div class="grid gap-2 pt-4">
                        <Label for="situacao">Situação</Label>
                        <Select.Root
                            type="single"
                            bind:value={orderData.situacao}
                        >
                            <Select.Trigger
                                class="w-full capitalize border-primary/20"
                            >
                                {orderData.situacao}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="pendente"
                                    >Pendente</Select.Item
                                >
                                <Select.Item value="faturado"
                                    >Faturado</Select.Item
                                >
                                <Select.Item value="cancelado"
                                    >Cancelado</Select.Item
                                >
                                <Select.Item value="devolvido"
                                    >Devolvido</Select.Item
                                >
                            </Select.Content>
                        </Select.Root>
                    </div>
                </Card.Content>
            </Card.Root>

            <Card.Root class="md:col-span-3">
                <Card.Header>
                    <Card.Title class="flex items-center gap-2">
                        <ShoppingCart class="h-6 w-6 text-primary" />
                        Itens do Pedido
                    </Card.Title>
                    <Card.Description
                        >Gerencie os produtos deste pedido.</Card.Description
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
                                        currentItem.preco_unitario =
                                            p.preco_venda || 0;
                                }}
                            >
                                <Select.Trigger class="w-full">
                                    {produtos.find(
                                        (p) =>
                                            String(p.id) ===
                                            currentItem.produto_id,
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
                                bind:value={currentItem.quantidade_saida}
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label>Preço Unit.</Label>
                            <Input
                                type="number"
                                step="0.01"
                                bind:value={currentItem.preco_unitario}
                            />
                        </div>
                        <div class="md:col-span-4 flex justify-end">
                            <Button
                                variant="secondary"
                                onclick={addItem}
                                class="gap-2"
                            >
                                <Plus class="h-4 w-4" />
                                Adicionar Item
                            </Button>
                        </div>
                    </div>

                    <Table.Root>
                        <Table.Header>
                            <Table.Row>
                                <Table.Head>Cód.</Table.Head>
                                <Table.Head>Descrição</Table.Head>
                                <Table.Head class="text-center">Qtd</Table.Head>
                                <Table.Head class="text-right"
                                    >Unitário</Table.Head
                                >
                                <Table.Head class="text-right"
                                    >Subtotal</Table.Head
                                >
                                <Table.Head class="w-10"></Table.Head>
                            </Table.Row>
                        </Table.Header>
                        <Table.Body>
                            {#each items as item, i}
                                <Table.Row>
                                    <Table.Cell class="font-mono text-xs"
                                        >{item.codigo}</Table.Cell
                                    >
                                    <Table.Cell>{item.descricao}</Table.Cell>
                                    <Table.Cell
                                        class="text-center font-semibold"
                                        >{item.quantidade_saida}</Table.Cell
                                    >
                                    <Table.Cell class="text-right"
                                        >{formatCurrency(
                                            item.preco_unitario || 0,
                                        )}</Table.Cell
                                    >
                                    <Table.Cell
                                        class="text-right font-bold text-primary"
                                    >
                                        {formatCurrency(
                                            (item.quantidade_saida || 0) *
                                                (item.preco_unitario || 0),
                                        )}
                                    </Table.Cell>
                                    <Table.Cell>
                                        <Button
                                            variant="ghost"
                                            size="icon"
                                            onclick={() => removeItem(i)}
                                        >
                                            <Trash2
                                                class="h-4 w-4 text-red-500"
                                            />
                                        </Button>
                                    </Table.Cell>
                                </Table.Row>
                            {:else}
                                <Table.Row>
                                    <Table.Cell
                                        colspan={6}
                                        class="text-center py-12 text-muted-foreground italic"
                                    >
                                        Nenhum item neste pedido.
                                    </Table.Cell>
                                </Table.Row>
                            {/each}
                        </Table.Body>
                    </Table.Root>
                </Card.Content>
            </Card.Root>
        </div>
    {/if}
</div>
