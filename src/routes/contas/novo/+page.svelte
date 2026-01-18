<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select";
    import type { ContaFinanceira, Cliente, Fornecedor } from "@/types";
    import db, { queryHelper } from "@/db/db.svelte";
    import Needed from "@/components/needed.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let clientes = $state<Array<Cliente>>([]);
    let fornecedores = $state<Array<Fornecedor>>([]);

    let accountData = $state<{
        descricao: string;
        tipo: string;
        categoria: string;
        cliente_id: string;
        fornecedor_id: string;
        valor_original: number;
        data_vencimento: string;
        situacao: string;
    }>({
        descricao: "",
        tipo: "receita",
        categoria: "",
        cliente_id: "-1",
        fornecedor_id: "-1",
        valor_original: 0,
        data_vencimento: new Date().toISOString().split("T")[0],
        situacao: "pendente",
    });

    async function save() {
        if (
            !accountData.descricao ||
            !accountData.valor_original ||
            !accountData.data_vencimento
        ) {
            toast.error("Descrição, valor e vencimento são obrigatórios.");
            return;
        }

        try {
            const dataToSave = {
                descricao: accountData.descricao,
                tipo: accountData.tipo,
                categoria: accountData.categoria || null,
                cliente_id:
                    accountData.tipo === "receita" &&
                    accountData.cliente_id !== "-1"
                        ? parseInt(accountData.cliente_id)
                        : null,
                fornecedor_id:
                    accountData.tipo === "despesa" &&
                    accountData.fornecedor_id !== "-1"
                        ? parseInt(accountData.fornecedor_id)
                        : null,
                valor_original: Number(accountData.valor_original),
                valor_pago: 0,
                valor_restante: Number(accountData.valor_original),
                data_vencimento: accountData.data_vencimento,
                situacao: accountData.situacao,
            };

            let q = queryHelper(dataToSave);

            await db.execute(
                `INSERT INTO contas_financeiras (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Conta criada com sucesso!");
            goto("/contas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar conta");
            console.error(e);
        }
    }

    async function loadAuxiliaryData() {
        try {
            const [clientesRes, fornecedoresRes] = await Promise.all([
                db.select("SELECT id, nome FROM clientes ORDER BY nome", []),
                db.select(
                    "SELECT id, razao_social FROM fornecedores ORDER BY razao_social",
                    [],
                ),
            ]);
            clientes = clientesRes as Array<Cliente>;
            fornecedores = fornecedoresRes as Array<Fornecedor>;
        } catch (e: any) {
            console.error("Erro ao carregar dados auxiliares:", e);
        }
    }

    onMount(() => loadAuxiliaryData());
</script>

<div class="p-6 w-full mx-auto space-y-6">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button variant="ghost" size="icon" onclick={() => goto("/contas")}>
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight">Nova Conta</h1>
        </div>
        <Button onclick={save} class="gap-2">
            <Save class="h-4 w-4" />
            Salvar Conta
        </Button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card.Root class="md:col-span-2">
            <Card.Header>
                <Card.Title>Detalhes da Conta</Card.Title>
                <Card.Description
                    >Informações principais da movimentação financeira.</Card.Description
                >
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid gap-2">
                    <Label for="descricao">Descrição <Needed /></Label>
                    <Input
                        id="descricao"
                        bind:value={accountData.descricao}
                        placeholder="Ex: Venda de Produtos, Aluguel, etc."
                    />
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="tipo">Tipo <Needed /></Label>
                        <Select.Root
                            type="single"
                            bind:value={accountData.tipo}
                        >
                            <Select.Trigger class="w-full">
                                {accountData.tipo === "receita"
                                    ? "Receita"
                                    : "Despesa"}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="receita"
                                    >Receita</Select.Item
                                >
                                <Select.Item value="despesa"
                                    >Despesa</Select.Item
                                >
                            </Select.Content>
                        </Select.Root>
                    </div>
                    <div class="grid gap-2">
                        <Label for="categoria">Categoria</Label>
                        <Input
                            id="categoria"
                            bind:value={accountData.categoria}
                            placeholder="Ex: Operacional, Vendas, etc."
                        />
                    </div>
                </div>

                {#if accountData.tipo === "receita"}
                    <div class="grid gap-2">
                        <Label for="cliente">Cliente</Label>
                        <Select.Root
                            type="single"
                            bind:value={accountData.cliente_id}
                        >
                            <Select.Trigger class="w-full">
                                {@const client = clientes.find(
                                    (c) =>
                                        String(c.id) === accountData.cliente_id,
                                )}
                                {client
                                    ? client.nome
                                    : "Selecione um cliente..."}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1"
                                    >Selecione um cliente...</Select.Item
                                >
                                {#each clientes as cliente}
                                    <Select.Item value={String(cliente.id)}
                                        >{cliente.nome}</Select.Item
                                    >
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>
                {:else}
                    <div class="grid gap-2">
                        <Label for="fornecedor">Fornecedor</Label>
                        <Select.Root
                            type="single"
                            bind:value={accountData.fornecedor_id}
                        >
                            <Select.Trigger class="w-full">
                                {@const supplier = fornecedores.find(
                                    (f) =>
                                        String(f.id) ===
                                        accountData.fornecedor_id,
                                )}
                                {supplier
                                    ? supplier.razao_social
                                    : "Selecione um fornecedor..."}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1"
                                    >Selecione um fornecedor...</Select.Item
                                >
                                {#each fornecedores as fornecedor}
                                    <Select.Item value={String(fornecedor.id)}
                                        >{fornecedor.razao_social}</Select.Item
                                    >
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>
                {/if}
            </Card.Content>
        </Card.Root>

        <Card.Root>
            <Card.Header>
                <Card.Title>Valores e Prazos</Card.Title>
                <Card.Description>Prazos e status da conta.</Card.Description>
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid gap-2">
                    <Label for="valor">Valor Original <Needed /></Label>
                    <Input
                        id="valor"
                        type="number"
                        step="0.01"
                        bind:value={accountData.valor_original}
                    />
                </div>

                <div class="grid gap-2">
                    <Label for="vencimento">Data de Vencimento <Needed /></Label
                    >
                    <Input
                        id="vencimento"
                        type="date"
                        bind:value={accountData.data_vencimento}
                    />
                </div>

                <div class="grid gap-2">
                    <Label for="situacao">Situação</Label>
                    <Select.Root
                        type="single"
                        bind:value={accountData.situacao}
                    >
                        <Select.Trigger class="w-full capitalize">
                            {accountData.situacao}
                        </Select.Trigger>
                        <Select.Content>
                            <Select.Item value="pendente">Pendente</Select.Item>
                            <Select.Item value="pago">Pago</Select.Item>
                            <Select.Item value="atrasado">Atrasado</Select.Item>
                            <Select.Item value="cancelado"
                                >Cancelado</Select.Item
                            >
                        </Select.Content>
                    </Select.Root>
                </div>
            </Card.Content>
        </Card.Root>
    </div>
</div>
