<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "@/components/ui/button/index";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Rota } from "@/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";


    let routes = $state<Array<Rota>>([]);
    let dialog = $state<string | null>(null);

    let routeData = $state<Partial<Rota>>({});

    async function save() {
        try {
            const dataToSave = { ...routeData };
            delete (dataToSave as any).data_cadastro;

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE rotas SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO rotas (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Rota ${dataToSave.id ? "atualizada" : "criada"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar rota: ${message}`);
            console.error("Erro ao salvar rota:", e);
        }
    }

    async function delete_(id: number) {
        try {
            await db.execute("DELETE FROM rotas WHERE id = $1", [id]);
            await load();
            toast.success("Rota excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar rota: ${message}`);
            console.error("Erro ao deletar rota:", e);
        }
    }

    async function load() {
        try {
            routes = (await db.select(
                "SELECT * FROM rotas",
                [],
            )) as Array<Rota>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar rotas: ${message}`);
            console.error("Erro ao carregar rotas:", e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex w-full">
        <Card.Title class="text-3xl">Gerenciamento de Rotas</Card.Title>
        <Button
            class="ml-auto cursor-pointer border-primary/50! hover:bg-primary/50! transition-colors duration-500!"
            variant="outline"
            size="lg"
            onclick={() => {
                dialog = "new";
            }}
        >
            Nova rota
            <Plus class="stroke-2" />
        </Button>
    </Card.Header>
    <Card.Content>
        <Table.Root>
            <Table.Caption>Lista de vendedores.</Table.Caption>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Código</Table.Head>
                    <Table.Head>Bairro</Table.Head>
                    <Table.Head>Nome</Table.Head>
                    <Table.Head></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each routes as route, i (route.id)}
                    <Table.Row>
                        <Table.Cell>{route.codigo}</Table.Cell>
                        <!-- <Table.Cell>{seller}</Table.Cell> -->
                        <Table.Cell>{route.bairro}</Table.Cell>
                        <Table.Cell>{route.nome}</Table.Cell>
                        <Table.Cell>
                            <DropdownMenu.Root>
                                <DropdownMenu.Trigger>
                                    {#snippet child({ props })}
                                        <Button
                                            {...props}
                                            variant="ghost"
                                            size="icon"
                                        >
                                            <Ellipsis />
                                        </Button>
                                    {/snippet}
                                </DropdownMenu.Trigger>
                                <DropdownMenu.Content>
                                    <DropdownMenu.Group>
                                        <DropdownMenu.Label>
                                            Ações
                                        </DropdownMenu.Label>
                                        <DropdownMenu.Separator />
                                        <DropdownMenu.Item
                                            class="group"
                                            onSelect={() => {
                                                routeData = { ...route };
                                                dialog = "edit";
                                            }}
                                        >
                                            Editar
                                            <PencilLine
                                                class="ml-auto group-hover:stroke-lime-400 transition-colors duration-200"
                                            />
                                        </DropdownMenu.Item>
                                        <DropdownMenu.Item
                                            class="group"
                                            onclick={() => delete_(route.id)}
                                        >
                                            Excluir
                                            <Trash2
                                                class="ml-auto group-hover:stroke-red-600 transition-colors duration-200"
                                            />
                                        </DropdownMenu.Item>
                                    </DropdownMenu.Group>
                                </DropdownMenu.Content>
                            </DropdownMenu.Root>
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root
    open={dialog != null}
    onOpenChange={(e) => (e ? null : ((dialog = null), (routeData = {})))}
>
    <Dialog.Content class="gap-10">
        <Dialog.Header>
            <Dialog.Title>
                {#if dialog == "new"}
                    Nova rota
                {:else if dialog == "edit"}
                    Editar rota
                {/if}
            </Dialog.Title>
        </Dialog.Header>

        <div class="flex flex-col gap-5">
            <div class="flex flex-col gap-3">
                <Label for="code">Codigo:</Label>
                <Input
                    id="code"
                    bind:value={routeData.codigo}
                    placeholder="R001..."
                />
            </div>
            <div class="flex flex-col gap-3">
                <Label for="name">Nome:</Label>
                <Input
                    id="name"
                    bind:value={routeData.nome}
                    placeholder="..."
                />
            </div>

            <div class="flex flex-col gap-3">
                <Label for="email">Bairro:</Label>
                <Input
                    id="email"
                    bind:value={routeData.bairro}
                    placeholder="..."
                />
            </div>
        </div>

        <Dialog.Footer class="grid grid-cols-2 gap-5">
            <Button variant="outline" onclick={() => (dialog = null)}>
                Cancelar
            </Button>
            <Button onclick={save}>Salvar</Button>
        </Dialog.Footer>
    </Dialog.Content>
</Dialog.Root>
