<script lang="ts">
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu";
    import * as Table from "$lib/components/ui/table/index.js";
    import type { Pedido, PedidoItem } from "@/types";
    import BadgeCheck from "@lucide/svelte/icons/badge-check";
    import Ban from "@lucide/svelte/icons/ban";
    import ClockFading from "@lucide/svelte/icons/clock-fading";
    import X from "@lucide/svelte/icons/x";

    const formatter = new Intl.DateTimeFormat("br-BR");

    type Order = Pedido & {
        cliente_nome: string;
        vendedor_nome: string;
        itens: Array<PedidoItem & { nome: string; codigo: string }>;
    };

    let { open = $bindable(false), order = $bindable({} as Order) } = $props();
</script>

<Dialog.Root bind:open>
    <Dialog.Content class="min-w-4xl min-h-125 flex flex-col">
        <Dialog.Header>
            <Dialog.Title>Detalhes</Dialog.Title>
        </Dialog.Header>

        <main class="grid grid-cols-3 flex-1 space-x-4">
            <div class="flex flex-col gap-3 text-sm">
                <div>Número: {order.numero_pedido}</div>
                <div>Data: {formatter.format(new Date(order.data_pedido))}</div>
                <div>
                    Situação:
                    <DropdownMenu.Root>
                        <DropdownMenu.Trigger
                            class="[&>svg]:size-4 [&>svg]:inline cursor-pointer"
                        >
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
                        </DropdownMenu.Trigger>
                        <DropdownMenu.Content>
                            <DropdownMenu.Group class="*:[&>svg]:ml-auto">
                                {@const v = order.situacao}
                                <DropdownMenu.Item
                                    class={(v == "faturado" &&
                                        "bg-accent/50") ||
                                        ""}
                                >
                                    Faturado
                                    <BadgeCheck class="stroke-lime-400" />
                                </DropdownMenu.Item>
                                <DropdownMenu.Item
                                    class={(v == "pendente" &&
                                        "bg-accent/50") ||
                                        ""}
                                >
                                    Pendente
                                    <ClockFading class="stroke-amber-400" />
                                </DropdownMenu.Item>
                                <DropdownMenu.Item
                                    class={(v == "cancelado" &&
                                        "bg-accent/50") ||
                                        ""}
                                >
                                    Cancelado
                                    <Ban class="stroke-red-500" />
                                </DropdownMenu.Item>
                                <DropdownMenu.Item
                                    class={(v == "perdido" && "bg-accent/50") ||
                                        ""}
                                >
                                    Perdido <X />
                                </DropdownMenu.Item>
                            </DropdownMenu.Group>
                        </DropdownMenu.Content>
                    </DropdownMenu.Root>
                </div>
                <div>Cliente: {order.cliente_nome}</div>
                <div>Vendedor: {order.vendedor_nome}</div>
            </div>

            <div class="col-span-2 flex flex-col">
                <div class="flex-1">
                    <Table.Root>
                        <Table.Header>
                            <Table.Row>
                                <Table.Head>Cód.</Table.Head>
                                <Table.Head>Nome</Table.Head>
                                <Table.Head>Quant.</Table.Head>
                                <Table.Head>Unit.</Table.Head>
                                <Table.Head>Sub Total</Table.Head>
                            </Table.Row>
                        </Table.Header>

                        <Table.Body>
                            {#each order.itens as item (item.id)}
                                <Table.Row>
                                    <Table.Cell>{item.codigo}</Table.Cell>
                                    <Table.Cell>{item.nome}</Table.Cell>
                                    <Table.Cell class="text-end">
                                        {item.quantidade_saida}
                                    </Table.Cell>
                                    <Table.Cell class="text-end">
                                        R$ {item.preco_venda}
                                    </Table.Cell>
                                    <Table.Cell class="text-end">
                                        R$ {(item.quantidade_saida -
                                            item.quantidade_retorno) *
                                            item.preco_venda}
                                    </Table.Cell>
                                </Table.Row>
                            {/each}
                        </Table.Body>
                    </Table.Root>
                </div>
            </div>
        </main>
        <Table.Footer>
            <Table.Row class="flex">
                <Table.Cell>Total:</Table.Cell>
                <Table.Cell class="text-end ml-auto">
                    R$ {order.valor_total}
                </Table.Cell>
            </Table.Row>
        </Table.Footer>
    </Dialog.Content>
</Dialog.Root>
