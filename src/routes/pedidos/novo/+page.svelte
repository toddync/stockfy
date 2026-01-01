<script lang="ts">
  import { goto } from "$app/navigation";
  import { Button } from "$lib/components/ui/button/index";
  import * as Card from "$lib/components/ui/card/index.js";
  import * as Select from "$lib/components/ui/select";
  import { Input } from "$lib/components/ui/input/index";
  import { Label } from "$lib/components/ui/label/index";
  import * as Table from "$lib/components/ui/table/index.js";
  import type { Cliente, PedidoItem, Produto, Vendedor } from "$lib/types";
  import db, { queryHelper } from "@/db/db.svelte";
  import ArrowLeft from "@lucide/svelte/icons/arrow-left";
  import Plus from "@lucide/svelte/icons/plus";
  import ShoppingCart from "@lucide/svelte/icons/shopping-cart";
  import Trash2 from "@lucide/svelte/icons/trash-2";
  import { onMount, onDestroy } from "svelte";
  import { toast } from "svelte-sonner";
  import Barcode from "@lucide/svelte/icons/barcode";

  let clientes = $state<Array<Cliente>>([]);
  let vendedores = $state<Array<Vendedor>>([]);
  let produtos = $state<Array<Produto>>([]);

  let orderData = $state({
    numero_pedido: "",
    cliente_id: 0,
    vendedor_id: 0,
    data_pedido: new Date().toISOString().split("T")[0],
    situacao: "emitido", // Updated from 'pendente' to legacy status
  });

  // Helper to get the correct price based on client's price table
  function getPrice(produto: Produto, tabela: "A" | "B"): number {
    if (tabela === "B" && produto.preco_venda_b != null) {
      return produto.preco_venda_b;
    }
    return produto.preco_venda_a ?? 0;
  }

  let selectedCliente = $derived(
    clientes.find((c) => c.id === orderData.cliente_id)
  );

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
      0
    )
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

  // Barcode scanner state
  let barcodeInput = $state("");

  function handleBarcodeSubmit() {
    if (!barcodeInput.trim()) return;

    const produto = produtos.find(
      (p) => p.codigo.toLowerCase() === barcodeInput.trim().toLowerCase()
    );

    if (!produto) {
      toast.error(`Produto não encontrado: ${barcodeInput}`);
      barcodeInput = "";
      return;
    }

    const tabela = selectedCliente?.tabela_preco ?? "A";
    const preco = getPrice(produto, tabela);

    items.push({
      produto_id: produto.id,
      quantidade_saida: 1,
      preco_venda: preco,
      descricao: produto.descricao,
      codigo: produto.codigo,
    });

    barcodeInput = "";
    toast.success(`Adicionado: ${produto.codigo}`);
  }

  // F5 to remove last item
  function handleKeydown(e: KeyboardEvent) {
    if (e.key === "F5") {
      e.preventDefault();
      if (items.length > 0) {
        const removed = items.pop();
        toast.info(`Removido: ${removed?.codigo}`);
      }
    }
  }

  async function save() {
    if (!orderData.cliente_id || items.length === 0) {
      toast.error("Preencha o cliente e adicione pelo menos um item.");
      return;
    }

    try {
      let q = queryHelper({ ...orderData, valor_total: totalPrice });

      const savedOrder = await db.execute(
        `INSERT INTO pedidos (${q.columns}) VALUES (${q.placeholders})`,
        q.values
      );

      let id = savedOrder.lastInsertId;
      let ids: Array<number> = [];

      try {
        for (let i = 0; i < items.length; i++) {
          let item = {
            ...items[i],
            quantidade_retorno: 0,
            pedido_id: id!,
          };

          delete item.descricao;
          delete item.codigo;

          let q = queryHelper(item);

          console.log(
            `INSERT INTO pedido_itens (${q.columns}) VALUES (${q.placeholders})`,
            q.values
          );

          await db.execute(
            `INSERT INTO pedido_itens (${q.columns}) VALUES (${q.placeholders})`,
            q.values
          );
        }

        toast.success("Pedido realizado com sucesso!");
        goto("/pedidos");
      } catch (e: any) {
        await db.execute("DELETE FROM pedidos WHERE id = $1", [id]);

        toast.error(e.message);
        console.error(e);
      }
    } catch (e: any) {
      toast.error(e.message);
      console.error(e);
    }
  }

  async function load() {
    try {
      const [clientesRes, vendedoresRes, produtosRes] = await Promise.all([
        db.select("SELECT * FROM clientes", []),
        db.select("SELECT * FROM vendedores", []),
        db.select("SELECT * FROM produtos", []),
      ]);

      clientes = clientesRes as Array<Cliente>;
      vendedores = vendedoresRes as Array<Vendedor>;
      produtos = produtosRes as Array<Produto>;
    } catch (e: any) {
      console.error(e);
    }
  }

  onMount(() => {
    load();
    window.addEventListener("keydown", handleKeydown);
  });

  onDestroy(() => {
    window.removeEventListener("keydown", handleKeydown);
  });

  function formatCurrency(value: number) {
    return value.toLocaleString("pt-BR", {
      style: "currency",
      currency: "BRL",
    });
  }
