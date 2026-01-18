<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Boxes from "@lucide/svelte/icons/boxes";
    import Save from "@lucide/svelte/icons/save";
    import { toast } from "svelte-sonner";

    let loading = $state(false);

    let grupoData = $state({
        codigo: "",
        descricao: "",
    });

    async function save() {
        if (!grupoData.codigo || !grupoData.descricao) {
            toast.error("Por favor, preencha código e descrição.");
            return;
        }

        loading = true;
        try {
            const dataToSave = {
                codigo: grupoData.codigo.toUpperCase(),
                descricao: grupoData.descricao,
            };

            let q = queryHelper(dataToSave);
            await db.execute(
                `INSERT INTO produto_grupos (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Grupo de produtos criado com sucesso!");
            goto("/produto-grupos");
        } catch (e: any) {
            toast.error(e.message || "Erro ao criar grupo");
            console.error(e);
        } finally {
            loading = false;
        }
    }
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/produto-grupos")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Novo Grupo de Produtos
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Grupo
        </Button>
    </div>

    <Card.Root class="shadow-lg border-primary/20 bg-primary/5 pb-0">
        <Card.Header>
            <Card.Title class="flex items-center gap-2 text-primary font-black">
                <Boxes class="h-6 w-6" />
                Informações do Grupo
            </Card.Title>
            <Card.Description
                >Identificação e descrição da categoria de produtos.</Card.Description
            >
        </Card.Header>
        <Card.Content class="space-y-6 bg-background rounded-b-xl border-t p-8">
            <div class="grid gap-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="grid gap-2">
                        <Label for="codigo">Código <Needed /></Label>
                        <Input
                            id="codigo"
                            bind:value={grupoData.codigo}
                            placeholder="Ex: ROU"
                            class="font-mono font-bold uppercase"
                        />
                    </div>
                    <div class="grid gap-2 md:col-span-2">
                        <Label for="descricao">Descrição <Needed /></Label>
                        <Input
                            id="descricao"
                            bind:value={grupoData.descricao}
                            placeholder="Ex: Roupas de Verão"
                            class="font-bold text-primary"
                        />
                    </div>
                </div>
            </div>
        </Card.Content>
    </Card.Root>
</div>
