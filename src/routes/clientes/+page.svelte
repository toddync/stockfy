<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "@/components/ui/button/index";
    import Checkbox from "@/components/ui/checkbox/checkbox.svelte";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Cliente } from "@/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Users from "@lucide/svelte/icons/users";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let clientes = $state<Array<Cliente>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredClientes = $derived(
        searchQuery
            ? clientes.filter(
                  (c) =>
                      c.nome
                          .toLowerCase()
                          .includes(searchQuery.toLowerCase()) ||
                      (c.cpf_cnpj && c.cpf_cnpj.includes(searchQuery)),
              )
            : clientes,
    );

    let clientData = $state<Partial<Cliente>>({
        nome: "",
        telefone: "",
        cidade: "",
        cpf_cnpj: "",
        ativo: true,
    });

    async function save() {
        try {
            delete clientData.data_cadastro;
            let q = queryHelper(clientData);
            let query = "";

            if (clientData.id) {
                query = `UPDATE clientes SET ${q.setClauses} WHERE id = ${clientData.id}`;
            } else {
                query = `INSERT INTO clientes (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Cliente ${clientData.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar cliente: ${message}`);
            console.error("Erro ao salvar cliente:", e);
            dialog = null;
        }
    }

    async function delete_(id: number) {
        try {
            await db.execute("DELETE FROM clientes WHERE id = $1", [id]);

            await load();
            toast.success("Cliente excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar cliente: ${message}`);
            console.error("Erro ao deletar cliente:", e);
        }
    }

    async function load() {
        try {
            clientes = (await db.select(
                "SELECT * FROM clientes",
                [],
            )) as Array<Cliente>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar clientes: ${message}`);
            console.error("Erro ao carregar clientes:", e);
        } finally {
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex w-full">
        <Card.Title class="text-3xl flex items-center gap-2">
            <Users class="h-8 w-8 text-primary" /> Gerenciamento de Clientes
        </Card.Title>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                dialog = "new";
            }}
        >
            Novo cliente
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
                    placeholder="Pesquisar por nome ou CPF/CNPJ..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Nome</Table.Head>
                    <Table.Head>CPF/CNPJ</Table.Head>
                    <Table.Head>Telefone</Table.Head>
                    <Table.Head>Cidade</Table.Head>
                    <Table.Head class="w-12.5"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredClientes as client (client.id)}
                    <Table.Row>
                        <Table.Cell class="font-medium text-primary">
                            {client.nome}
                        </Table.Cell>
                        <Table.Cell>{client.cpf_cnpj}</Table.Cell>
                        <Table.Cell>{client.telefone}</Table.Cell>
                        <Table.Cell class="text-primary">
                            {client.cidade}
                        </Table.Cell>
                        <Table.Cell>
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => {
                                    clientData = { ...client };
                                    dialog = "edit";
                                }}
                            >
                                <PencilLine
                                    class="h-4 w-4 stroke-lime-500! stroke-3"
                                />
                            </Button>

                            <Button
                                variant="ghost"
                                size="icon-lg"
                                onclick={() => delete_(client.id)}
                            >
                                <Trash2
                                    class="h-4 w-4 stroke-red-500! stroke-3"
                                />
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
              (clientData = {
                  nome: "",
                  telefone: "",
                  cidade: "",
                  cpf_cnpj: "",
                  ativo: true,
              }))}
>
    <Dialog.Content class="gap-10">
        <Dialog.Header>
            <Dialog.Title>
                {#if dialog == "new"}
                    Novo Cliente
                {:else if dialog == "edit"}
                    Editar Cliente
                {/if}
            </Dialog.Title>
        </Dialog.Header>

        <div class="flex flex-col gap-5">
            <div class="flex flex-col gap-3">
                <Label for="name">Nome Completo:</Label>
                <Input
                    id="name"
                    bind:value={clientData.nome}
                    placeholder="Fellype Samuel..."
                />
            </div>

            <div class="flex flex-col gap-3">
                <Label for="phone">Telefone:</Label>
                <Input
                    id="phone"
                    bind:value={clientData.telefone}
                    placeholder="(21) 12345-6789..."
                />
            </div>

            <div class="flex flex-col gap-3">
                <Label for="city">Cidade:</Label>
                <Input
                    id="city"
                    bind:value={clientData.cidade}
                    placeholder="Rio de Janeiro..."
                />
            </div>

            <div class="flex flex-col gap-3">
                <Label for="cpf_cnpj">CPF/CNPJ:</Label>
                <Input
                    id="cpf_cnpj"
                    bind:value={clientData.cpf_cnpj}
                    placeholder="123.456.789-10..."
                />
            </div>

            <div class="flex gap-3">
                <Checkbox id="active" bind:checked={clientData.ativo} />
                <Label for="active">Cliente ativo</Label>
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
