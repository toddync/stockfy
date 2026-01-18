<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select";
    import db, { queryHelper } from "@/db/db.svelte";
    import Needed from "@/components/needed.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import { toast } from "svelte-sonner";

    let supplierData = $state<{
        razao_social: string;
        nome_fantasia: string;
        tipo_pessoa: string;
        documento: string;
        inscricao_estadual: string;
        endereco: string;
        bairro: string;
        cidade: string;
        estado: string;
        cep: string;
        telefone: string;
        responsavel: string;
        ativo: string;
    }>({
        razao_social: "",
        nome_fantasia: "",
        tipo_pessoa: "J",
        documento: "",
        inscricao_estadual: "",
        endereco: "",
        bairro: "",
        cidade: "",
        estado: "",
        cep: "",
        telefone: "",
        responsavel: "",
        ativo: "1",
    });

    async function save() {
        if (!supplierData.razao_social) {
            toast.error("Razão Social é obrigatória.");
            return;
        }

        try {
            const dataToSave = {
                ...supplierData,
                ativo: parseInt(supplierData.ativo),
                // Ensure nulls for empty strings
                nome_fantasia: supplierData.nome_fantasia || null,
                documento: supplierData.documento || null,
                inscricao_estadual: supplierData.inscricao_estadual || null,
                endereco: supplierData.endereco || null,
                bairro: supplierData.bairro || null,
                cidade: supplierData.cidade || null,
                estado: supplierData.estado || null,
                cep: supplierData.cep || null,
                telefone: supplierData.telefone || null,
                responsavel: supplierData.responsavel || null,
            };

            let q = queryHelper(dataToSave);

            await db.execute(
                `INSERT INTO fornecedores (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Fornecedor criado com sucesso!");
            goto("/fornecedores");
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar fornecedor");
            console.error(e);
        }
    }
</script>

<div class="p-6 w-full mx-auto space-y-6">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/fornecedores")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight">Novo Fornecedor</h1>
        </div>
        <Button onclick={save} class="gap-2">
            <Save class="h-4 w-4" />
            Salvar Fornecedor
        </Button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card.Root class="md:col-span-2">
            <Card.Header>
                <Card.Title>Dados Cadastrais</Card.Title>
                <Card.Description
                    >Informações principais do fornecedor.</Card.Description
                >
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid gap-2">
                    <Label for="razao">Razão Social <Needed /></Label>
                    <Input
                        id="razao"
                        bind:value={supplierData.razao_social}
                        placeholder="Empresa LTDA"
                    />
                </div>

                <div class="grid gap-2">
                    <Label for="fantasia">Nome Fantasia / Marca</Label>
                    <Input
                        id="fantasia"
                        bind:value={supplierData.nome_fantasia}
                        placeholder="Marca da Empresa"
                    />
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="tipo">Tipo de Pessoa</Label>
                        <Select.Root
                            type="single"
                            bind:value={supplierData.tipo_pessoa}
                        >
                            <Select.Trigger class="w-full">
                                {supplierData.tipo_pessoa === "J"
                                    ? "Jurídica"
                                    : "Física"}
                            </Select.Trigger>
                            <Select.Content>
                                <Select.Item value="J">Jurídica</Select.Item>
                                <Select.Item value="F">Física</Select.Item>
                            </Select.Content>
                        </Select.Root>
                    </div>
                    <div class="grid gap-2">
                        <Label for="documento"
                            >{supplierData.tipo_pessoa === "J"
                                ? "CNPJ"
                                : "CPF"}</Label
                        >
                        <Input
                            id="documento"
                            bind:value={supplierData.documento}
                            placeholder="00.000.000/0000-00"
                        />
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="ie">Inscrição Estadual</Label>
                        <Input
                            id="ie"
                            bind:value={supplierData.inscricao_estadual}
                            placeholder="000.000.000"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="responsavel">Responsável / Contato</Label>
                        <Input
                            id="responsavel"
                            bind:value={supplierData.responsavel}
                            placeholder="Nome do representante"
                        />
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="telefone">Telefone</Label>
                        <Input
                            id="telefone"
                            bind:value={supplierData.telefone}
                            placeholder="(00) 00000-0000"
                        />
                    </div>
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root>
            <Card.Header>
                <Card.Title>Configurações</Card.Title>
                <Card.Description>Status do cadastro.</Card.Description>
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid gap-2">
                    <Label for="ativo">Status</Label>
                    <Select.Root type="single" bind:value={supplierData.ativo}>
                        <Select.Trigger class="w-full">
                            {supplierData.ativo === "1" ? "Ativo" : "Inativo"}
                        </Select.Trigger>
                        <Select.Content>
                            <Select.Item value="1">Ativo</Select.Item>
                            <Select.Item value="0">Inativo</Select.Item>
                        </Select.Content>
                    </Select.Root>
                </div>
            </Card.Content>
        </Card.Root>

        <Card.Root class="md:col-span-3">
            <Card.Header>
                <Card.Title>Localização</Card.Title>
                <Card.Description
                    >Endereço completo do fornecedor.</Card.Description
                >
            </Card.Header>
            <Card.Content class="space-y-4">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="grid gap-2 md:col-span-2">
                        <Label for="endereco">Logradouro</Label>
                        <Input
                            id="endereco"
                            bind:value={supplierData.endereco}
                            placeholder="Rua, Número, Complemento"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="cep">CEP</Label>
                        <Input
                            id="cep"
                            bind:value={supplierData.cep}
                            placeholder="00000-000"
                        />
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="grid gap-2">
                        <Label for="bairro">Bairro</Label>
                        <Input
                            id="bairro"
                            bind:value={supplierData.bairro}
                            placeholder="Bairro"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="cidade">Cidade</Label>
                        <Input
                            id="cidade"
                            bind:value={supplierData.cidade}
                            placeholder="Cidade"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="estado">Estado (UF)</Label>
                        <Input
                            id="estado"
                            bind:value={supplierData.estado}
                            placeholder="UF"
                            maxlength={2}
                        />
                    </div>
                </div>
            </Card.Content>
        </Card.Root>
    </div>
</div>
