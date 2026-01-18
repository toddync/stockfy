<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import Tags from "@lucide/svelte/icons/tags";
    import { toast } from "svelte-sonner";

    let loading = $state(false);

    let tagData = $state({
        nome: "",
    });

    async function save() {
        if (!tagData.nome.trim()) {
            toast.error("Por favor, informe o nome da tag.");
            return;
        }

        loading = true;
        try {
            const dataToSave = {
                nome: tagData.nome.trim(),
            };

            let q = queryHelper(dataToSave);
            await db.execute(
                `INSERT INTO tags (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Tag criada com sucesso!");
            goto("/etiquetas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar tag");
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
                onclick={() => goto("/etiquetas")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Nova Tag
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Tag
        </Button>
    </div>

    <Card.Root class="shadow-xl border-2 border-primary/10 pt-0">
        <Card.Header class="bg-primary/5 pb-8 pt-6 border-b">
            <div class="flex justify-center mb-4">
                <div class="p-3 rounded-full bg-primary/10">
                    <Tags class="h-8 w-8 text-primary" />
                </div>
            </div>
            <Card.Title class="text-2xl text-center">Dados da Tag</Card.Title>
            <Card.Description class="text-center"
                >Crie uma nova etiqueta para organizar seus produtos.</Card.Description
            >
        </Card.Header>
        <Card.Content class="p-8">
            <div class="space-y-6">
                <div class="space-y-4">
                    <Label for="nome" class="text-base font-bold"
                        >Nome da Tag <Needed /></Label
                    >
                    <Input
                        id="nome"
                        bind:value={tagData.nome}
                        placeholder="Ex: Promoção, Premium, Verão 2024"
                        class="h-12 bg-muted/20 border-none shadow-inner"
                    />
                </div>
            </div>
        </Card.Content>
    </Card.Root>
</div>
