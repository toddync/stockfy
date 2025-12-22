<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Cliente } from "$lib/types";
    import Plus from "@lucide/svelte/icons/plus";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Search from "@lucide/svelte/icons/search";
    import Tags from "@lucide/svelte/icons/tags";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    interface Etiqueta {
        id?: number;
        cliente_id: number;
        codigo_vendedor?: string;
        nome_vendedor?: string;
        sobrenome?: string;
    }

    let etiquetas = $state<Array<Etiqueta>>([]);
    let clientes = $state<Array<Cliente>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredEtiquetas = $derived(
        etiquetas.filter((e) => {
            const client = clientes.find((c) => c.id === e.cliente_id);
            return (
                client?.nome
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                e.nome_vendedor
                    ?.toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                e.codigo_vendedor
                    ?.toLowerCase()
                    .includes(searchQuery.toLowerCase())
            );
        }),
    );

    let etiquetaData = $state<Partial<Etiqueta>>({
        cliente_id: 0,
        codigo_vendedor: "",
        nome_vendedor: "",
        sobrenome: "",
    });

    async function save() {
        try {
            let q = queryHelper(etiquetaData);
            let query = "";

            if (etiquetaData.id) {
                query = `UPDATE etiquetas SET ${q.setClauses} WHERE id = ${etiquetaData.id}`;
            } else {
                query = `INSERT INTO etiquetas (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Etiqueta ${etiquetaData.id ? "atualizada" : "criada"} com sucesso!`,
            );
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar etiqueta");
            console.error(e);
        }
    }

    async function delete_(id: number) {
        if (!confirm("Confirmar exclusão?")) return;
        try {
            await db.execute("DELETE FROM etiquetas WHERE id = $1", [id]);
            await load();
            toast.success("Etiqueta excluída com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir etiqueta");
            console.error(e);
        }
    }

    async function load() {
        try {
            etiquetas = (await db.select(
                "SELECT * FROM etiquetas",
                [],
            )) as Array<Etiqueta>;
            clientes = (await db.select(
                "SELECT * FROM clientes",
                [],
            )) as Array<Cliente>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados do banco de dados.");
        }
    }

    onMount(() => load());

    function resetData() {
        etiquetaData = {
            cliente_id: 0,
            codigo_vendedor: "",
            nome_vendedor: "",
            sobrenome: "",
        };
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Tags class="h-8 w-8 text-primary" />
                Gerenciamento de Etiquetas
            </Card.Title>
            <Card.Description
                >Controle e personalização de etiquetas de transição para
                clientes e vendedores.</Card.Description
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
            Nova etiqueta
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
                    placeholder="Pesquisar por cliente ou vendedor..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Cliente</Table.Head>
                    <Table.Head>Cód. Vendedor</Table.Head>
                    <Table.Head>Nome Vendedor</Table.Head>
                    <Table.Head>Sobrenome</Table.Head>
                    <Table.Head class="w-[100px]"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredEtiquetas as e (e.id)}
                    <Table.Row>
                        <Table.Cell class="font-bold text-primary">
                            {clientes.find((c) => c.id === e.cliente_id)
                                ?.nome || "—"}
                        </Table.Cell>
                        <Table.Cell>
                            <span
                                class="px-2 py-1 rounded bg-muted text-xs font-mono"
                            >
                                {e.codigo_vendedor || "—"}
                            </span>
                        </Table.Cell>
                        <Table.Cell>{e.nome_vendedor || "—"}</Table.Cell>
                        <Table.Cell class="text-muted-foreground"
                            >{e.sobrenome || "—"}</Table.Cell
                        >
                        <Table.Cell class="flex justify-end gap-2">
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => {
                                    etiquetaData = e;
                                    dialog = "edit";
                                }}
                            >
                                <PencilLine class="h-4 w-4" />
                            </Button>
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() => delete_(e.id!)}
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
                            Nenhuma etiqueta encontrada.
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
                    ? "Nova Etiqueta"
                    : "Editar Etiqueta"}</Dialog.Title
            >
            <Dialog.Description
                >Preencha os dados de vinculação da etiqueta.</Dialog.Description
            >
        </Dialog.Header>
        <div class="grid gap-4 py-4">
            <div class="grid gap-2">
                <Label for="cliente">Cliente Vinculado</Label>
                <select
                    id="cliente"
                    bind:value={etiquetaData.cliente_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                >
                    <option value={0}>Selecione um cliente...</option>
                    {#each clientes as c}
                        <option value={c.id}>{c.nome}</option>
                    {/each}
                </select>
            </div>
            <div class="grid gap-2">
                <Label for="cod_ven">Código do Vendedor</Label>
                <Input
                    id="cod_ven"
                    bind:value={etiquetaData.codigo_vendedor}
                    placeholder="Ex: VEN-001"
                />
            </div>
            <div class="grid gap-2">
                <Label for="nome_ven">Nome do Vendedor</Label>
                <Input
                    id="nome_ven"
                    bind:value={etiquetaData.nome_vendedor}
                    placeholder="Ex: João da Silva"
                />
            </div>
            <div class="grid gap-2">
                <Label for="sobrenome">Sobrenome</Label>
                <Input
                    id="sobrenome"
                    bind:value={etiquetaData.sobrenome}
                    placeholder="Sobrenome opcional..."
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
