<script lang="ts">
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import { Spinner } from "@/components/ui/spinner";
    import db, { queryHelper } from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import Tags from "@lucide/svelte/icons/tags";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import Needed from "@/components/needed.svelte";
    import Id from "@/id.svelte";

    const id = Id.id;
    let loading = $state(true);
    let saving = $state(false);

    let tagData = $state({
        nome: "",
    });

    async function loadData() {
        loading = true;
        try {
            const res = await db.select("SELECT * FROM tags WHERE id = $1", [
                id,
            ]);
            const tag = (res as any)[0];

            if (tag) {
                tagData = {
                    nome: tag.nome || "",
                };
            } else {
                toast.error("Tag não encontrada.");
                goto("/etiquetas");
            }
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados.");
        } finally {
            loading = false;
        }
    }

    async function save() {
        if (!tagData.nome.trim()) {
            toast.error("Por favor, informe o nome da tag.");
            return;
        }

        saving = true;
        try {
            const dataToUpdate = {
                nome: tagData.nome.trim(),
            };

            let q = queryHelper(dataToUpdate);
            await db.execute(
                `UPDATE tags SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            toast.success("Tag atualizada com sucesso!");
            goto("/etiquetas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar tag");
            console.error(e);
        } finally {
            saving = false;
        }
    }

    onMount(() => loadData());
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
                Editar Tag
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading || saving}>
            <Save class="h-4 w-4" />
            {saving ? "Salvando..." : "Salvar Alterações"}
        </Button>
    </div>

    {#if loading}
        <div class="flex h-96 items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else}
        <Card.Root
            class="shadow-xl border-2 border-primary/10 max-w-2xl mx-auto"
        >
            <Card.Header class="bg-primary/5 pb-8 pt-6 border-b">
                <div class="flex justify-center mb-4">
                    <div class="p-3 rounded-full bg-primary/10">
                        <Tags class="h-8 w-8 text-primary" />
                    </div>
                </div>
                <Card.Title class="text-2xl text-center"
                    >Dados da Tag</Card.Title
                >
                <Card.Description class="text-center"
                    >Altere o nome da etiqueta.</Card.Description
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
    {/if}
</div>
