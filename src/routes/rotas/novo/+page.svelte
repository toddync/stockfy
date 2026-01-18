<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select/index.js";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Route from "@lucide/svelte/icons/route";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let loading = $state(false);
    let pracas = $state<Array<{ id: number; nome: string }>>([]);

    let rotaData = $state({
        codigo: "",
        nome: "",
        bairro: "",
        praca_id: "-1",
    });

    async function loadPracas() {
        try {
            pracas = (await db.select(
                "SELECT id, nome FROM pracas ORDER BY nome ASC",
                [],
            )) as any;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar praças.");
        }
    }

    async function save() {
        if (!rotaData.codigo || !rotaData.nome || rotaData.praca_id === "-1") {
            toast.error(
                "Por favor, preencha código, nome e selecione uma praça.",
            );
            return;
        }

        loading = true;
        try {
            const dataToSave = {
                codigo: rotaData.codigo,
                nome: rotaData.nome,
                bairro: rotaData.bairro || null,
                praca_id: parseInt(rotaData.praca_id),
            };

            let q = queryHelper(dataToSave);
            await db.execute(
                `INSERT INTO rotas (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Rota criada com sucesso!");
            goto("/rotas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao criar rota");
            console.error(e);
        } finally {
            loading = false;
        }
    }

    onMount(() => loadPracas());
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button variant="ghost" size="icon" onclick={() => goto("/rotas")}>
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Nova Rota
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Rota
        </Button>
    </div>

    <Card.Root class="shadow-lg border-primary/20 bg-primary/5 pb-0">
        <Card.Header>
            <Card.Title class="flex items-center gap-2">
                <Route class="h-6 w-6 text-primary" />
                Definição de Itinerário
            </Card.Title>
            <Card.Description>
                Configure os detalhes da rota e atribua a uma praça de
                atendimento.
            </Card.Description>
        </Card.Header>
        <Card.Content class="space-y-6 bg-background rounded-b-xl border-t p-8">
            <div class="grid gap-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="grid gap-2">
                        <Label for="codigo">Código <Needed /></Label>
                        <Input
                            id="codigo"
                            bind:value={rotaData.codigo}
                            placeholder="Ex: R-01"
                            class="font-mono font-bold uppercase"
                        />
                    </div>
                    <div class="grid gap-2">
                        <Label for="praca">Praça (Área) <Needed /></Label>
                        <Select.Root
                            type="single"
                            bind:value={rotaData.praca_id}
                        >
                            <Select.Trigger class="w-full">
                                {pracas.find(
                                    (p) => String(p.id) === rotaData.praca_id,
                                )?.nome || "Selecione a praça..."}
                            </Select.Trigger>
                            <Select.Content>
                                {#each pracas as praca}
                                    <Select.Item value={String(praca.id)}
                                        >{praca.nome}</Select.Item
                                    >
                                {/each}
                                {#if pracas.length === 0}
                                    <div
                                        class="p-4 text-center text-xs text-muted-foreground"
                                    >
                                        Nenhuma praça cadastrada.
                                    </div>
                                {/if}
                            </Select.Content>
                        </Select.Root>
                    </div>
                </div>

                <div class="grid gap-2">
                    <Label for="nome">Nome da Rota <Needed /></Label>
                    <Input
                        id="nome"
                        bind:value={rotaData.nome}
                        placeholder="Ex: Rota Centro - Manhã"
                        class="text-lg font-semibold"
                    />
                </div>

                <div class="grid gap-2">
                    <Label for="bairro">Bairro / Região</Label>
                    <Input
                        id="bairro"
                        bind:value={rotaData.bairro}
                        placeholder="Ex: Copacabana, Ipanema..."
                    />
                    <p
                        class="text-[10px] text-muted-foreground uppercase font-black"
                    >
                        Lista de bairros cobertos por esta rota.
                    </p>
                </div>
            </div>
        </Card.Content>
    </Card.Root>
</div>
