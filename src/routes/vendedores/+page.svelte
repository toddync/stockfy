<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import DolarSign from "@lucide/svelte/icons/dollar-sign";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "@/components/ui/button/index";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Vendedor } from "@/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    //@ts-ignore
    import Tags from "svelte-tags-input";

    let sellers = $state<Array<Vendedor>>([]);
    let dialog = $state<string | null>(null);

    let sellerData = $state<Partial<Vendedor>>({});

    async function save() {
        try {
            delete sellerData.data_cadastro;

            const dataToSave = { ...sellerData };
            dataToSave.pracas_atendimento = JSON.stringify(
                dataToSave.pracas_atendimento,
            );

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE vendedores SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO vendedores (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Vendedor ${dataToSave.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar vendedor: ${message}`);
            console.error("Erro ao salvar vendedor:", e);
            dialog = null;
        }
    }

    async function delete_(id: number) {
        try {
            await db.execute("DELETE FROM vendedores WHERE id = $1", [id]);
            await load();
            toast.success("Vendedor excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar vendedor: ${message}`);
            console.error("Erro ao deletar vendedor:", e);
        }
    }

    async function load() {
        try {
            sellers = (await db.select(
                "SELECT * FROM vendedores",
                [],
            )) as Array<Vendedor>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar vendedores: ${message}`);
            console.error("Erro ao carregar vendedores:", e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex w-full">
        <Card.Title class="text-3xl flex items-center gap-2">
            <DolarSign class="h-8 w-8 text-primary" />
            Gerenciamento de Vendedores
        </Card.Title>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                dialog = "new";
            }}
        >
            Novo vendedor
            <Plus class="stroke-2" />
        </Button>
    </Card.Header>
    <Card.Content>
        <Table.Root>
            <Table.Caption>Lista de vendedores.</Table.Caption>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Código</Table.Head>
                    <Table.Head>Nome</Table.Head>
                    <Table.Head>CPF</Table.Head>
                    <Table.Head>Email</Table.Head>
                    <Table.Head>Telefone</Table.Head>
                    <Table.Head class="w-12.5"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each sellers as seller, i (seller.id)}
                    <Table.Row>
                        <Table.Cell>{seller.codigo}</Table.Cell>
                        <Table.Cell>{seller.nome}</Table.Cell>
                        <Table.Cell>{seller.cpf}</Table.Cell>
                        <Table.Cell>{seller.email}</Table.Cell>
                        <Table.Cell>{seller.telefone}</Table.Cell>
                        <Table.Cell>
                            <Button
                                variant="ghost"
                                size="icon-lg"
                                onclick={() => {
                                    sellerData = { ...seller };
                                    sellerData.pracas_atendimento = JSON.parse(
                                        seller.pracas_atendimento,
                                    );
                                    dialog = "edit";
                                }}
                            >
                                <PencilLine
                                    class="h-4 w-4 stroke-3 stroke-lime-400"
                                />
                            </Button>
                            <Button
                                variant="ghost"
                                size="icon-lg"
                                onclick={() => delete_(seller.id)}
                            >
                                <Trash2
                                    class="h-4 w-4 stroke-3 stroke-red-500"
                                />
                            </Button>
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root
    open={dialog != null}
    onOpenChange={(e) => (e ? null : ((dialog = null), (sellerData = {})))}
>
    <Dialog.Content class="gap-10">
        <Dialog.Header>
            <Dialog.Title>
                {#if dialog == "new"}
                    Novo Vendedor
                {:else if dialog == "edit"}
                    Editar Vendedor
                {/if}
            </Dialog.Title>
        </Dialog.Header>

        <div class="flex flex-col gap-5">
            <div class="grid grid-cols-2 gap-x-3 gap-5">
                <div class="flex flex-col gap-3">
                    <Label for="code">Codigo:</Label>
                    <Input
                        id="code"
                        bind:value={sellerData.codigo}
                        placeholder="V001..."
                    />
                </div>
                <div class="flex flex-col gap-3">
                    <Label for="name">Nome:</Label>
                    <Input
                        id="name"
                        bind:value={sellerData.nome}
                        placeholder="Fellype Samuel..."
                    />
                </div>

                <div class="flex flex-col gap-3">
                    <Label for="email">Email:</Label>
                    <Input
                        id="email"
                        bind:value={sellerData.email}
                        placeholder="fellype.samuel@gmail.com..."
                    />
                </div>

                <div class="flex flex-col gap-3">
                    <Label for="phone">Telefone:</Label>
                    <Input
                        id="phone"
                        bind:value={sellerData.telefone}
                        placeholder="(21) 12345-6789..."
                    />
                </div>

                <div class="flex flex-col gap-3">
                    <Label for="cpf">CPF:</Label>
                    <Input
                        id="cpf"
                        bind:value={sellerData.cpf}
                        placeholder="123.456.789-10..."
                    />
                </div>
                <div class="flex flex-col gap-3">
                    <Label for="rg">RG:</Label>
                    <Input
                        id="rg"
                        bind:value={sellerData.rg}
                        placeholder="12.345.678-9..."
                    />
                </div>
            </div>

            <div class="flex flex-col gap-3">
                <Label for="squares"
                    >Praças de atendimento:
                    <span class="text-xs text-muted-foreground italic">
                        adicone a praça e pressione Enter
                    </span>
                </Label>
                <Tags id="squares" bind:tags={sellerData.pracas_atendimento} />
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
