<script lang="ts">
    import * as Card from "@/components/ui/card/index.js";
    import * as Table from "@/components/ui/table/index.js";
    import { Button } from "@/components/ui/button/index";
    import { Spinner } from "@/components/ui/spinner";
    import db from "@/db/db.svelte";
    import type { Fornecedor } from "@/types";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Truck from "@lucide/svelte/icons/truck";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import { goto } from "$app/navigation";
    import Id from "@/id.svelte";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let suppliers = $state<Array<Fornecedor>>([]);
    let loading = $state(true);
    let page = $state(1);
    let perPage = 10;
    let totalItems = $state(0);

    $effect(() => {
        if (page) load();
    });

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir este fornecedor?")) return;
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
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM fornecedores";
            let selectQuery = "SELECT * FROM fornecedores";

            selectQuery += ` ORDER BY razao_social LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, [])) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            suppliers = (await db.select(selectQuery, [])) as Array<Fornecedor>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar fornecedores: ${message}`);
            console.error("Erro ao carregar fornecedores:", e);
        } finally {
            loading = false;
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Truck class="h-8 w-8 text-primary" />
                Gerenciamento de Fornecedores
            </Card.Title>
            <Card.Description
                >Gerencie seus fornecedores e parceiros comerciais.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/fornecedores/novo");
            }}
        >
            Novo fornecedor
            <Plus class="ml-2 h-4 w-4" />
        </Button>
    </Card.Header>
    <Card.Content>
        {#if loading}
            <div class="flex h-48 items-center justify-center">
                <Spinner class="h-8 w-8 text-primary" />
            </div>
        {:else}
            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Razão Social / Nome Fantasia</Table.Head>
                        <Table.Head>Tipo</Table.Head>
                        <Table.Head>CPF/CNPJ</Table.Head>
                        <Table.Head>Cidade/UF</Table.Head>
                        <Table.Head>Telefone</Table.Head>
                        <Table.Head>Ativo</Table.Head>
                        <Table.Head class="w-12.5"></Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each suppliers as supplier (supplier.id)}
                        <Table.Row>
                            <Table.Cell class="font-medium text-primary">
                                {supplier.razao_social}
                                {#if supplier.nome_fantasia}
                                    <span
                                        class="block text-xs text-muted-foreground italic"
                                    >
                                        {supplier.nome_fantasia}
                                    </span>
                                {/if}
                            </Table.Cell>
                            <Table.Cell>
                                {supplier.tipo_pessoa === "F"
                                    ? "Física"
                                    : "Jurídica"}
                            </Table.Cell>
                            <Table.Cell>{supplier.documento}</Table.Cell>
                            <Table.Cell>
                                {supplier.cidade || "-"}{supplier.estado
                                    ? `/${supplier.estado}`
                                    : ""}
                            </Table.Cell>
                            <Table.Cell>{supplier.telefone || "-"}</Table.Cell>
                            <Table.Cell>
                                <span
                                    class={`px-2 py-1 rounded-full text-xs font-semibold ${supplier.ativo ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"}`}
                                >
                                    {supplier.ativo ? "Ativo" : "Inativo"}
                                </span>
                            </Table.Cell>
                            <Table.Cell>
                                <Button
                                    variant="ghost"
                                    size="icon-lg"
                                    onclick={() => {
                                        Id.id = supplier.id;
                                        goto(`/fornecedores/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 stroke-lime-400"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon-lg"
                                    onclick={() => delete_(supplier.id)}
                                >
                                    <Trash2
                                        class="h-4 w-4 stroke-3 stroke-red-500"
                                    />
                                </Button>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={7}
                                class="text-center py-10 text-muted-foreground"
                            >
                                Nenhum fornecedor encontrado.
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                </Table.Body>
            </Table.Root>

            <div class="mt-4">
                <PaginationControl count={totalItems} {perPage} bind:page />
            </div>
        {/if}
    </Card.Content>
</Card.Root>
