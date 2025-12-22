<script lang="ts">
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as InputGroup from "$lib/components/ui/input-group/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import LabeledInput from "@/components/labeled-input.svelte";
    import { Button } from "@/components/ui/button/index";
    import Checkbox from "@/components/ui/checkbox/checkbox.svelte";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Fornecedor } from "@/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let suppliers = $state<Array<Fornecedor>>([]);
    let supplierData = $state<Partial<Fornecedor>>({ ativo: true });
    let document = $state({ value: "", kind: "CPF" });
    let dialog = $state<string | null>(null);

    async function save() {
        try {
            supplierData[document.kind.toLowerCase() as "cpf" | "cnpj"] =
                document.value;

            delete (supplierData as any).data_cadastro;

            let q = queryHelper(supplierData);
            let query = "";

            if (supplierData.id) {
                query = `UPDATE fornecedores SET ${q.setClauses} WHERE id = ${supplierData.id}`;
            } else {
                query = `INSERT INTO fornecedores (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Fornecedor ${supplierData.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar fornecedor: ${message}`);
            console.error("Erro ao salvar fornecedor:", e);
            dialog = null;
        }
    }

    async function delete_(id: number) {
        try {
            await db.execute("DELETE FROM fornecedores WHERE id = $1", [id]);
            await load();
            toast.success("Fornecedor excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar fornecedor: ${message}`);
            console.error("Erro ao deletar fornecedor:", e);
        }
    }

    async function load() {
        try {
            suppliers = (await db.select(
                "SELECT * FROM fornecedores",
                [],
            )) as Array<Fornecedor>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar fornecedores: ${message}`);
            console.error("Erro ao carregar fornecedores:", e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex w-full">
        <Card.Title class="text-3xl">Gerenciamento de Fornecedores</Card.Title>
        <Button
            class="ml-auto cursor-pointer border-primary/50! hover:bg-primary/50! transition-colors duration-500!"
            variant="outline"
            size="lg"
            onclick={() => {
                dialog = "new";
            }}
        >
            Novo fornecedor
            <Plus class="stroke-2" />
        </Button>
    </Card.Header>
    <Card.Content>
        <Table.Root>
            <Table.Caption>Lista de fornecedores.</Table.Caption>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Marca</Table.Head>
                    <Table.Head>Razão Social</Table.Head>
                    <Table.Head>CPF/CNPJ</Table.Head>
                    <Table.Head>Cidade</Table.Head>
                    <Table.Head>Telefone</Table.Head>
                    <Table.Head>Ativo</Table.Head>
                    <Table.Head></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each suppliers as supplier, i (supplier.id)}
                    <Table.Row>
                        <Table.Cell>{supplier.marca}</Table.Cell>
                        <Table.Cell>{supplier.razao_social}</Table.Cell>
                        <Table.Cell>{supplier.cpf || supplier.cnpj}</Table.Cell>
                        <Table.Cell>{supplier.cidade}</Table.Cell>
                        <Table.Cell>{supplier.telefone}</Table.Cell>
                        <Table.Cell>{supplier.ativo ? "Sim" : "Não"}</Table.Cell
                        >
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
                                                supplierData = { ...supplier };

                                                if (supplierData.cpf) {
                                                    document.kind = "CPF";
                                                    document.value =
                                                        supplierData.cpf;
                                                } else if (supplierData.cnpj) {
                                                    document.kind = "CNPJ";
                                                    document.value =
                                                        supplierData.cnpj;
                                                }

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
                                            onclick={() => delete_(supplier.id)}
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
    onOpenChange={(e) =>
        e ? null : ((dialog = null), (supplierData = { ativo: true }))}
>
    <Dialog.Content class="gap-10">
        <Dialog.Header>
            <Dialog.Title>
                {#if dialog == "new"}
                    Novo fornecedor
                {:else if dialog == "edit"}
                    Editar fornecedor
                {/if}
            </Dialog.Title>
        </Dialog.Header>

        <div class="flex flex-col gap-5">
            <LabeledInput
                label="Marca"
                name="brand"
                bind:value={supplierData.marca}
                placeholder="..."
            />

            <LabeledInput
                label="Razão Social"
                name="name_"
                bind:value={supplierData.razao_social}
                placeholder="..."
            />

            <LabeledInput
                label="Cidade"
                name="city"
                bind:value={supplierData.cidade}
                placeholder="..."
            />

            <LabeledInput
                label="Telefone"
                name="Phone"
                bind:value={supplierData.telefone}
                placeholder="..."
            />

            <div class="grid w-full gap-3">
                <Label>Documento:</Label>
                <InputGroup.Root>
                    <InputGroup.Input
                        bind:value={document.value}
                        placeholder={document.kind == "CPF"
                            ? "XXX.XXX.XXX-XX"
                            : "XX.XXX.XXX/XXXX-XX"}
                    />
                    <InputGroup.Addon align="inline-end">
                        <DropdownMenu.Root>
                            <DropdownMenu.Trigger>
                                {#snippet child({ props })}
                                    <InputGroup.Button
                                        {...props}
                                        variant="ghost"
                                        size="sm"
                                    >
                                        {document.kind}
                                    </InputGroup.Button>
                                {/snippet}
                            </DropdownMenu.Trigger>
                            <DropdownMenu.Content align="end">
                                <DropdownMenu.Item
                                    onSelect={() => (document.kind = "CPF")}
                                >
                                    CPF
                                </DropdownMenu.Item>
                                <DropdownMenu.Item
                                    onSelect={() => (document.kind = "CNPJ")}
                                >
                                    CNPJ
                                </DropdownMenu.Item>
                            </DropdownMenu.Content>
                        </DropdownMenu.Root>
                    </InputGroup.Addon>
                </InputGroup.Root>
            </div>

            <div class="flex gap-3">
                <Label for="">Ativo:</Label>
                <Checkbox bind:checked={supplierData.ativo} />
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
