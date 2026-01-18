<script lang="ts">
    import { goto } from "$app/navigation";
    import * as Card from "@/components/ui/card/index.js";
    import * as Table from "@/components/ui/table/index.js";
    import { Button } from "@/components/ui/button/index";
    import { Input } from "@/components/ui/input/index";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import type { Cliente } from "@/types";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Users from "@lucide/svelte/icons/users";
    import { Spinner } from "@/components/ui/spinner";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let clientes = $state<Array<Cliente>>([]);
    let searchQuery = $state("");
    let loading = $state(true);
    let page = $state(1);
    let perPage = 10;
    let totalItems = $state(0);

    let debounceTimer: number;

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
        try {
            await db.execute("DELETE FROM clientes WHERE id = $1", [id]);

            await load();
            toast.success("Cliente excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar cliente: ${message}`);
            console.error("Erro ao deletar cliente:", e);
        }
    }

    async function load() {
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM clientes";
            let selectQuery = "SELECT * FROM clientes";
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = " WHERE nome LIKE $1 OR cpf_cnpj LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            // Re-bind params for select query because we need it for the WHERE clause if present
            // However, since we appended LIMIT/OFFSET directly to string (and they are integers),
            // we reuse the same params array which contains only the search term if present.

            clientes = (await db.select(selectQuery, params)) as Array<Cliente>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar clientes: ${message}`);
            console.error("Erro ao carregar clientes:", e);
        } finally {
            loading = false;
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex w-full">
        <Card.Title class="text-3xl flex items-center gap-2">
            <Users class="h-8 w-8 text-primary" /> Gerenciamento de Clientes
        </Card.Title>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => goto("/clientes/novo/")}
        >
            Novo cliente
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
                    placeholder="Pesquisar por nome ou CPF/CNPJ..."
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
                        <Table.Head>Nome</Table.Head>
                        <Table.Head>CPF/CNPJ</Table.Head>
                        <Table.Head>Telefone</Table.Head>
                        <Table.Head>Cidade</Table.Head>
                        <Table.Head class="w-12.5"></Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each clientes as c (c.id)}
                        <Table.Row>
                            <Table.Cell class="font-medium text-primary">
                                {c.nome}
                            </Table.Cell>
                            <Table.Cell>{c.cpf_cnpj}</Table.Cell>
                            <Table.Cell>{c.telefone}</Table.Cell>
                            <Table.Cell class="text-primary">
                                {c.cidade}
                            </Table.Cell>
                            <Table.Cell>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = c.id;
                                        goto(`/clientes/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-lime-500! stroke-3"
                                    />
                                </Button>

                                <Button
                                    variant="ghost"
                                    size="icon-lg"
                                    onclick={() => delete_(c.id)}
                                >
                                    <Trash2
                                        class="h-4 w-4 stroke-red-500! stroke-3"
                                    />
                                </Button>
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                    {#if clientes.length === 0}
                        <Table.Row>
                            <Table.Cell
                                colspan={5}
                                class="h-32 text-center text-muted-foreground italic"
                            >
                                Nenhum cliente encontrado.
                            </Table.Cell>
                        </Table.Row>
                    {/if}
                </Table.Body>
            </Table.Root>

            <div class="mt-4">
                <PaginationControl count={totalItems} {perPage} bind:page />
            </div>
        {/if}
    </Card.Content>
</Card.Root>
