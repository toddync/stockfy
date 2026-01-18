<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import MapPin from "@lucide/svelte/icons/map-pin";
    import Save from "@lucide/svelte/icons/save";
    import { toast } from "svelte-sonner";

    let loading = $state(false);

    let pracaData = $state({
        codigo: "",
        nome: "",
    });

    async function save() {
        if (!pracaData.codigo || !pracaData.nome) {
            toast.error("Por favor, preencha todos os campos obrigatórios.");
            return;
        }

        loading = true;
        try {
            let q = queryHelper(pracaData);
            await db.execute(
                `INSERT INTO pracas (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Praça criada com sucesso!");
            goto("/pracas");
        } catch (e: any) {
            toast.error(e.message || "Erro ao criar praça");
            console.error(e);
        } finally {
            loading = false;
        }
    }
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button variant="ghost" size="icon" onclick={() => goto("/pracas")}>
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Nova Praça
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Praça
        </Button>
    </div>

    <Card.Root class="shadow-lg border-primary/20 bg-primary/5 pb-0">
        <Card.Header>
            <Card.Title class="flex items-center gap-2">
                <MapPin class="h-6 w-6 text-primary" />
                Dados da Praça
            </Card.Title>
            <Card.Description>
                Defina os dados da região ou área de atendimento.
            </Card.Description>
        </Card.Header>
        <Card.Content class="space-y-6 bg-background rounded-b-xl border-t p-8">
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
</div>
