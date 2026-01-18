<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import { Checkbox } from "@/components/ui/checkbox/index";
    import * as Select from "@/components/ui/select";
    import { Spinner } from "@/components/ui/spinner";
    import type { Vendedor, Praca } from "@/types";
    import db, { queryHelper } from "@/db/db.svelte";
    import Needed from "@/components/needed.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import Id from "@/id.svelte";

    const id = Id.id;
    let loading = $state(true);
    let pracas = $state<Array<Praca>>([]);
    let selectedPracas = $state<string[]>([]);

    let sellerData = $state<{
        codigo: string;
        nome: string;
        cpf: string;
        rg: string;
        email: string;
        telefone: string;
        endereco: string;
        bairro: string;
        cidade: string;
        estado: string;
        cep: string;
        ativo: string;
    }>({
        codigo: "",
        nome: "",
        cpf: "",
        rg: "",
        email: "",
        telefone: "",
        endereco: "",
        bairro: "",
        cidade: "",
        estado: "",
        cep: "",
        ativo: "1",
    });

    async function save() {
        if (!sellerData.nome || !sellerData.codigo) {
            toast.error("Nome e código são obrigatórios.");
            return;
        }

        try {
            const dataToSave = {
                ...sellerData,
                ativo: parseInt(sellerData.ativo),
            };

            let q = queryHelper(dataToSave);

            // 1. Update Seller
            await db.execute(
                `UPDATE vendedores SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            // 2. Sync Praças Relationships
            // Simplest way: delete all and re-insert
            await db.execute(
                "DELETE FROM vendedor_pracas WHERE vendedor_id = $1",
                [id],
            );

            if (selectedPracas.length > 0) {
                for (const pracaId of selectedPracas) {
                    await db.execute(
                        "INSERT INTO vendedor_pracas (vendedor_id, praca_id) VALUES ($1, $2)",
                        [id, parseInt(pracaId)],
                    );
                }
            }

            toast.success("Vendedor atualizado com sucesso!");
            goto("/vendedores");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar vendedor");
            console.error(e);
        }
    }

    async function load() {
        loading = true;
        try {
            const [sellerRes, pracasRes, sellerPracasRes] = await Promise.all([
                db.select("SELECT * FROM vendedores WHERE id = $1", [id]),
                db.select("SELECT * FROM pracas ORDER BY nome", []),
                db.select(
                    "SELECT praca_id FROM vendedor_pracas WHERE vendedor_id = $1",
                    [id],
                ),
            ]);

            const seller = (sellerRes as any)[0];
            if (seller) {
                // Ensure we don't include extra fields in sellerData that aren't in the schema
                const {
                    id: _,
                    data_cadastro: __,
                    pracas_atendimento: ___,
                    ...rest
                } = seller;
                sellerData = {
                    ...rest,
                    ativo: String(seller.ativo),
                };

                selectedPracas = (sellerPracasRes as any[]).map((p) =>
                    String(p.praca_id),
                );
            } else {
                toast.error("Vendedor não encontrado.");
                goto("/vendedores");
            }

            pracas = pracasRes as Array<Praca>;
        } catch (e: any) {
            console.error("Erro ao carregar dados:", e);
            toast.error("Erro ao carregar dados do vendedor.");
        } finally {
            loading = false;
        }
    }

    function togglePraca(id: string) {
        if (selectedPracas.includes(id)) {
            selectedPracas = selectedPracas.filter((i) => i !== id);
        } else {
            selectedPracas = [...selectedPracas, id];
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
                onclick={() => goto("/vendedores")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight">Editar Vendedor</h1>
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
                    <Card.Title>Informações Pessoais</Card.Title>
                    <Card.Description
                        >Dados principais e de contato do vendedor.</Card.Description
                    >
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="codigo">Código <Needed /></Label>
                            <Input
                                id="codigo"
                                bind:value={sellerData.codigo}
                                placeholder="V001"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="nome">Nome Completo <Needed /></Label>
                            <Input
                                id="nome"
                                bind:value={sellerData.nome}
                                placeholder="João da Silva"
                            />
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="cpf">CPF</Label>
                            <Input
                                id="cpf"
                                bind:value={sellerData.cpf}
                                placeholder="000.000.000-00"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="rg">RG</Label>
                            <Input
                                id="rg"
                                bind:value={sellerData.rg}
                                placeholder="00.000.000-0"
                            />
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid gap-2">
                            <Label for="email">E-mail</Label>
                            <Input
                                id="email"
                                type="email"
                                bind:value={sellerData.email}
                                placeholder="vendedor@email.com"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="telefone">Telefone</Label>
                            <Input
                                id="telefone"
                                bind:value={sellerData.telefone}
                                placeholder="(00) 00000-0000"
                            />
                        </div>
                    </div>
                </Card.Content>
            </Card.Root>

            <Card.Root>
                <Card.Header>
                    <Card.Title>Configurações</Card.Title>
                    <Card.Description
                        >Status e áreas de atuação.</Card.Description
                    >
                </Card.Header>
                <Card.Content class="space-y-4">
                    <div class="grid gap-2">
                        <Label for="ativo">Status</Label>
                        <Select.Root
                            type="single"
                            bind:value={sellerData.ativo}
                        >
                            <Select.Trigger class="w-full">
                                {sellerData.ativo === "1" ? "Ativo" : "Inativo"}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="1">Ativo</Select.Item>
                                <Select.Item value="0">Inativo</Select.Item>
                            </Select.Content>
                        </Select.Root>
                    </div>

                    <div class="grid gap-2">
                        <Label>Praças de Atendimento</Label>
                        <div
                            class="grid grid-cols-1 gap-2 border rounded-md p-3 max-h-[200px] overflow-y-auto"
                        >
                            {#each pracas as praca}
                                <div class="flex items-center space-x-2">
                                    <Checkbox
                                        id={`praca-${praca.id}`}
                                        checked={selectedPracas.includes(
                                            String(praca.id),
                                        )}
                                        onCheckedChange={() =>
                                            togglePraca(String(praca.id))}
                                    />
                                    <Label
                                        for={`praca-${praca.id}`}
                                        class="text-sm font-normal"
                                        >{praca.nome}</Label
                                    >
                                </div>
                            {/each}
                            {#if pracas.length === 0}
                                <p class="text-sm text-muted-foreground italic">
                                    Nenhuma praça cadastrada.
                                </p>
                            {/if}
                        </div>
                    </div>
                </Card.Content>
            </Card.Root>

            <Card.Root class="md:col-span-3">
                <Card.Header>
                    <Card.Title>Endereço</Card.Title>
                    <Card.Description
                        >Localização residencial ou comercial do vendedor.</Card.Description
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
                                bind:value={sellerData.endereco}
                                placeholder="Rua das Palmeiras, 456"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="cep">CEP</Label>
                            <Input
                                id="cep"
                                bind:value={sellerData.cep}
                                placeholder="00000-000"
                            />
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="grid gap-2">
                            <Label for="bairro">Bairro</Label>
                            <Input
                                id="bairro"
                                bind:value={sellerData.bairro}
                                placeholder="Bairro"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="cidade">Cidade</Label>
                            <Input
                                id="cidade"
                                bind:value={sellerData.cidade}
                                placeholder="Cidade"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="estado">Estado (UF)</Label>
                            <Input
                                id="estado"
                                bind:value={sellerData.estado}
                                placeholder="RJ"
                                maxlength={2}
                            />
                        </div>
                    </div>
                </Card.Content>
            </Card.Root>
        </div>
    {/if}
</div>
