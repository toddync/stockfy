<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Spinner } from "@/components/ui/spinner";
    import * as Table from "@/components/ui/table/index.js";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import type { Usuario } from "@/types";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Shield from "@lucide/svelte/icons/users";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    let usuarios = $state<Array<Usuario & { vendedor_nome?: string }>>([]);
    let loading = $state(true);
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

    async function load() {
        loading = true;
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM usuarios";
            let selectQuery = `
                SELECT u.*, v.nome as vendedor_nome
                FROM usuarios u
                LEFT JOIN vendedores v ON u.vendedor_id = v.id
            `;
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = " WHERE u.username LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY u.username ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            usuarios = (await db.select(selectQuery, params)) as any;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar usuários.");
        } finally {
            loading = false;
        }
    }

    async function remove(id: number) {
        if (!confirm("Tem certeza que deseja excluir este usuário?")) return;
        try {
            await db.execute("DELETE FROM usuarios WHERE id = $1", [id]);
            toast.success("Usuário excluído com sucesso!");
            load();
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir usuário");
            console.error(e);
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center w-full">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Shield class="h-8 w-8  text-primary" />
                Gerenciamento de Usuários
            </Card.Title>
            <Card.Description>
                Controle de acesso, permissões e contas de usuários do sistema.
            </Card.Description>
        </div>
        <Button
            onclick={() => goto("/usuarios/novo")}
            class="ml-auto cursor-pointer gap-2"
            variant="outline"
            size="lg"
        >
            <Plus class="h-4 w-4" />
            Novo Usuário
        </Button>
    </Card.Header>
    <Card.Content>
        <div class="mb-6 flex items-center gap-4 h-full">
            <div class="relative flex-1 max-w-sm">
                <Search
                    class="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground"
                />
                <Input
                    type="search"
                    placeholder="Pesquisar por nome de usuário..."
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
                        <Table.Head>Usuário</Table.Head>
                        <Table.Head>Role</Table.Head>
                        <Table.Head>Vendedor</Table.Head>
                        <Table.Head>Status</Table.Head>
                        <Table.Head class="text-right">Ações</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each usuarios as usuario}
                        <Table.Row class="hover:bg-muted/50 transition-colors">
                            <Table.Cell>
                                <div class="flex items-center gap-2">
                                    <span
                                        class="font-bold text-primary uppercase tracking-tight"
                                    >
                                        {usuario.username}
                                    </span>
                                </div>
                            </Table.Cell>
                            <Table.Cell>
                                {#if usuario.role === "admin"}
                                    <span
                                        class="inline-flex items-center rounded-full bg-primary/10 px-2.5 py-0.5 text-xs font-bold text-primary border border-primary/20 uppercase tracking-wider"
                                    >
                                        Administrador
                                    </span>
                                {:else if usuario.role === "vendedor"}
                                    <span
                                        class="inline-flex items-center rounded-full bg-blue-500/10 px-2.5 py-0.5 text-xs font-bold text-blue-500 border border-blue-500/20 uppercase tracking-wider"
                                    >
                                        Vendedor
                                    </span>
                                {:else}
                                    <span
                                        class="inline-flex items-center rounded-full bg-muted/50 px-2.5 py-0.5 text-xs font-bold text-muted-foreground border border-muted uppercase tracking-wider"
                                    >
                                        {usuario.role || "Usuário"}
                                    </span>
                                {/if}
                            </Table.Cell>
                            <Table.Cell>
                                <span
                                    class="text-muted-foreground italic font-medium"
                                >
                                    {usuario.vendedor_nome ? "Sim" : "Não"}
                                </span>
                            </Table.Cell>
                            <Table.Cell>
                                <div class="flex items-center gap-2">
                                    <div
                                        class="h-2 w-2 rounded-full {usuario.ativo
                                            ? 'bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]'
                                            : 'bg-destructive'}"
                                    ></div>
                                    <span
                                        class="text-xs font-black uppercase tracking-widest {usuario.ativo
                                            ? 'text-emerald-600'
                                            : 'text-destructive'}"
                                    >
                                        {usuario.ativo ? "Ativo" : "Inativo"}
                                    </span>
                                </div>
                            </Table.Cell>
                            <Table.Cell class="text-right whitespace-nowrap">
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => {
                                        Id.id = usuario.id;
                                        goto(`/usuarios/id/edit`);
                                    }}
                                >
                                    <PencilLine
                                        class="h-4 w-4 stroke-3 text-lime-600"
                                    />
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onclick={() => remove(usuario.id)}
                                >
                                    <Trash2
                                        class="h-4 w-4 stroke-3 text-red-500"
                                    />
                                </Button>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={5}
                                class="h-32 text-center text-muted-foreground italic"
                            >
                                Nenhum usuário encontrado.
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                </Table.Body>
            </Table.Root>
        {/if}

        <div class="mt-4">
            <PaginationControl count={totalItems} {perPage} bind:page />
        </div>
    </Card.Content>
</Card.Root>
