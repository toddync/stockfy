<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select";
    import { Spinner } from "@/components/ui/spinner";
    import { Textarea } from "@/components/ui/textarea/index";
    import type { Cliente, Praca, Rota, Vendedor } from "@/types";
    import { Checkbox } from "@/components/ui/checkbox";
    import db, { queryHelper } from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    const id = Id.id;
    let loading = $state(true);
    let pracas = $state<Array<Praca>>([]);
    let rotas = $state<Array<Rota>>([]);
    let vendedores = $state<Array<Vendedor>>([]);

    let clientData = $state<
        Partial<
            Omit<
                Omit<Omit<Omit<Cliente, "praca_id">, "rota_id">, "ativo">,
                "vendedor_id"
            >
        > & {
            rota_id: string;
            praca_id: string;
            ativo: boolean;
            vendedor_id: string;
        }
    >({
        nome: "",
        cpf_cnpj: "",
        ie_rg: "",
        endereco: "",
        bairro: "",
        cidade: "",
        estado: "",
        cep: "",
        telefone: "",
        email: "",
        limite_credito: 0,
        tabela_preco: "A",
        rota_id: "-1",
        praca_id: "-1",
        dias_visita: "",
        hora_visita_inicio: "",
        hora_visita_fim: "",
        observacoes: "",
        ativo: true,
        vendedor_id: "-1",
    });

    async function save() {
        if (!clientData.nome) {
            toast.error("O nome do cliente é obrigatório.");
            return;
        }

        try {
            // Ensure numbers are numbers and prepare data
            const { id: _, data_cadastro: __, ...rest } = clientData;
            const dataToSave = {
                ...rest,
                limite_credito: Number(clientData.limite_credito) || 0,
                ativo: clientData.ativo ? 1 : 0,
                vendedor_id:
                    clientData.vendedor_id && clientData.vendedor_id !== "-1"
                        ? parseInt(clientData.vendedor_id)
                        : null,
            };

            let q = queryHelper(dataToSave);

            await db.execute(
                `UPDATE clientes SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            toast.success("Cliente atualizado com sucesso!");
            goto("/clientes");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar cliente");
            console.error(e);
        }
    }

    async function load() {
        loading = true;
        try {
            const [clientRes, pracasRes, rotasRes, vendedoresRes] =
                await Promise.all([
                    db.select("SELECT * FROM clientes WHERE id = $1", [id]),
                    db.select("SELECT * FROM pracas ORDER BY nome", []),
                    db.select("SELECT * FROM rotas ORDER BY nome", []),
                    db.select(
                        "SELECT * FROM vendedores WHERE ativo = 1 ORDER BY nome",
                        [],
                    ),
                ]);

            const client = (clientRes as Array<Cliente>)[0];
            if (client) {
                clientData = {
                    ...client,
                    ativo: client.ativo === 1,
                    vendedor_id: client.vendedor_id
                        ? client.vendedor_id.toString()
                        : "-1",
                } as any;
            } else {
                toast.error("Cliente não encontrado.");
                goto("/clientes");
            }

            console.log(clientData);

            pracas = pracasRes as Array<Praca>;
            rotas = rotasRes as Array<Rota>;
            vendedores = vendedoresRes as Array<Vendedor>;
        } catch (e: any) {
            console.error("Erro ao carregar dados:", e);
            toast.error("Erro ao carregar dados do cliente.");
        } finally {
            loading = false;
        }
    }

    onMount(() => load());
</script>

<div class="p-6 w-full mx-auto space-y-6">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/clientes")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight">Editar Cliente</h1>
        </div>
        <Button onclick={save} class="gap-2" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Alterações
        </Button>
    </div>

    {#if loading}
        <div class="flex h-100 items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <Card.Root class="md:col-span-2">
                <Card.Header>
                    <Card.Title>Informações Gerais</Card.Title>
                    <Card.Description
                        >Dados principais e de contato do cliente.</Card.Description
                    >
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="grid gap-2">
                        <Label for="nome">Nome Completo / Razão Social</Label>
                        <Input
                            id="nome"
                            bind:value={clientData.nome}
                            placeholder="Ex: João Silva ou Empresa LTDA"
                        />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="cpf_cnpj">CPF / CNPJ</Label>
                            <Input
                                id="cpf_cnpj"
                                bind:value={clientData.cpf_cnpj}
                                placeholder="000.000.000-00"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="ie_rg">RG / Inscrição Estadual</Label>
                            <Input
                                id="ie_rg"
                                bind:value={clientData.ie_rg}
                                placeholder="IE ou RG"
                            />
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="email">E-mail</Label>
                            <Input
                                id="email"
                                type="email"
                                bind:value={clientData.email}
                                placeholder="cliente@email.com"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="telefone">Telefone</Label>
                            <Input
                                id="telefone"
                                bind:value={clientData.telefone}
                                placeholder="(00) 00000-0000"
                            />
                        </div>
                    </div>

                    <div class="flex items-center space-x-2 pt-2">
                        <Checkbox id="ativo" bind:checked={clientData.ativo} />
                        <Label
                            for="ativo"
                            class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                        >
                            Cliente Ativo
                        </Label>
                    </div>
                </Card.Content>
            </Card.Root>

            <Card.Root>
                <Card.Header>
                    <Card.Title>Configurações</Card.Title>
                    <Card.Description
                        >Regras de negócio e logística.</Card.Description
                    >
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="grid gap-2">
                        <Label for="limite_credito">Limite de Crédito</Label>
                        <Input
                            id="limite_credito"
                            type="number"
                            step="0.01"
                            bind:value={clientData.limite_credito}
                        />
                    </div>

                    <div class="grid gap-2">
                        <Label for="tabela_preco">Tabela de Preço</Label>
                        <Input
                            id="tabela_preco"
                            type="text"
                            bind:value={clientData.tabela_preco}
                        />
                    </div>

                    <div class="grid gap-2">
                        <Label for="praca">Praça</Label>
                        <Select.Root
                            type="single"
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                            bind:value={clientData.praca_id}
                        >
                            <Select.Trigger class="w-full">
                                {@const id = clientData.praca_id}
                                {@const praca = pracas?.find(
                                    (r) => r.id == parseInt(id || "-1"),
                                )}

                                {#if praca}
                                    {praca.nome}
                                {:else}
                                    Selecione uma praca...
                                {/if}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1">
                                    Selecione uma praca...
                                </Select.Item>
                                {#each pracas as praca}
                                    <Select.Item value={`${praca.id}`}>
                                        {praca.nome}
                                    </Select.Item>
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>

                    <div class="grid gap-2">
                        <Label for="rota">Rota</Label>
                        <Select.Root
                            type="single"
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                            bind:value={clientData.rota_id}
                        >
                            <Select.Trigger class="w-full">
                                {@const id = clientData.rota_id}
                                {@const rota = rotas?.find(
                                    (r) => r.id == parseInt(id || "-1"),
                                )}

                                {#if rota}
                                    {rota.nome}
                                {:else}
                                    Selecione uma rota...
                                {/if}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1">
                                    Selecione uma rota...
                                </Select.Item>
                                {#each rotas as rota}
                                    <Select.Item value={`${rota.id}`}>
                                        {rota.nome}
                                    </Select.Item>
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>
                    <div class="grid gap-2">
                        <Label for="vendedor">Vendedor</Label>
                        <Select.Root
                            type="single"
                            class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                            bind:value={clientData.vendedor_id}
                        >
                            <Select.Trigger class="w-full">
                                {@const id = clientData.vendedor_id}
                                {@const vendedor = vendedores?.find(
                                    (v) => v.id == parseInt(id || "-1"),
                                )}

                                {#if vendedor}
                                    {vendedor.nome}
                                {:else}
                                    Selecione um vendedor...
                                {/if}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="-1">
                                    Nenhum vendedor
                                </Select.Item>
                                {#each vendedores as vendedor}
                                    <Select.Item value={`${vendedor.id}`}>
                                        {vendedor.nome}
                                    </Select.Item>
                                {/each}
                            </Select.Content>
                        </Select.Root>
                    </div>
                </Card.Content>
            </Card.Root>

            <Card.Root class="md:col-span-3">
                <Card.Header>
                    <Card.Title>Endereço e Logística</Card.Title>
                    <Card.Description
                        >Detalhes de localização e horários de visita.</Card.Description
                    >
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="grid gap-2 md:col-span-2">
                            <Label for="endereco"
                                >Logradouro (Rua, Nº, Compl.)</Label
                            >
                            <Input
                                id="endereco"
                                bind:value={clientData.endereco}
                                placeholder="Rua das Flores, 123"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="cep">CEP</Label>
                            <Input
                                id="cep"
                                bind:value={clientData.cep}
                                placeholder="00000-000"
                            />
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="grid gap-2">
                            <Label for="bairro">Bairro</Label>
                            <Input
                                id="bairro"
                                bind:value={clientData.bairro}
                                placeholder="Centro"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="cidade">Cidade</Label>
                            <Input
                                id="cidade"
                                bind:value={clientData.cidade}
                                placeholder="Rio de Janeiro"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="estado">Estado (UF)</Label>
                            <Input
                                id="estado"
                                bind:value={clientData.estado}
                                placeholder="RJ"
                                maxlength={2}
                            />
                        </div>
                    </div>

                    <div
                        class="grid grid-cols-1 md:grid-cols-3 gap-4 border-t pt-4"
                    >
                        <div class="grid gap-2">
                            <Label for="dias_visita">Dias de Visita</Label>
                            <Input
                                id="dias_visita"
                                bind:value={clientData.dias_visita}
                                placeholder="Ex: Seg, Qua, Sex"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="hora_inicio">Horário Início</Label>
                            <Input
                                id="hora_inicio"
                                type="time"
                                bind:value={clientData.hora_visita_inicio}
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="hora_fim">Horário Fim</Label>
                            <Input
                                id="hora_fim"
                                type="time"
                                bind:value={clientData.hora_visita_fim}
                            />
                        </div>
                    </div>

                    <div class="grid gap-2">
                        <Label for="observacoes">Observações</Label>
                        <Textarea
                            id="observacoes"
                            bind:value={clientData.observacoes}
                            placeholder="Informações adicionais sobre o cliente..."
                        />
                    </div>
                </Card.Content>
            </Card.Root>
        </div>
    {/if}
</div>
