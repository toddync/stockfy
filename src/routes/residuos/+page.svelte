<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Residuo } from "$lib/types";
    import Plus from "@lucide/svelte/icons/plus";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Search from "@lucide/svelte/icons/search";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let residuos = $state<Array<Residuo>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredResiduos = $derived(
        residuos.filter(
            (r) =>
                r.item?.toLowerCase().includes(searchQuery.toLowerCase()) ||
                r.numero_documento
                    ?.toLowerCase()
                    .includes(searchQuery.toLowerCase()),
        ),
    );

    let residuoData = $state<Partial<Residuo>>({
        data_movimento: new Date().toISOString().split("T")[0],
        item: "",
        numero_documento: "",
        valor_pago: 0,
    });

    async function save() {
        try {
            const dataToSave = { ...residuoData };
            delete (dataToSave as any).data_cadastro;

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE residuos SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO residuos (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Resíduo ${dataToSave.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar resíduo");
            console.error(e);
        }
    }

    async function delete_(id: number) {
        if (!confirm("Confirmar exclusão?")) return;
        try {
            await db.execute("DELETE FROM residuos WHERE id = $1", [id]);
            await load();
            toast.success("Resíduo excluído com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir resíduo");
            console.error(e);
        }
    }

    async function load() {
        try {
            residuos = (await db.select(
                "SELECT * FROM residuos",
                [],
            )) as Array<Residuo>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar resíduos do banco de dados.");
        }
    }

    onMount(() => load());

    function resetData() {
        residuoData = {
            data_movimento: new Date().toISOString().split("T")[0],
            item: "",
            numero_documento: "",
            valor_pago: 0,
        };
    }

    function formatCurrency(value: number) {
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl">Gerenciamento de Resíduos</Card.Title>
            <Card.Description
                >Controle de movimentações de resíduos e descartes.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                resetData();
                dialog = "new";
            }}
        >
            Novo resíduo
            <Plus class="ml-2 h-4 w-4" />
        </Button>
    </Card.Header>
    <Card.Content>
        <div class="mb-6 flex items-center gap-4">
            <div class="relative flex-1 max-w-sm">
                <Search
                    class="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground"
                />
                <Input
                    type="search"
                    placeholder="Pesquisar por item ou documento..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Data</Table.Head>
                    <Table.Head>Item</Table.Head>
                    <Table.Head>Nº Documento</Table.Head>
                    <Table.Head class="text-right">Valor Pago</Table.Head>
                    <Table.Head class="w-[100px]"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredResiduos as r (r.id)}
                    <Table.Row>
                        <Table.Cell
                            >{new Date(r.data_movimento).toLocaleDateString(
                                "pt-BR",
                            )}</Table.Cell
                        >
                        <Table.Cell class="font-medium text-primary"
                            >{r.item}</Table.Cell
                        >
                        <Table.Cell>{r.numero_documento || "—"}</Table.Cell>
                        <Table.Cell class="text-right"
                            >{formatCurrency(r.valor_pago || 0)}</Table.Cell
                        >
                        <Table.Cell class="flex justify-end gap-2">
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => {
                                    residuoData = r;
                                    dialog = "edit";
                                }}
                            >
                                <PencilLine class="h-4 w-4" />
                            </Button>
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => delete_(r.id!)}
                            >
                                <Trash2 class="h-4 w-4 text-destructive" />
                            </Button>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={5}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhum resíduo encontrado.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root open={dialog != null} onOpenChange={(e) => !e && (dialog = null)}>
    <Dialog.Content class="sm:max-w-[425px]">
        <Dialog.Header>
            <Dialog.Title
                >{dialog === "new"
                    ? "Novo Resíduo"
                    : "Editar Resíduo"}</Dialog.Title
            >
            <Dialog.Description
                >Registre a movimentação de descarte ou venda de resíduos.</Dialog.Description
            >
        </Dialog.Header>
        <div class="grid gap-4 py-4">
            <div class="grid gap-2">
                <Label for="item">Item</Label>
                <Input
                    id="item"
                    bind:value={residuoData.item}
                    placeholder="Ex: Retalhos de tecido"
                />
            </div>
            <div class="grid gap-2">
                <Label for="doc">Nº Documento</Label>
                <Input
                    id="doc"
                    bind:value={residuoData.numero_documento}
                    placeholder="Ex: RES-2023-01"
                />
            </div>
            <div class="grid gap-2">
                <Label for="date">Data Movimento</Label>
                <Input
                    id="date"
                    type="date"
                    bind:value={residuoData.data_movimento}
                />
            </div>
            <div class="grid gap-2">
                <Label for="valor">Valor Pago</Label>
                <Input
                    id="valor"
                    type="number"
                    step="0.01"
                    bind:value={residuoData.valor_pago}
                />
            </div>
        </div>
        <Dialog.Footer>
            <Button variant="outline" onclick={() => (dialog = null)}
                >Cancelar</Button
            >
            <Button onclick={save}>Salvar</Button>
        </Dialog.Footer>
    </Dialog.Content>
</Dialog.Root>
