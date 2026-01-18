<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Route from "@lucide/svelte/icons/route";
    import Save from "@lucide/svelte/icons/save";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    const id = Id.id;
    let loading = $state(true);
    let saving = $state(false);
    let pracas = $state<Array<{ id: number; nome: string }>>([]);

    let rotaData = $state({
        codigo: "",
        nome: "",
        bairro: "",
        praca_id: "-1",
    });

    async function load() {
        loading = true;
        try {
            const [rRes, pRes] = await Promise.all([
                db.select("SELECT * FROM rotas WHERE id = $1", [id]) as any,
                db.select(
                    "SELECT id, nome FROM pracas ORDER BY nome ASC",
                    [],
                ) as any,
            ]);

            pracas = pRes;

            if (rRes && rRes[0]) {
                const r = rRes[0];
                rotaData = {
                    codigo: r.codigo,
                    nome: r.nome,
                    bairro: r.bairro || "",
                    praca_id: String(r.praca_id),
                };
            } else {
                toast.error("Rota não encontrada.");
                goto("/rotas");
            }
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados da rota.");
        } finally {
            loading = false;
        }
    }

    async function save() {
        if (!rotaData.codigo || !rotaData.nome || rotaData.praca_id === "-1") {
            toast.error(
                "Por favor, preencha código, nome e selecione uma praça.",
            );
            return;
        }

        saving = true;
        try {
            const dataToUpdate = {
                codigo: rotaData.codigo,
                nome: rotaData.nome,
                bairro: rotaData.bairro || null,
                praca_id: parseInt(rotaData.praca_id),
            };

            let q = queryHelper(dataToUpdate);
            await db.execute(
                `UPDATE rotas SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            toast.success("Rota atualizada com sucesso!");
            goto("/rotas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar rota");
            console.error(e);
        } finally {
            saving = false;
        }
    }

    onMount(() => load());
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button variant="ghost" size="icon" onclick={() => goto("/rotas")}>
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Editar Rota
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
                    <Route class="h-6 w-6 text-primary" />
                    Dados do Itinerário
                </Card.Title>
                <Card.Description>
                    Atualize os detalhes da rota e sua praça de atendimento.
                </Card.Description>
            </Card.Header>
            <Card.Content
                class="space-y-6 bg-background rounded-b-xl border-t p-8"
            >
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
                                        (p) =>
                                            String(p.id) === rotaData.praca_id,
                                    )?.nome || "Selecione a praça..."}
                                </Select.Trigger>
                                <Select.Content>
                                    {#each pracas as praca}
                                        <Select.Item value={String(praca.id)}
                                            >{praca.nome}</Select.Item
                                        >
                                    {/each}
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
                    </div>
                </div>
            </Card.Content>
        </Card.Root>
    {/if}
</div>
