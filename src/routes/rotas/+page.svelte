<script lang="ts">
  import Route from "@lucide/svelte/icons/route";
  import * as Card from "$lib/components/ui/card/index.js";
  import * as Dialog from "$lib/components/ui/dialog/index.js";
  import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
  import * as Table from "$lib/components/ui/table/index.js";
  import { Button } from "@/components/ui/button/index";
  import { Input } from "@/components/ui/input/index";
  import { Label } from "@/components/ui/label/index";
  import db, { queryHelper } from "@/db/db.svelte";
  import type { Praca, Rota } from "@/types";
  import Ellipsis from "@lucide/svelte/icons/ellipsis";
  import PencilLine from "@lucide/svelte/icons/pencil-line";
  import Plus from "@lucide/svelte/icons/plus";
  import Trash2 from "@lucide/svelte/icons/trash-2";
  import { onMount } from "svelte";
  import { toast } from "svelte-sonner";

  let routes = $state<Array<Rota>>([]);
  let pracas = $state<Array<Praca>>([]);
  let dialog = $state<string | null>(null);

  let routeData = $state<Partial<Rota>>({
    codigo: "",
    nome: "",
    bairro: "",
    praca_id: 0,
  });

  async function save() {
    try {
      const dataToSave = { ...routeData };
      delete (dataToSave as any).data_cadastro;

      let q = queryHelper(dataToSave);
      let query = "";

      if (dataToSave.id) {
        query = `UPDATE rotas SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
      } else {
        query = `INSERT INTO rotas (${q.columns}) VALUES (${q.placeholders})`;
      }

      await db.execute(query, q.values);

      await load();
      dialog = null;
      toast.success(
        `Rota ${dataToSave.id ? "atualizada" : "criada"} com sucesso!`
      );
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      toast.error(`Falha ao salvar rota: ${message}`);
      console.error("Erro ao salvar rota:", e);
    }
  }

  async function delete_(id: number) {
    try {
      await db.execute("DELETE FROM rotas WHERE id = $1", [id]);
      await load();
      toast.success("Rota excluído com sucesso!");
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      toast.error(`Falha ao deletar rota: ${message}`);
      console.error("Erro ao deletar rota:", e);
    }
  }

  async function load() {
    try {
      routes = (await db.select("SELECT * FROM rotas", [])) as Array<Rota>;
      pracas = (await db.select("SELECT * FROM pracas", [])) as Array<Praca>;
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      toast.error(`Falha ao carregar rotas: ${message}`);
      console.error("Erro ao carregar rotas:", e);
    }
  }

  onMount(() => load());
</script>

<Card.Root class="m-10">
  <Card.Header class="flex w-full">
    <Card.Title class="text-3xl flex items-center gap-2">
      <Route class="h-8 w-8 text-primary" />
      Gerenciamento de Rotas
    </Card.Title>
    <Button
      class="ml-auto cursor-pointer"
      variant="outline"
      size="lg"
      onclick={() => {
        dialog = "new";
      }}
    >
      Nova rota
      <Plus class="stroke-2" />
    </Button>
  </Card.Header>
  <Card.Content>
    <Table.Root>
      <Table.Caption>Lista de vendedores.</Table.Caption>
      <Table.Header>
        <Table.Row>
          <Table.Head>Código</Table.Head>
          <Table.Head>Praça</Table.Head>
          <Table.Head>Bairro</Table.Head>
          <Table.Head>Nome</Table.Head>
          <Table.Head class="w-12.5"></Table.Head>
        </Table.Row>
      </Table.Header>
      <Table.Body>
        {#each routes as route, i (route.id)}
          <Table.Row>
            <Table.Cell>{route.codigo}</Table.Cell>
            <Table.Cell class="text-primary">
              {pracas.find((p) => p.id === route.praca_id)?.nome || "N/A"}
            </Table.Cell>
            <Table.Cell>{route.bairro}</Table.Cell>
            <Table.Cell>{route.nome}</Table.Cell>
            <Table.Cell>
              <Button
                variant="ghost"
                size="icon-lg"
                onclick={() => {
                  routeData = { ...route };
                  dialog = "edit";
                }}
              >
                <PencilLine class="h-4 w-4 stroke-3 stroke-lime-400" />
              </Button>
              <Button
                variant="ghost"
                size="icon-lg"
                onclick={() => delete_(route.id)}
              >
                <Trash2 class="h-4 w-4 stroke-3 stroke-red-500" />
              </Button>
            </Table.Cell>
          </Table.Row>
        {/each}
      </Table.Body>
    </Table.Root>
  </Card.Content>
</Card.Root>

<Dialog.Root
  open={dialog != null}
  onOpenChange={(e) =>
    e
      ? null
      : ((dialog = null),
        (routeData = { codigo: "", nome: "", bairro: "", praca_id: 0 }))}
>
  <Dialog.Content class="gap-10">
    <Dialog.Header>
      <Dialog.Title>
        {#if dialog == "new"}
          Nova rota
        {:else if dialog == "edit"}
          Editar rota
        {/if}
      </Dialog.Title>
    </Dialog.Header>

    <div class="flex flex-col gap-5">
      <div class="flex flex-col gap-3">
        <Label for="code">Codigo:</Label>
        <Input id="code" bind:value={routeData.codigo} placeholder="R001..." />
      </div>
      <div class="flex flex-col gap-3">
        <Label for="praca">Praça:</Label>
        <select
          id="praca"
          bind:value={routeData.praca_id}
          class="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring"
          required
        >
          <option value={0}>Selecione uma praça...</option>
          {#each pracas as p}
            <option value={p.id}>{p.codigo} - {p.nome}</option>
          {/each}
        </select>
      </div>
      <div class="flex flex-col gap-3">
        <Label for="name">Nome:</Label>
        <Input id="name" bind:value={routeData.nome} placeholder="..." />
      </div>

      <div class="flex flex-col gap-3">
        <Label for="email">Bairro:</Label>
        <Input id="email" bind:value={routeData.bairro} placeholder="..." />
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
