<script lang="ts">
    import { goto } from "$app/navigation";
    import PaginationControl from "@/components/PaginationControl.svelte";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Spinner } from "@/components/ui/spinner";
    import * as Table from "@/components/ui/table/index.js";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import type { Pedido } from "@/types";
    import BadgeCheck from "@lucide/svelte/icons/badge-check";
    import Ban from "@lucide/svelte/icons/ban";
    import ClockFading from "@lucide/svelte/icons/clock-fading";
    import Eye from "@lucide/svelte/icons/eye";
    import Handbag from "@lucide/svelte/icons/handbag";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import X from "@lucide/svelte/icons/x";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    const formatter = new Intl.DateTimeFormat("pt-BR", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
    });

    type Order = Pedido & {
        cliente_nome: string;
        vendedor_nome: string;
    };

    let orders = $state<Array<Order>>([]);
    let searchQuery = $state("");
    let loading = $state(true);
    let page = $state(1);
    let perPage = 10;
    let totalItems = $state(0);

    let debounceTimer: ReturnType<typeof setTimeout>;

    function handleSearch() {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            page = 1;
            load();
        }, 300);
    }

    $effect(() => {
        if (page) load();
    });

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir este pedido?")) return;
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
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = `
                SELECT COUNT(*) as count
                FROM pedidos p
                LEFT JOIN clientes c ON p.cliente_id = c.id
                LEFT JOIN vendedores v ON p.vendedor_id = v.id
            `;
            let selectQuery = `
                SELECT p.*, c.nome as cliente_nome, v.nome as vendedor_nome
                FROM pedidos p
                LEFT JOIN clientes c ON p.cliente_id = c.id
                LEFT JOIN vendedores v ON p.vendedor_id = v.id
            `;
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause =
                    " WHERE p.numero_pedido LIKE $1 OR c.nome LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY p.data_pedido DESC, p.id DESC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            const ordersList = (await db.select(
                selectQuery,
                params,
            )) as Array<Order>;

            orders = ordersList;
        } catch (e: unknown) {
            console.error("Erro ao carregar dados:", e);
            toast.error("Erro ao carregar dados do banco de dados.");
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

    function getStatusVariant(status: string) {
        switch (status) {
            case "faturado":
                return "bg-green-100 text-green-700 border-green-200";
            case "pendente":
                return "bg-amber-100 text-amber-700 border-amber-200";
            case "cancelado":
                return "bg-red-100 text-red-700 border-red-200";
            case "devolvido":
                return "bg-blue-100 text-blue-700 border-blue-200";
            default:
                return "bg-gray-100 text-gray-700 border-gray-200";
        }
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Handbag class="h-8 w-8 text-primary" />
                Gerenciamento de Pedidos
            </Card.Title>
            <Card.Description
                >Acompanhe e gerencie as vendas da sua empresa.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/pedidos/novo");
            }}
        >
            Nova pedido
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
                    placeholder="Pesquisar por pedido ou cliente..."
                    class="pl-8"
                    bind:value={searchQuery}
                    oninput={handleSearch}
                />
            </div>
        </div>

        {#if loading}
            <div class="flex h-48 items-center justify-center">
                <Spinner class="h-8 w-8 text-primary" />
            </div>
        {:else}
            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>N° Pedido</Table.Head>
                        <Table.Head>Cliente</Table.Head>
                        <Table.Head>Vendedor</Table.Head>
                        <Table.Head>Data</Table.Head>
                        <Table.Head class="text-right">Valor Líquido</Table.Head
                        >
                        <Table.Head>Situação</Table.Head>
                        <Table.Head class="w-12.5 text-right">Ações</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each orders as order (order.id)}
                        <Table.Row>
                            <Table.Cell class="font-bold text-primary"
                                >{order.numero_pedido}</Table.Cell
                            >
                            <Table.Cell>{order.cliente_nome}</Table.Cell>
                            <Table.Cell>{order.vendedor_nome || "-"}</Table.Cell
                            >
                            <Table.Cell>
                                {order.data_pedido
                                    ? formatter.format(
                                          new Date(order.data_pedido),
                                      )
                                    : "-"}
                            </Table.Cell>
                            <Table.Cell class="font-semibold text-right">
                                {formatCurrency(order.valor_liquido)}
                            </Table.Cell>
                            <Table.Cell>
                                <span
                                    class={`px-2 py-1 rounded-full text-xs font-bold border ${getStatusVariant(order.situacao)} flex items-center gap-1 w-fit capitalize`}
                                >
                                    {#if order.situacao == "faturado"}
                                        <BadgeCheck class="h-3 w-3" />
                                    {:else if order.situacao == "pendente"}
                                        <ClockFading class="h-3 w-3" />
                                    {:else if order.situacao == "cancelado"}
                                        <Ban class="h-3 w-3" />
                                    {:else}
                                        <X class="h-3 w-3" />
                                    {/if}
                                    {order.situacao}
                                </span>
                            </Table.Cell>
                            <Table.Cell class="text-right whitespace-nowrap">
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = order.id;
                                        goto(`/pedidos/id`);
                                    }}
                                >
                                    <Eye
                                        class="h-4 w-4 stroke-3 text-primary"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = order.id;
                                        goto(`/pedidos/id/edit/`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 text-lime-600"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => delete_(order.id)}
                                >
                                    <Trash2
                                        class="h-4 w-4 stroke-3 text-red-500"
                                    />
                                </Button>
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

            <div class="mt-4">
                <PaginationControl count={totalItems} {perPage} bind:page />
            </div>
        {/if}
    </Card.Content>
</Card.Root>
