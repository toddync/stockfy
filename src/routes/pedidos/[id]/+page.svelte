<script lang="ts">
  import { goto } from "$app/navigation";
  import { page } from "$app/state";
  import { Badge } from "$lib/components/ui/badge/index";
  import { Button } from "$lib/components/ui/button/index";
  import * as Card from "$lib/components/ui/card/index.js";
  import * as Table from "$lib/components/ui/table/index.js";
  import type { Cliente, Pedido, PedidoItem, Vendedor } from "$lib/types";
  import db from "@/db/db.svelte";
  import ChevronLeft from "@lucide/svelte/icons/chevron-left";
  import Printer from "@lucide/svelte/icons/printer";
  import { onMount } from "svelte";
  import { Spinner } from "$lib/components/ui/spinner";

  type OrderItem = PedidoItem & {
    codigo: string;
    nome: string;
    preco_custo: number;
  };

  let pedido = $state<Pedido | null>(null);
  let items = $state<Array<OrderItem>>([]);
  let cliente = $state<Cliente | null>(null);
  let vendedor = $state<Vendedor | null>(null);
  let loading = $state(true);

  const pedidoId = page.params.id;

  async function load() {
    loading = true;
    try {
      const [pRes, iRes] = await Promise.all([
        db.select("SELECT * FROM pedidos WHERE id = $1 LIMIT 1", [pedidoId]),
        db.select(
          `
                    SELECT pi.*, p.descricao as nome, p.codigo as codigo, p.preco_custo
                    FROM pedido_itens pi
                    LEFT JOIN produtos p ON pi.produto_id = p.id
                    WHERE pedido_id = $1`,
          [pedidoId]
        ),
      ]);
      pedido = (pRes as Array<Pedido>)[0];
      items = iRes as Array<OrderItem>;

      if (pedido) {
        const [cRes, vRes] = await Promise.all([
          db.select("SELECT * FROM clientes WHERE id = $1", [
            pedido.cliente_id,
          ]),
          pedido.vendedor_id
            ? db.select("SELECT * FROM vendedores WHERE id = $1", [
                pedido.vendedor_id,
              ])
            : Promise.resolve(null),
        ]);

        cliente = (cRes as Array<Cliente>)[0];
        vendedor = vRes ? (vRes as Array<Vendedor>)[0] : null;
      }
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

<div class="p-6 w-full mx-auto space-y-6">
  <div class="flex items-center gap-4">
    <Button variant="ghost" size="icon" onclick={() => goto("/pedidos")}>
      <ChevronLeft class="h-6 w-6" />
    </Button>
    <h1 class="text-3xl font-bold">Detalhes do Pedido</h1>

    <Button variant="outline" class="ml-auto" onclick={() => window.print()}>
      <Printer class="mr-2 h-4 w-4" /> Imprimir
    </Button>
  </div>

  {#if loading}
    <div class="flex h-[calc(100svh-32px)]">
      <Spinner class="h-12 w-12 stroke-primary mx-auto my-auto" />
    </div>
  {:else if pedido}
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <Card.Root class="md:col-span-2">
        <Card.Header>
          <div class="flex justify-between items-center">
            <Card.Title class="text-2xl text-primary">
              #{pedido.numero_pedido}
            </Card.Title>
            <Badge variant="outline" class="text-sm font-bold bg-primary/10">
              {pedido.situacao}
            </Badge>
          </div>
          <Card.Description>
            Emitido em {new Date(pedido.data_pedido).toLocaleDateString(
              "pt-BR"
            )}
          </Card.Description>
        </Card.Header>
        <Card.Content class="space-y-6">
          <div class="grid grid-cols-2 gap-4 text-sm">
            <div class="space-y-1">
              <span
                class="text-muted-foreground block text-xs uppercase tracking-wider font-bold"
              >
                Cliente
              </span>
              <p class="text-lg font-semibold">
                {cliente?.nome || "—"}
              </p>
            </div>
            <div class="space-y-1">
              <span
                class="text-muted-foreground block text-xs uppercase tracking-wider font-bold"
              >
                Vendedor
              </span>
              <p class="text-lg font-semibold">
                {vendedor?.nome || "—"}
              </p>
            </div>
          </div>

          <div class="border-t pt-6">
            <h3 class="font-bold mb-4 text-lg">Itens do Pedido</h3>
            <Table.Root>
              <Table.Header>
                <Table.Row>
                  <Table.Head class="w-16">Cód</Table.Head>
                  <Table.Head>Produto</Table.Head>
                  <Table.Head class="text-center w-12">Qtd</Table.Head>
                  <Table.Head class="text-right w-24">CUSTO</Table.Head>
                  <Table.Head class="text-right w-24">VENDA</Table.Head>
                  <Table.Head class="text-right w-28">Subtotal</Table.Head>
                </Table.Row>
              </Table.Header>
              <Table.Body>
                {#each items as item}
                  <Table.Row>
                    <Table.Cell class="font-mono text-xs">
                      {item.codigo}
                    </Table.Cell>
                    <Table.Cell class="font-medium">
                      {item.nome || "Produto"}
                    </Table.Cell>
                    <Table.Cell class="text-center">
                      {item.quantidade_saida - item.quantidade_retorno}
                    </Table.Cell>
                    <Table.Cell class="text-right text-muted-foreground">
                      {formatCurrency(item.preco_custo || 0)}
                    </Table.Cell>
                    <Table.Cell class="text-right">
                      {formatCurrency(item.preco_venda)}
                    </Table.Cell>
                    <Table.Cell class="text-right font-bold">
                      {formatCurrency(
                        (item.preco_venda || 0) *
                          (item.quantidade_saida - item.quantidade_retorno)
                      )}
                    </Table.Cell>
                  </Table.Row>
                {/each}
              </Table.Body>
              <tfoot class="border-t-2 font-bold bg-muted/30">
                <tr>
                  <td class="p-2">{items.length} itens</td>
                  <td></td>
                  <td class="text-center p-2">
                    {items.reduce(
                      (a, i) => a + (i.quantidade_saida - i.quantidade_retorno),
                      0
                    )}
                  </td>
                  <td class="text-right p-2">
                    {formatCurrency(
                      items.reduce(
                        (a, i) =>
                          a +
                          (i.preco_custo || 0) *
                            (i.quantidade_saida - i.quantidade_retorno),
                        0
                      )
                    )}
                  </td>
                  <td class="text-right p-2">
                    {formatCurrency(
                      items.reduce(
                        (a, i) =>
                          a +
                          (i.preco_venda || 0) *
                            (i.quantidade_saida - i.quantidade_retorno),
                        0
                      )
                    )}
                  </td>
                  <td class="text-right p-2 text-primary">
                    DIF: {formatCurrency(
                      items.reduce(
                        (a, i) =>
                          a +
                          (i.preco_venda || 0) *
                            (i.quantidade_saida - i.quantidade_retorno),
                        0
                      ) -
                        items.reduce(
                          (a, i) =>
                            a +
                            (i.preco_custo || 0) *
                              (i.quantidade_saida - i.quantidade_retorno),
                          0
                        )
                    )}
                  </td>
                </tr>
              </tfoot>
            </Table.Root>
          </div>
        </Card.Content>
      </Card.Root>

      <div class="space-y-6">
        <Card.Root>
          <Card.Header>
            <Card.Title>Resumo Financeiro</Card.Title>
          </Card.Header>
          <Card.Content class="space-y-4">
            <div class="flex justify-between text-sm">
              <span class="text-muted-foreground"> Valor Bruto </span>
              <span>{formatCurrency(pedido.valor_total)}</span>
            </div>
            <div class="flex justify-between text-sm">
              <span class="text-muted-foreground"> Valor Pago </span>
              <span class="text-green-600 font-semibold">
                {formatCurrency(pedido.valor_pago)}
              </span>
            </div>
            {#if (pedido.valor_total || 0) - (pedido.valor_pago || 0) > 0}
              <div class="flex justify-between text-sm">
                <span class="text-muted-foreground"> Saldo Devedor </span>
                <span class="text-red-600 font-bold">
                  {formatCurrency(
                    (pedido.valor_total || 0) - (pedido.valor_pago || 0)
                  )}
                </span>
              </div>
            {/if}
            <div class="border-t pt-4 flex justify-between items-center">
              <span class="font-bold text-lg mr-5"> Total: </span>
              <span class="text-2xl font-black text-primary">
                {formatCurrency(pedido.valor_total)}
              </span>
            </div>
          </Card.Content>
        </Card.Root>

        {#if pedido.solicitacao_numero}
          <Card.Root class="bg-primary/5">
            <Card.Header class="pb-2">
              <Card.Title class="text-sm">Solicitação Relacionada</Card.Title>
            </Card.Header>
            <Card.Content>
              <p class="font-bold text-lg">
                #{pedido.solicitacao_numero}
              </p>
            </Card.Content>
          </Card.Root>
        {/if}
      </div>
    </div>
  {:else}
    <div class="text-center py-20">
      <h2 class="text-xl font-bold">Pedido não encontrado.</h2>
      <Button variant="link" onclick={() => goto("/pedidos")}>
        Voltar para a lista
      </Button>
    </div>
  {/if}
</div>
