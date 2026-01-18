<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import { Spinner } from "@/components/ui/spinner";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import MapPin from "@lucide/svelte/icons/map-pin";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    const id = Id.id;
    let loading = $state(true);
    let saving = $state(false);

    let pracaData = $state({
        codigo: "",
        nome: "",
    });

    async function load() {
        loading = true;
        try {
            const res = (await db.select("SELECT * FROM pracas WHERE id = $1", [
                id,
            ])) as any;
            if (res && res[0]) {
                pracaData = {
                    codigo: res[0].codigo,
                    nome: res[0].nome,
                };
            } else {
                toast.error("Praça não encontrada.");
                goto("/pracas");
            }
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados da praça.");
        } finally {
            loading = false;
        }
    }

    async function save() {
        if (!pracaData.codigo || !pracaData.nome) {
            toast.error("Por favor, preencha todos os campos obrigatórios.");
            return;
        }

        saving = true;
        try {
            let q = queryHelper(pracaData);
            await db.execute(
                `UPDATE pracas SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            toast.success("Praça atualizada com sucesso!");
            goto("/pracas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar praça");
            console.error(e);
        } finally {
            saving = false;
        }
    }

    onMount(() => load());
</script>

<div class="p-6 w-full space-y-6">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button variant="ghost" size="icon" onclick={() => goto("/pracas")}>
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Editar Praça
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading || saving}>
            <Save class="h-4 w-4" />
            Salvar Alterações
        </Button>
    </div>

    {#if loading}
        <div class="flex h-64 items-center justify-center">
            <Spinner class="h-10 w-10" />
        </div>
    {:else}
        <Card.Root class="shadow-lg border-primary/20 bg-primary/5 pb-0">
            <Card.Header>
                <Card.Title class="flex items-center gap-2">
                    <MapPin class="h-6 w-6 text-primary" />
                    Dados da Praça
                </Card.Title>
                <Card.Description>
                    Atualize os dados da região ou área de atendimento.
                </Card.Description>
            </Card.Header>
            <Card.Content
                class="space-y-6 bg-background rounded-b-xl border-t p-8"
            >
                <div class="grid gap-6">
                    <div class="grid gap-2">
                        <Label for="codigo">Código da Praça <Needed /></Label>
                        <Input
                            id="codigo"
                            bind:value={pracaData.codigo}
                            placeholder="Ex: RJ-CENTRO"
                            class="text-lg font-mono font-bold uppercase tracking-wider h-12"
                        />
                        <p
                            class="text-[10px] text-muted-foreground uppercase font-black"
                        >
                            Identificador único para a região.
                        </p>
                    </div>

                    <div class="grid gap-2">
                        <Label for="nome">Nome Amigável <Needed /></Label>
                        <Input
                            id="nome"
                            bind:value={pracaData.nome}
                            placeholder="Ex: Rio de Janeiro - Centro"
                            class="text-lg font-semibold h-12"
                        />
                        <p
                            class="text-[10px] text-muted-foreground uppercase font-black"
                        >
                            Como a região será exibida no sistema.
                        </p>
                    </div>
                </div>
            </Card.Content>
        </Card.Root>
    {/if}
</div>