</script>

<div class="p-6 mx-auto space-y-6">
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
            <Input id="date" type="date" bind:value={orderData.data_pedido} />
          </div>
        </div>

        <div class="grid grid-cols-2 gap-4">
          <div class="grid gap-3">
            <Label for="client">Cliente</Label>
            <Select.Root
              type="single"
              onValueChange={(v) => {
                orderData.cliente_id = parseInt(v);
              }}
            >
              <Select.Trigger class="w-full" id="client">
                {orderData.cliente_id && orderData.cliente_id >= 0
                  ? clientes.find((c) => c.id == orderData.cliente_id)?.nome
                  : "Selecione um cliente..."}
              </Select.Trigger>
              <Select.Content>
                <Select.Item value="-1">Selecione um cliente...</Select.Item>
                {#each clientes as c}
                  <Select.Item value={`${c.id}`}>
                    {c.nome}
                  </Select.Item>
                {/each}
              </Select.Content>
            </Select.Root>
          </div>
          <div class="grid gap-2">
            <Label for="seller">Vendedor</Label>
            <Select.Root
              type="single"
              onValueChange={(v) => {
                orderData.vendedor_id = parseInt(v);
              }}
            >
              <Select.Trigger class="w-full" id="seller">
                {orderData.vendedor_id && orderData.vendedor_id >= 0
                  ? vendedores.find((c) => c.id == orderData.vendedor_id)?.nome
                  : "Selecione um vendedor..."}
              </Select.Trigger>
              <Select.Content>
                <Select.Item value="-1">Selecione um vendedor...</Select.Item>
                {#each vendedores as v}
                  <Select.Item value={`${v.id}`}>
                    {v.nome}
                  </Select.Item>
                {/each}
              </Select.Content>
            </Select.Root>
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
        <div class="flex justify-between text-2xl font-bold pt-4 border-t">
          <span>Total:</span>
          <span class="text-primary">{formatCurrency(totalPrice)}</span>
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
      <!-- Barcode Scanner Input -->
      <div
        class="flex gap-4 items-end bg-primary/5 p-4 rounded-lg border border-primary/20"
      >
        <div class="flex-1 grid gap-2">
          <Label class="flex items-center gap-2">
            <Barcode class="h-4 w-4" />
            Código de Barras / Código do Produto
          </Label>
          <Input
            bind:value={barcodeInput}
            placeholder="Leia ou digite o código e pressione Enter..."
            class="font-mono text-lg"
            onkeydown={(e) => e.key === "Enter" && handleBarcodeSubmit()}
          />
        </div>
        <Button onclick={handleBarcodeSubmit}>Adicionar</Button>
      </div>

      <div class="text-xs text-muted-foreground text-center">
        Dica: Pressione <kbd class="px-1 py-0.5 bg-muted rounded">F5</kbd> para remover
        o último item adicionado.
      </div>
      <div class="grid grid-cols-4 gap-4 items-end bg-muted/30 p-4 rounded-lg">
        <div class="grid gap-2 col-span-2">
          <Label>Produto</Label>
          <Select.Root
            type="single"
            onValueChange={(v) => {
              currentItem.produto_id = parseInt(v);
              const p = produtos.find(
                (prod) => prod.id === currentItem.produto_id
              );
              if (p) {
                const tabela = selectedCliente?.tabela_preco ?? "A";
                currentItem.preco_venda = getPrice(p, tabela);
              }
            }}
          >
            <Select.Trigger class="w-full" id="cliente">
              {currentItem.produto_id && currentItem.produto_id >= 0
                ? produtos.find((c) => c.id == currentItem.produto_id)
                    ?.descricao
                : "Selecione um produto..."}
            </Select.Trigger>
            <Select.Content>
              <Select.Item value="-1">Selecione um produto...</Select.Item>
              {#each produtos as p}
                <Select.Item value={`${p.id}`}>
                  {p.codigo} - {p.descricao}
                </Select.Item>
              {/each}
            </Select.Content>
          </Select.Root>
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
            <Table.Head class="w-12.5"></Table.Head>
          </Table.Row>
        </Table.Header>
        <Table.Body>
          {#each items as item, i}
            <Table.Row>
              <Table.Cell>{item.codigo}</Table.Cell>
              <Table.Cell>{item.descricao}</Table.Cell>
              <Table.Cell class="text-right">{item.quantidade_saida}</Table.Cell
              >
              <Table.Cell class="text-right"
                >{formatCurrency(item.preco_venda || 0)}</Table.Cell
              >
              <Table.Cell class="text-right font-bold"
                >{formatCurrency(
                  (item.quantidade_saida || 0) * (item.preco_venda || 0)
                )}</Table.Cell
              >
              <Table.Cell>
                <Button
                  variant="ghost"
                  size="icon"
                  onclick={() => removeItem(i)}
                >
                  <Trash2 class="h-4 w-4 stroke-red-500 stroke-3" />
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
