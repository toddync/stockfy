<script lang="ts">
  import Package from "@lucide/svelte/icons/package";
  import { Button } from "$lib/components/ui/button/index";
  import * as Card from "$lib/components/ui/card/index.js";
  import * as Dialog from "$lib/components/ui/dialog/index.js";
  import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
  import { Input } from "$lib/components/ui/input/index";
  import { Label } from "$lib/components/ui/label/index";
  import * as Table from "$lib/components/ui/table/index.js";
  import type { Produto, ProdutoGrupo } from "$lib/types";
  import db, { queryHelper } from "@/db/db.svelte";
  import Ellipsis from "@lucide/svelte/icons/ellipsis";
  import PencilLine from "@lucide/svelte/icons/pencil-line";
  import Plus from "@lucide/svelte/icons/plus";
  import Search from "@lucide/svelte/icons/search";
  import Trash2 from "@lucide/svelte/icons/trash-2";
  import { onMount } from "svelte";
  import { toast } from "svelte-sonner";

  let produtos = $state<Array<Produto>>([]);
  let grupos = $state<Array<ProdutoGrupo>>([]);
  let dialog = $state<string | null>(null);
  let searchQuery = $state("");

  let filteredProdutos = $derived(
    produtos.filter(
      (p) =>
        p.descricao.toLowerCase().includes(searchQuery.toLowerCase()) ||
        p.codigo.toLowerCase().includes(searchQuery.toLowerCase())
    )
  );

  let produtoData = $state<Partial<Produto>>({
    codigo: "",
    descricao: "",
    grupo_id: 0,
    preco_compra: 0,
    preco_custo: 0,
    preco_venda_a: 0,
    preco_venda_b: 0,
    tabela_preco: "A",
    preco_minimo: 0,
  });

  // Pagination
  let currentPage = $state(1);
  const itemsPerPage = 20;
  let totalItems = $state(0);

  async function save() {
    try {
      const dataToSave = { ...produtoData };
      delete dataToSave.data_atualizacao;

      let q = queryHelper(dataToSave);
      let query = "";

      if (dataToSave.id) {
        query = `UPDATE produtos SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
      } else {
        query = `INSERT INTO produtos (${q.columns}) VALUES (${q.placeholders})`;
      }

      await db.execute(query, q.values);

      await load();
      dialog = null;
      toast.success(
        `Produto ${dataToSave.id ? "atualizado" : "criado"} com sucesso!`
      );
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      toast.error(`Falha ao salvar produto: ${message}`);
      console.error("Erro ao salvar produto:", e);
    }
  }

  async function delete_(id: number) {
    if (!confirm("Tem certeza que deseja excluir este produto?")) return;
    try {
      await db.execute("DELETE FROM produtos WHERE id = $1", [id]);
      await load();
      toast.success("Produto excluído com sucesso!");
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      toast.error(`Falha ao deletar produto: ${message}`);
      console.error("Erro ao deletar produto:", e);
    }
  }

  async function load() {
    try {
      const offset = (currentPage - 1) * itemsPerPage;

      const countRes = (await db.select(
        "SELECT COUNT(*) as count FROM produtos",
        []
      )) as any;
      totalItems = countRes[0]?.count || 0;

      produtos = (await db.select(
        `
                SELECT p.*, (SELECT SUM(estoque_atual) FROM produto_variacoes WHERE produto_id = p.id) as estoque_atual
                FROM produtos p
                LIMIT $1 OFFSET $2
            `,
        [itemsPerPage, offset]
      )) as Array<Produto>;

      grupos = (await db.select(
        "SELECT * FROM produto_grupos",
        []
      )) as Array<ProdutoGrupo>;
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      toast.error(`Falha ao carregar dados: ${message}`);
      console.error("Erro ao carregar dados:", e);
    }
  }

  onMount(() => load());

  $effect(() => {
    if (currentPage) load();
  });

  function resetProdutoData() {
    produtoData = {
      codigo: "",
      descricao: "",
      grupo_id: 0,
      preco_compra: 0,
      preco_custo: 0,
      preco_venda_a: 0,
      preco_venda_b: 0,
      tabela_preco: "A",
      preco_minimo: 0,
    };
  }
</script>

<Card.Root class="m-10">
  <Card.Header class="flex flex-row items-center">
    <div>
      <Card.Title class="text-3xl flex items-center gap-2">
        <Package class="h-8 w-8 text-primary" />
        Gerenciamento de Produtos
      </Card.Title>
      <Card.Description>
        Gerencie o catálogo de produtos e seus detalhes.
      </Card.Description>
    </div>
    <Button
      class="ml-auto cursor-pointer"
      variant="outline"
      size="lg"
      onclick={() => {
        resetProdutoData();
        dialog = "new";
      }}
    >
      Novo produto
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
          placeholder="Pesquisar por código ou descrição..."
          class="pl-8"
          bind:value={searchQuery}
        />
      </div>
    </div>

    <Table.Root>
      <Table.Header>
        <Table.Row>
          <Table.Head>Código</Table.Head>
          <Table.Head>Descrição</Table.Head>
          <Table.Head>Grupo</Table.Head>
          <Table.Head class="text-right">Preço Venda</Table.Head>
          <Table.Head class="text-right">Estoque</Table.Head>
          <Table.Head class="w-12.5"></Table.Head>
        </Table.Row>
      </Table.Header>
      <Table.Body>
        {#each filteredProdutos as produto (produto.id)}
          <Table.Row>
            <Table.Cell class="font-medium">{produto.codigo}</Table.Cell>
            <Table.Cell>{produto.descricao}</Table.Cell>
            <Table.Cell>
              {grupos.find((g) => g.id === produto.grupo_id)?.descricao ||
                "N/A"}
            </Table.Cell>
            <Table.Cell class="text-right">
              {produto.preco_venda_a?.toLocaleString("pt-BR", {
                style: "currency",
                currency: "BRL",
              })}
            </Table.Cell>
            <Table.Cell class="text-right">
              <!-- {/* Note: Estoque is handled via variations in the old project, but listed in the main table too */} -->
              {produto.estoque_atual ?? "N/A"}
            </Table.Cell>
            <Table.Cell>
              <Button
                variant="ghost"
                size="icon-lg"
                onclick={() => {
                  produtoData = { ...produto };
                  dialog = "edit";
                }}
              >
                <PencilLine class="h-4 w-4 stroke-3 stroke-lime-400" />
              </Button>
              <Button
                variant="ghost"
                size="icon-lg"
                onclick={() => delete_(produto.id)}
              >
                <Trash2 class="h-4 w-4 stroke-3 stroke-red-500" />
              </Button>
            </Table.Cell>
          </Table.Row>
        {:else}
          <Table.Row>
            <Table.Cell
              colspan={6}
              class="text-center py-10 text-muted-foreground"
            >
              Nenhum produto encontrado com os filtros atuais.
            </Table.Cell>
          </Table.Row>
        {/each}
      </Table.Body>
    </Table.Root>

    <div class="flex items-center justify-end space-x-2 py-4">
      <Button
        variant="outline"
        size="sm"
        onclick={() => (currentPage = Math.max(currentPage - 1, 1))}
        disabled={currentPage === 1}
      >
        Anterior
      </Button>
      <div class="text-sm font-medium">
        Página {currentPage}
      </div>
      <Button
        variant="outline"
        size="sm"
        onclick={() => currentPage++}
        disabled={produtos.length < itemsPerPage}
      >
        Próxima
      </Button>
    </div>
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
  <Dialog.Content class="sm:max-w-[600px]">
    <Dialog.Header>
      <Dialog.Title>
        {dialog === "new" ? "Novo Produto" : "Editar Produto"}
      </Dialog.Title>
      <Dialog.Description>
        Preencha as informações do produto abaixo.
      </Dialog.Description>
    </Dialog.Header>

    <div class="grid gap-4 py-4">
      <div class="grid grid-cols-2 gap-4">
        <div class="grid gap-2">
          <Label for="codigo">Código</Label>
          <Input id="codigo" bind:value={produtoData.codigo} />
        </div>
        <div class="grid gap-2">
          <Label for="grupo">Grupo</Label>
          <select
            id="grupo"
            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
            bind:value={produtoData.grupo_id}
          >
            <option value={0}>Selecione um grupo</option>
            {#each grupos as grupo}
              <option value={grupo.id}>{grupo.descricao}</option>
            {/each}
          </select>
        </div>
      </div>

      <div class="grid gap-2">
        <Label for="descricao">Descrição</Label>
        <Input id="descricao" bind:value={produtoData.descricao} />
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div class="grid gap-2">
          <Label for="preco_compra">Preço Compra</Label>
          <Input
            id="preco_compra"
            type="number"
            step="0.01"
            bind:value={produtoData.preco_compra}
          />
        </div>
        <div class="grid gap-2">
          <Label for="preco_custo">Preço Custo</Label>
          <Input
            id="preco_custo"
            type="number"
            step="0.01"
            bind:value={produtoData.preco_custo}
          />
        </div>
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div class="grid gap-2">
          <Label for="preco_venda">Preço Venda A</Label>
          <Input
            id="preco_venda"
            type="number"
            step="0.01"
            bind:value={produtoData.preco_venda_a}
          />
        </div>
        <div class="grid gap-2">
          <Label for="preco_venda_b">Preço Venda B</Label>
          <Input
            id="preco_venda_b"
            type="number"
            step="0.01"
            bind:value={produtoData.preco_venda_b}
          />
        </div>
      </div>
    </div>

    <Dialog.Footer>
      <Button variant="outline" onclick={() => (dialog = null)}>Cancelar</Button
      >
      <Button onclick={save}>Salvar</Button>
    </Dialog.Footer>
  </Dialog.Content>
</Dialog.Root>
