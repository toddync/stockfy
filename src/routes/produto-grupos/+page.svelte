<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { ProdutoGrupo } from "$lib/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Search from "@lucide/svelte/icons/search";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let grupos = $state<Array<ProdutoGrupo>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredGrupos = $derived(
        grupos.filter(
            (g) =>
                g.descricao.toLowerCase().includes(searchQuery.toLowerCase()) ||
                g.codigo.toLowerCase().includes(searchQuery.toLowerCase()),
        ),
    );

    let grupoData = $state<Partial<ProdutoGrupo>>({
        codigo: "",
        descricao: "",
    });

    async function save() {
        try {
            const dataToSave = { ...grupoData };
            delete (dataToSave as any).data_cadastro;

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE produto_grupos SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO produto_grupos (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Grupo ${dataToSave.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar grupo: ${message}`);
            console.error("Erro ao salvar grupo:", e);
        }
    }

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir este grupo de produtos?"))
            return;
        try {
            await db.execute("DELETE FROM produto_grupos WHERE id = $1", [id]);
            await load();
            toast.success("Grupo excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar grupo: ${message}`);
            console.error("Erro ao deletar grupo:", e);
        }
    }

    async function load() {
        try {
            grupos = (await db.select(
                "SELECT * FROM produto_grupos",
                [],
            )) as Array<ProdutoGrupo>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar grupos: ${message}`);
            console.error("Erro ao carregar grupos:", e);
        }
    }

    onMount(() => load());

    function resetGrupoData() {
        grupoData = {
            codigo: "",
            descricao: "",
        };
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl">Grupos de Produtos</Card.Title>
            <Card.Description
                >Gerencie as categorias e agrupamentos de seus produtos.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                resetGrupoData();
                dialog = "new";
            }}
        >
            Novo grupo
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
                    placeholder="Pesquisar por código ou descrição..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Código</Table.Head>
                    <Table.Head>Descrição</Table.Head>
                    <Table.Head class="w-[50px]"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredGrupos as grupo (grupo.id)}
                    <Table.Row>
                        <Table.Cell class="font-medium"
                            >{grupo.codigo}</Table.Cell
                        >
                        <Table.Cell>{grupo.descricao}</Table.Cell>
                        <Table.Cell>
                            <DropdownMenu.Root>
                                <DropdownMenu.Trigger>
                                    {#snippet child({ props })}
                                        <Button
                                            {...props}
                                            variant="ghost"
                                            size="icon"
                                        >
                                            <Ellipsis class="h-4 w-4" />
                                        </Button>
                                    {/snippet}
                                </DropdownMenu.Trigger>
                                <DropdownMenu.Content align="end">
                                    <DropdownMenu.Group>
                                        <DropdownMenu.Label
                                            >Ações</DropdownMenu.Label
                                        >
                                        <DropdownMenu.Separator />
                                        <DropdownMenu.Item
                                            onclick={() => {
                                                grupoData = { ...grupo };
                                                dialog = "edit";
                                            }}
                                        >
                                            <PencilLine class="mr-2 h-4 w-4" />
                                            Editar
                                        </DropdownMenu.Item>
                                        <DropdownMenu.Item
                                            class="text-destructive focus:text-destructive"
                                            onclick={() => delete_(grupo.id)}
                                        >
                                            <Trash2 class="mr-2 h-4 w-4" />
                                            Excluir
                                        </DropdownMenu.Item>
                                    </DropdownMenu.Group>
                                </DropdownMenu.Content>
                            </DropdownMenu.Root>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={3}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhum grupo encontrado.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root
    open={dialog != null}
    onOpenChange={(e) => {
        if (!e) {
            dialog = null;
        }
    }}
>
    <Dialog.Content class="sm:max-w-[425px]">
        <Dialog.Header>
            <Dialog.Title>
                {dialog === "new" ? "Novo Grupo" : "Editar Grupo"}
            </Dialog.Title>
            <Dialog.Description>
                Preencha as informações do grupo abaixo.
            </Dialog.Description>
        </Dialog.Header>

        <div class="grid gap-4 py-4">
            <div class="grid gap-2">
                <Label for="codigo">Código</Label>
                <Input
                    id="codigo"
                    bind:value={grupoData.codigo}
                    placeholder="Ex: ROU"
                />
            </div>
            <div class="grid gap-2">
                <Label for="descricao">Descrição</Label>
                <Input
                    id="descricao"
                    bind:value={grupoData.descricao}
                    placeholder="Ex: Roupas de Verão"
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
