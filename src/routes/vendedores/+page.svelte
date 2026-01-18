<script lang="ts">
    import * as Card from "@/components/ui/card/index.js";
    import DolarSign from "@lucide/svelte/icons/dollar-sign";
    import * as Table from "@/components/ui/table/index.js";
    import { Button } from "@/components/ui/button/index";
    import { Input } from "@/components/ui/input/index";
    import Search from "@lucide/svelte/icons/search";
    import db from "@/db/db.svelte";
    import type { Vendedor } from "@/types";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import { goto } from "$app/navigation";
    import Id from "@/id.svelte";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let sellers = $state<Array<Vendedor>>([]);
    let searchQuery = $state("");

    // Pagination
    let page = $state(1);
    const perPage = 10;
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

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir este vendedor?")) return;
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
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM vendedores";
            let selectQuery = "SELECT * FROM vendedores";
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause =
                    " WHERE nome LIKE $1 OR codigo LIKE $1 OR email LIKE $1 OR cpf LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY nome ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            sellers = (await db.select(selectQuery, params)) as Array<Vendedor>;
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
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <DolarSign class="h-8 w-8 text-primary" />
                Gerenciamento de Vendedores
            </Card.Title>
            <Card.Description>
                Gerencie sua equipe de vendas e comissões.
            </Card.Description>
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                goto("/vendedores/novo");
            }}
        >
            Novo vendedor
            <Plus class="stroke-2" />
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
                    placeholder="Pesquisar por nome, código ou email..."
                    class="pl-8"
                    bind:value={searchQuery}
                    oninput={handleSearch}
                />
            </div>
        </div>

        <Table.Root>
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
                {#each sellers as seller (seller.id)}
                    <Table.Row>
                        <Table.Cell>{seller.codigo}</Table.Cell>
                        <Table.Cell class="font-bold text-primary"
                            >{seller.nome}</Table.Cell
                        >
                        <Table.Cell>{seller.cpf}</Table.Cell>
                        <Table.Cell>{seller.email}</Table.Cell>
                        <Table.Cell>{seller.telefone}</Table.Cell>
                        <Table.Cell>
                            <Button
                                variant="ghost"
                                size="icon-lg"
                                onclick={() => {
                                    Id.id = seller.id;
                                    goto(`/vendedores/id/edit`);
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
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={6}
                            class="text-center py-12 text-muted-foreground italic"
                        >
                            Nenhum vendedor encontrado.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>

        <div class="mt-4">
            <PaginationControl count={totalItems} {perPage} bind:page />
        </div>
    </Card.Content>
</Card.Root>
