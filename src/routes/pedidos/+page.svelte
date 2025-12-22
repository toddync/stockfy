<script lang="ts">
    import BadgeCheck from "@lucide/svelte/icons/badge-check";
    import X from "@lucide/svelte/icons/x";
    import ClockFading from "@lucide/svelte/icons/clock-fading";
    import Ban from "@lucide/svelte/icons/ban";
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import Badge from "@/components/ui/badge/badge.svelte";
    import { Button } from "@/components/ui/button/index";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Pedido, PedidoItem } from "@/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Receipt from "@lucide/svelte/icons/receipt";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Search from "@lucide/svelte/icons/search";
    import Eye from "@lucide/svelte/icons/eye";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import ReceiptDialog from "./receipt-dialog.svelte";
    import { goto } from "$app/navigation";

    const formatter = new Intl.DateTimeFormat("pt-BR", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
    });

    type Order = Pedido & {
        cliente_nome: string;
        vendedor_nome: string;
        itens: Array<PedidoItem>;
    };

    let orders = $state<Array<Order>>([]);
    let orderData = $state<Partial<Pedido>>({
        numero_pedido: "",
        cliente_id: 0,
        vendedor_id: 0,
        data_pedido: new Date() as any,
        valor_total: 0,
        situacao: "pendente",
    });
    let clientes = $state<Array<any>>([]);
    let vendedores = $state<Array<any>>([]);
    let dialog = $state<string | null>(null);
    let receipt = $state(false);
    let searchQuery = $state("");

    let filteredOrders = $derived(
        orders.filter(
            (o) =>
                o.numero_pedido
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                o.cliente_nome
                    ?.toLowerCase()
                    .includes(searchQuery.toLowerCase()),
        ),
    );

    async function save() {
        try {
            let q = queryHelper(orderData);
            let query = "";

            if (orderData.id) {
                query = `UPDATE pedidos SET ${q.setClauses} WHERE id = ${orderData.id}`;
            } else {
                query = `INSERT INTO pedidos (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Pedido ${orderData.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar pedido: ${message}`);
            console.error("Erro ao salvar pedido:", e);
            dialog = null;
        }
    }

    async function delete_(id: number) {
        try {
            await db.execute("DELETE FROM pedidos WHERE id = $1", [id]);
            await load();
            toast.success("Pedido excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar pedido: ${message}`);
            console.error("Erro ao deletar pedido:", e);
        }
    }

    async function load() {
        try {
            const ordersList = (await db.select(
                `
                SELECT p.*, c.nome as cliente_nome, v.nome as vendedor_nome 
                FROM pedidos p
                LEFT JOIN clientes c ON p.cliente_id = c.id
                LEFT JOIN vendedores v ON p.vendedor_id = v.id
            `,
                [],
            )) as Array<Order>;

            orders = ordersList;
            clientes = (await db.select(
                "SELECT id, nome FROM clientes",
                [],
            )) as any;
            vendedores = (await db.select(
                "SELECT id, nome FROM vendedores",
                [],
            )) as any;

            // Load items for each order
            for (let i = 0; i < orders.length; i++) {
                const items = (await db.select(
                    "SELECT * FROM pedido_itens WHERE pedido_id = $1",
                    [orders[i].id],
                )) as Array<PedidoItem>;
                orders[i].itens = items;
            }
        } catch (e: unknown) {
            console.error("Erro ao carregar dados:", e);
            toast.error("Erro ao carregar dados do banco de dados.");
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex w-full">
        <Card.Title class="text-3xl">Gerenciamento de Pedidos</Card.Title>
        <Button
            class="ml-auto cursor-pointer border-primary/50! hover:bg-primary/50! transition-colors duration-500!"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/pedidos/novo");
            }}
        >
            Novo pedido
            <Plus class="stroke-2" />
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
                    placeholder="Pesquisar por pedido ou cliente..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Caption>Lista de pedidos.</Table.Caption>
            <Table.Header>
                <Table.Row>
                    <Table.Head>N° Pedido</Table.Head>
                    <Table.Head>Cliente</Table.Head>
                    <Table.Head>Vendedor</Table.Head>
                    <Table.Head>Data</Table.Head>
                    <Table.Head>Valor Total</Table.Head>
                    <Table.Head>Situação</Table.Head>
                    <Table.Head></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredOrders as order (order.id)}
                    <Table.Row>
                        <Table.Cell>{order.numero_pedido}</Table.Cell>
                        <Table.Cell>{order.cliente_nome}</Table.Cell>
                        <Table.Cell>{order.vendedor_nome}</Table.Cell>
                        <Table.Cell>
                            {formatter.format(new Date(order.data_pedido))}
                        </Table.Cell>
                        <Table.Cell>R$ {order.valor_total}</Table.Cell>
                        <Table.Cell class="[&>svg]:size-4 [&>svg]:inline">
                            {order.situacao}
                            {#if order.situacao == "faturado"}
                                <BadgeCheck class="stroke-lime-400" />
                            {:else if order.situacao == "pendente"}
                                <ClockFading class="stroke-amber-400" />
                            {:else if order.situacao == "cancelado"}
                                <Ban class="stroke-red-500" />
                            {:else}
                                <X class="stroke-muted-foreground" />
                            {/if}
                        </Table.Cell>
                        <Table.Cell>
                            <DropdownMenu.Root>
                                <DropdownMenu.Trigger>
                                    {#snippet child({ props })}
                                        <Button
                                            {...props}
                                            variant="ghost"
                                            size="icon"
                                        >
                                            <Ellipsis />
                                        </Button>
                                    {/snippet}
                                </DropdownMenu.Trigger>
                                <DropdownMenu.Content>
                                    <DropdownMenu.Group>
                                        <DropdownMenu.Item
                                            class="group"
                                            onSelect={() => {
                                                orderData = order;
                                                receipt = true;
                                            }}
                                        >
                                            Detalhes
                                            <Receipt
                                                class="ml-auto group-hover:stroke-amber-300 transition-colors duration-200"
                                            />
                                        </DropdownMenu.Item>
                                        <DropdownMenu.Item
                                            class="group"
                                            onSelect={() => {
                                                goto(`/pedidos/${order.id}`);
                                            }}
                                        >
                                            Ver Página
                                            <Eye
                                                class="ml-auto group-hover:stroke-primary transition-colors duration-200"
                                            />
                                        </DropdownMenu.Item>
                                        <DropdownMenu.Item
                                            class="group"
                                            onSelect={() => {
                                                orderData = order;
                                                dialog = "edit";
                                            }}
                                        >
                                            Editar
                                            <PencilLine
                                                class="ml-auto group-hover:stroke-lime-400 transition-colors duration-200"
                                            />
                                        </DropdownMenu.Item>
                                        <DropdownMenu.Item
                                            class="group"
                                            onclick={() => delete_(order.id)}
                                        >
                                            Excluir
                                            <Trash2
                                                class="ml-auto group-hover:stroke-red-600 transition-colors duration-200"
                                            />
                                        </DropdownMenu.Item>
                                    </DropdownMenu.Group>
                                </DropdownMenu.Content>
                            </DropdownMenu.Root>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={7}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhum pedido encontrado.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<ReceiptDialog bind:open={receipt} bind:order={orderData} />

<Dialog.Root
    open={dialog != null}
    onOpenChange={(e) =>
        e
            ? null
            : ((dialog = null),
              (orderData = {
                  numero_pedido: "",
                  cliente_id: 0,
                  vendedor_id: 0,
                  data_pedido: new Date() as any,
                  valor_total: 0,
                  situacao: "pendente",
              }))}
>
    <Dialog.Content class="gap-10">
        <Dialog.Header>
            <Dialog.Title>
                {#if dialog == "new"}
                    Novo Pedido
                {:else if dialog == "edit"}
                    Editar Pedido
                {/if}
            </Dialog.Title>
        </Dialog.Header>

        <div class="flex flex-col gap-5">
            <div class="grid grid-cols-2 gap-4">
                <div class="flex flex-col gap-3">
                    <Label for="num">N° Pedido:</Label>
                    <Input
                        id="num"
                        bind:value={orderData.numero_pedido}
                        placeholder="PED-100..."
                    />
                </div>
                <div class="flex flex-col gap-3">
                    <Label for="date">Data:</Label>
                    <Input
                        id="date"
                        type="date"
                        bind:value={orderData.data_pedido}
                    />
                </div>
            </div>

            <div class="flex flex-col gap-3">
                <Label for="client">Cliente:</Label>
                <select
                    id="client"
                    bind:value={orderData.cliente_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    <option value={0}>Selecione um cliente...</option>
                    {#each clientes as c}
                        <option value={c.id}>{c.nome}</option>
                    {/each}
                </select>
            </div>

            <div class="flex flex-col gap-3">
                <Label for="seller">Vendedor:</Label>
                <select
                    id="seller"
                    bind:value={orderData.vendedor_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    <option value={0}>Selecione um vendedor...</option>
                    {#each vendedores as v}
                        <option value={v.id}>{v.nome}</option>
                    {/each}
                </select>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div class="flex flex-col gap-3">
                    <Label for="total">Valor Total:</Label>
                    <Input
                        id="total"
                        type="number"
                        bind:value={orderData.valor_total}
                    />
                </div>
                <div class="flex flex-col gap-3">
                    <Label for="status">Situação:</Label>
                    <select
                        id="status"
                        bind:value={orderData.situacao}
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    >
                        <option value="pendente">Pendente</option>
                        <option value="faturado">Faturado</option>
                        <option value="cancelado">Cancelado</option>
                        <option value="perdido">Perdido</option>
                    </select>
                </div>
            </div>
        </div>
        <Dialog.Footer class="grid grid-cols-2 gap-5">
            <Button variant="outline" onclick={() => (dialog = null)}>
                Cancelar
            </Button>
            <Button onclick={save}>Salvar</Button>
        </Dialog.Footer>
    </Dialog.Content>
</Dialog.Root>
