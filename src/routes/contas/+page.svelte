<script lang="ts">
    import { Button } from "$lib/components/ui/button/index";
    import * as Table from "$lib/components/ui/table/index.js";
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import { Input } from "$lib/components/ui/input/index";
    import type { Cliente, ContaFinanceira, Vendedor } from "$lib/types";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import TrendingUp from "@lucide/svelte/icons/trending-up";
    import Wallet from "@lucide/svelte/icons/wallet";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let contas = $state<Array<ContaFinanceira>>([]);
    let vendedores = $state<Array<Vendedor>>([]);
    let clientes = $state<Array<Cliente>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredContas = $derived(
        contas.filter(
            (c) =>
                c.numero_documento
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                c.tipo_documento
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()),
        ),
    );

    // QOL: Summary statistics
    let totalPendente = $derived(
        contas
            .filter((c) => c.situacao?.toLowerCase() !== "pago")
            .reduce((acc, c) => acc + parseFloat(`${c.valor}`), 0),
    );

    let totalPago = $derived(
        contas
            .filter((c) => c.situacao?.toLowerCase() === "pago")
            .reduce((acc, c) => acc + parseFloat(`${c.valor}`), 0),
    );

    let contaData = $state<Partial<ContaFinanceira>>({
        data_emissao: new Date().toISOString().split("T")[0] as any,
        tipo_documento: "",
        numero_documento: "",
        valor: 0,
        data_vencimento: new Date().toISOString().split("T")[0] as any,
        situacao: "Pendente",
    });

    async function save() {
        try {
            const dataToSave = { ...contaData };
            delete (dataToSave as any).data_cadastro;

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE contas_financeiras SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO contas_financeiras (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Conta ${dataToSave.id ? "atualizada" : "criada"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar conta: ${message}`);
            console.error("Erro ao salvar conta:", e);
        }
    }

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir esta conta financeira?"))
            return;
        try {
            await db.execute("DELETE FROM contas_financeiras WHERE id = $1", [
                id,
            ]);
            await load();
            toast.success("Conta excluída com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar conta: ${message}`);
            console.error("Erro ao deletar conta:", e);
        }
    }

    async function load() {
        try {
            contas = (await db.select(
                "SELECT * FROM contas_financeiras",
                [],
            )) as Array<ContaFinanceira>;
            vendedores = (await db.select(
                "SELECT * FROM vendedores",
                [],
            )) as Array<Vendedor>;
            clientes = (await db.select(
                "SELECT * FROM clientes",
                [],
            )) as Array<Cliente>;
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

    function formatCurrency(value: number) {
        console.log(value);
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }

    function resetContaData() {
        contaData = {
            data_emissao: new Date().toISOString().split("T")[0] as any,
            tipo_documento: "",
            numero_documento: "",
            valor: 0,
            data_vencimento: new Date().toISOString().split("T")[0] as any,
            situacao: "Pendente",
        };
    }
</script>

<div class="m-10 space-y-6">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card.Root class="bg-primary/5 border-primary/20">
            <Card.Header class="pb-2">
                <Card.Description class="flex items-center gap-2">
                    <Wallet class="h-4 w-4 text-primary" />
                    Balanço Pendente
                </Card.Description>
                <Card.Title class="text-3xl font-bold text-red-600">
                    {formatCurrency(totalPendente)}
                </Card.Title>
            </Card.Header>
        </Card.Root>
        <Card.Root class="bg-green-500/5 border-green-500/20">
            <Card.Header class="pb-2">
                <Card.Description class="flex items-center gap-2">
                    <TrendingUp class="h-4 w-4 text-green-600" />
                    Total Liquidado
                </Card.Description>
                <Card.Title class="text-3xl font-bold text-green-600"
                    >{formatCurrency(totalPago)}</Card.Title
                >
            </Card.Header>
        </Card.Root>
    </div>

    <Card.Root>
        <Card.Header class="flex flex-row items-center">
            <div>
                <Card.Title class="text-3xl">Contas Financeiras</Card.Title>
                <Card.Description
                    >Gerencie suas contas a pagar e a receber.</Card.Description
                >
            </div>
            <Button
                class="ml-auto cursor-pointer"
                variant="outline"
                size="lg"
                onclick={() => {
                    resetContaData();
                    dialog = "new";
                }}
            >
                Nova conta
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
                        placeholder="Pesquisar por documento..."
                        class="pl-8"
                        bind:value={searchQuery}
                    />
                </div>
            </div>

            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Emissão</Table.Head>
                        <Table.Head>Nº Doc.</Table.Head>
                        <Table.Head>Valor</Table.Head>
                        <Table.Head>Vencimento</Table.Head>
                        <Table.Head>Situação</Table.Head>
                        <Table.Head class="w-[50px]"></Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each filteredContas as conta (conta.id)}
                        <Table.Row>
                            <Table.Cell
                                >{new Date(
                                    conta.data_emissao,
                                ).toLocaleDateString("pt-BR")}</Table.Cell
                            >
                            <Table.Cell class="font-medium text-primary">
                                {conta.numero_documento}
                                <span
                                    class="block text-xs text-muted-foreground"
                                    >{conta.tipo_documento}</span
                                >
                            </Table.Cell>
                            <Table.Cell class="font-bold"
                                >{formatCurrency(conta.valor)}</Table.Cell
                            >
                            <Table.Cell
                                >{new Date(
                                    conta.data_vencimento,
                                ).toLocaleDateString("pt-BR")}</Table.Cell
                            >
                            <Table.Cell>
                                <span
                                    class={`px-2.5 py-0.5 rounded-full text-xs font-semibold ${
                                        conta.situacao === "Pago"
                                            ? "bg-green-100 text-green-800"
                                            : "bg-yellow-100 text-yellow-800"
                                    }`}
                                >
                                    {conta.situacao}
                                </span>
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
                                                <Ellipsis class="h-4 w-4" />
                                            </Button>
                                        {/snippet}
                                    </DropdownMenu.Trigger>
                                    <DropdownMenu.Content align="end">
                                        <DropdownMenu.Group>
                                            <DropdownMenu.Label
                                                >Ações</DropdownMenu.Label
                                            >
                                            <DropdownMenu.Separator />
                                            <DropdownMenu.Item
                                                onclick={() => {
                                                    contaData = { ...conta };
                                                    dialog = "edit";
                                                }}
                                            >
                                                <PencilLine
                                                    class="mr-2 h-4 w-4"
                                                />
                                                Editar
                                            </DropdownMenu.Item>
                                            <DropdownMenu.Item
                                                class="text-destructive focus:text-destructive"
                                                onclick={() =>
                                                    delete_(conta.id)}
                                            >
                                                <Trash2 class="mr-2 h-4 w-4" />
                                                Excluir
                                            </DropdownMenu.Item>
                                        </DropdownMenu.Group>
                                    </DropdownMenu.Content>
                                </DropdownMenu.Root>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={6}
                                class="text-center py-10 text-muted-foreground"
                            >
                                Nenhuma conta encontrada.
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                </Table.Body>
            </Table.Root>
        </Card.Content>
    </Card.Root>
</div>

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
                {dialog === "new" ? "Nova Conta" : "Editar Conta"}
            </Dialog.Title>
            <Dialog.Description>
                Preencha os detalhes financeiros abaixo.
            </Dialog.Description>
        </Dialog.Header>

        <div class="grid gap-4 py-4">
            <div class="grid grid-cols-2 gap-4">
                <div class="grid gap-2">
                    <Label for="tipo">Tipo de Documento</Label>
                    <Input
                        id="tipo"
                        bind:value={contaData.tipo_documento}
                        placeholder="Ex: NF, Boleto"
                    />
                </div>
                <div class="grid gap-2">
                    <Label for="numero">Nº Documento</Label>
                    <Input
                        id="numero"
                        bind:value={contaData.numero_documento}
                        placeholder="000.000"
                    />
                </div>
            </div>

            <div class="grid grid-cols-3 gap-4">
                <div class="grid gap-2">
                    <Label for="emissao">Emissão</Label>
                    <Input
                        id="emissao"
                        type="date"
                        bind:value={contaData.data_emissao}
                    />
                </div>
                <div class="grid gap-2">
                    <Label for="vencimento">Vencimento</Label>
                    <Input
                        id="vencimento"
                        type="date"
                        bind:value={contaData.data_vencimento}
                    />
                </div>
                <div class="grid gap-2">
                    <Label for="valor">Valor</Label>
                    <Input
                        id="valor"
                        type="number"
                        step="0.01"
                        bind:value={contaData.valor}
                    />
                </div>
            </div>

            <div class="grid gap-2">
                <Label for="cliente">Cliente (Opcional)</Label>
                <select
                    id="cliente"
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    bind:value={contaData.cliente_id}
                >
                    <option value={0}>Selecione um cliente</option>
                    {#each clientes as cliente}
                        <option value={cliente.id}>{cliente.nome}</option>
                    {/each}
                </select>
            </div>

            <div class="grid gap-2">
                <Label for="situacao">Situação</Label>
                <select
                    id="situacao"
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                    bind:value={contaData.situacao}
                >
                    <option value="Pendente">Pendente</option>
                    <option value="Pago">Pago</option>
                    <option value="Atrasado">Atrasado</option>
                </select>
            </div>

            <div class="grid gap-2">
                <Label for="obs">Observações</Label>
                <Input
                    id="obs"
                    bind:value={contaData.observacoes}
                    placeholder="Notas adicionais..."
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
