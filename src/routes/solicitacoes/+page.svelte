<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Solicitacao, Vendedor, Cliente } from "$lib/types";
    import Plus from "@lucide/svelte/icons/plus";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Search from "@lucide/svelte/icons/search";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let solicitacoes = $state<Array<Solicitacao>>([]);
    let vendedores = $state<Array<Vendedor>>([]);
    let clientes = $state<Array<Cliente>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredSolicitacoes = $derived(
        solicitacoes.filter(
            (s) =>
                s.numero.toLowerCase().includes(searchQuery.toLowerCase()) ||
                clientes
                    .find((c) => c.id === s.cliente_id)
                    ?.nome.toLowerCase()
                    .includes(searchQuery.toLowerCase()),
        ),
    );

    let solicitacaoData = $state<Partial<Solicitacao>>({
        numero: "",
        vendedor_id: 0,
        cliente_id: 0,
        data_solicitacao: new Date().toISOString().split("T")[0],
        situacao: "Pendente",
    });

    async function save() {
        try {
            const dataToSave = { ...solicitacaoData };
            delete (dataToSave as any).data_cadastro;

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE solicitacoes SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO solicitacoes (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Solicitação ${dataToSave.id ? "atualizada" : "criada"} com sucesso!`,
            );
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar solicitação");
            console.error(e);
        }
    }

    async function delete_(id: number) {
        if (!confirm("Confirmar exclusão?")) return;
        try {
            await db.execute("DELETE FROM solicitacoes WHERE id = $1", [id]);
            await load();
            toast.success("Solicitação excluída com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir solicitação");
            console.error(e);
        }
    }

    async function load() {
        try {
            solicitacoes = (await db.select(
                "SELECT * FROM solicitacoes",
                [],
            )) as Array<Solicitacao>;
            vendedores = (await db.select(
                "SELECT * FROM vendedores",
                [],
            )) as Array<Vendedor>;
            clientes = (await db.select(
                "SELECT * FROM clientes",
                [],
            )) as Array<Cliente>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados do banco de dados.");
        }
    }

    onMount(() => load());

    function resetData() {
        solicitacaoData = {
            numero: "",
            vendedor_id: 0,
            cliente_id: 0,
            data_solicitacao: new Date().toISOString().split("T")[0],
            situacao: "Pendente",
        };
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl"
                >Gerenciamento de Solicitações</Card.Title
            >
            <Card.Description
                >Gerencie as solicitações de clientes e vendedores.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                resetData();
                dialog = "new";
            }}
        >
            Nova solicitação
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
                    placeholder="Pesquisar por número ou cliente..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Número</Table.Head>
                    <Table.Head>Vendedor</Table.Head>
                    <Table.Head>Cliente</Table.Head>
                    <Table.Head>Data</Table.Head>
                    <Table.Head>Situação</Table.Head>
                    <Table.Head class="w-[100px]"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredSolicitacoes as sol (sol.id)}
                    <Table.Row>
                        <Table.Cell class="font-medium text-primary"
                            >{sol.numero}</Table.Cell
                        >
                        <Table.Cell
                            >{vendedores.find((v) => v.id === sol.vendedor_id)
                                ?.nome || "—"}</Table.Cell
                        >
                        <Table.Cell
                            >{clientes.find((c) => c.id === sol.cliente_id)
                                ?.nome || "—"}</Table.Cell
                        >
                        <Table.Cell
                            >{new Date(sol.data_solicitacao).toLocaleDateString(
                                "pt-BR",
                            )}</Table.Cell
                        >
                        <Table.Cell>
                            <span
                                class="px-2 py-1 rounded-full text-xs font-semibold bg-primary/10 text-primary"
                            >
                                {sol.situacao || "Pendente"}
                            </span>
                        </Table.Cell>
                        <Table.Cell class="flex justify-end gap-2">
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => {
                                    solicitacaoData = sol;
                                    dialog = "edit";
                                }}
                            >
                                <PencilLine class="h-4 w-4" />
                            </Button>
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => delete_(sol.id!)}
                            >
                                <Trash2 class="h-4 w-4 text-destructive" />
                            </Button>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={6}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhuma solicitação encontrada.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root open={dialog != null} onOpenChange={(e) => !e && (dialog = null)}>
    <Dialog.Content class="sm:max-w-[425px]">
        <Dialog.Header>
            <Dialog.Title
                >{dialog === "new"
                    ? "Nova Solicitação"
                    : "Editar Solicitação"}</Dialog.Title
            >
            <Dialog.Description
                >Preencha os campos abaixo para salvar a solicitação.</Dialog.Description
            >
        </Dialog.Header>
        <div class="grid gap-4 py-4">
            <div class="grid gap-2">
                <Label for="numero">Número</Label>
                <Input
                    id="numero"
                    bind:value={solicitacaoData.numero}
                    placeholder="Ex: SOL-001"
                />
            </div>
            <div class="grid gap-2">
                <Label for="data">Data</Label>
                <Input
                    id="data"
                    type="date"
                    bind:value={solicitacaoData.data_solicitacao}
                />
            </div>
            <div class="grid gap-2">
                <Label for="vendedor">Vendedor</Label>
                <select
                    id="vendedor"
                    bind:value={solicitacaoData.vendedor_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    <option value={0}>Selecione um vendedor...</option>
                    {#each vendedores as v}
                        <option value={v.id}>{v.nome}</option>
                    {/each}
                </select>
            </div>
            <div class="grid gap-2">
                <Label for="cliente">Cliente</Label>
                <select
                    id="cliente"
                    bind:value={solicitacaoData.cliente_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    <option value={0}>Selecione um cliente...</option>
                    {#each clientes as c}
                        <option value={c.id}>{c.nome}</option>
                    {/each}
                </select>
            </div>
            <div class="grid gap-2">
                <Label for="situacao">Situação</Label>
                <Input
                    id="situacao"
                    bind:value={solicitacaoData.situacao}
                    placeholder="Ex: Pendente, Aprovada..."
                />
            </div>
        </div>
        <Dialog.Footer>
            <Button variant="outline" onclick={() => (dialog = null)}
                >Cancelar</Button
            >
            <Button onclick={save}>Salvar</Button>
        </Dialog.Footer>
    </Dialog.Content>
</Dialog.Root>
