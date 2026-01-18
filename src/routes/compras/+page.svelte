<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import Eye from "@lucide/svelte/icons/eye";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import ShoppingBag from "@lucide/svelte/icons/shopping-bag";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let compras = $state<Array<any>>([]);
    let searchQuery = $state("");
    let loading = $state(true);
    let page = $state(1);
    let perPage = 10;
    let totalItems = $state(0);

    let debounceTimer: ReturnType<typeof setTimeout>;

    function handleSearch() {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            page = 1;
            load();
        }, 300);
    }

    $effect(() => {
        if (page) load();
    });

    async function load() {
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = `
                SELECT COUNT(*) as count
                FROM compras c
                JOIN fornecedores f ON c.fornecedor_id = f.id
            `;
            let selectQuery = `
                SELECT c.*, f.razao_social as fornecedor_razao_social
                FROM compras c
                JOIN fornecedores f ON c.fornecedor_id = f.id
            `;
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause =
                    " WHERE c.numero_nota LIKE $1 OR f.razao_social LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY c.data_emissao DESC, c.id DESC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            compras = (await db.select(selectQuery, params)) as Array<any>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados do banco de dados.");
        } finally {
            loading = false;
        }
    }

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir esta compra?")) return;
        try {
            await db.execute("DELETE FROM compras WHERE id = $1", [id]);
            await load();
            toast.success("Compra excluída com sucesso!");
        } catch (e: any) {
            toast.error("Falha ao deletar compra: " + e.message);
        }
    }

    onMount(() => load());

    function formatCurrency(v: number | null) {
        return (v || 0).toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }

    function formatDate(date: string | null) {
        if (!date) return "-";
        return new Date(date).toLocaleDateString("pt-BR");
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <ShoppingBag class="h-8 w-8 text-primary" />
                Gerenciamento de Compras
            </Card.Title>
            <Card.Description>
                Gerencie as notas fiscais e entradas de estoque de fornecedores.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/compras/novo");
            }}
        >
            Nova Compra
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
                    placeholder="Pesquisar por nota ou fornecedor..."
                    class="pl-8"
                    bind:value={searchQuery}
                    oninput={handleSearch}
                />
            </div>
        </div>

        {#if loading}
            <div class="flex h-48 items-center justify-center">
                <Spinner class="h-8 w-8 text-primary" />
            </div>
        {:else}
            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Nº Nota</Table.Head>
                        <Table.Head>Fornecedor</Table.Head>
                        <Table.Head>Emissão</Table.Head>
                        <Table.Head>Entrada</Table.Head>
                        <Table.Head class="text-right">Valor Total</Table.Head>
                        <Table.Head class="w-12.5 text-right">Ações</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each compras as compra (compra.id)}
                        <Table.Row>
                            <Table.Cell class="font-bold">
                                {compra.numero_nota || "S/N"}
                            </Table.Cell>
                            <Table.Cell
                                >{compra.fornecedor_razao_social}</Table.Cell
                            >
                            <Table.Cell>
                                {formatDate(compra.data_emissao)}
                            </Table.Cell>
                            <Table.Cell>
                                {formatDate(compra.data_entrada)}
                            </Table.Cell>
                            <Table.Cell
                                class="font-semibold text-primary text-right"
                            >
                                {formatCurrency(compra.valor_total)}
                            </Table.Cell>
                            <Table.Cell class="text-right whitespace-nowrap">
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = compra.id;
                                        goto(`/compras/id`);
                                    }}
                                >
                                    <Eye
                                        class="h-4 w-4 stroke-3 text-primary"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = compra.id;
                                        goto(`/compras/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 text-lime-600"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => delete_(compra.id)}
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
                                colspan={6}
                                class="text-center py-10 text-muted-foreground"
                            >
                                Nenhuma compra encontrada.
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
