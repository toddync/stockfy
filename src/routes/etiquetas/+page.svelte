<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import * as Table from "@/components/ui/table/index.js";
    import db from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Tags from "@lucide/svelte/icons/tags";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";
    import PaginationControl from "@/components/PaginationControl.svelte";

    interface Tag {
        id: number;
        nome: string;
    }

    let tags = $state<Array<Tag>>([]);
    let searchQuery = $state("");
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

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir esta tag?")) return;
        try {
            await db.execute("DELETE FROM tags WHERE id = $1", [id]);
            await load();
            toast.success("Tag excluída com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao excluir tag");
            console.error(e);
        }
    }

    async function load() {
        try {
            const offset = (page - 1) * perPage;
            let countQuery = "SELECT COUNT(*) as count FROM tags";
            let selectQuery = "SELECT * FROM tags";
            let params: any[] = [];

            if (searchQuery) {
                const search = `%${searchQuery}%`;
                const whereClause = " WHERE nome LIKE $1";
                countQuery += whereClause;
                selectQuery += whereClause;
                params.push(search);
            }

            selectQuery += ` ORDER BY nome ASC LIMIT ${perPage} OFFSET ${offset}`;

            const countResult = (await db.select(countQuery, params)) as [
                { count: number },
            ];
            totalItems = countResult[0].count;

            tags = (await db.select(selectQuery, params)) as Array<Tag>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar tags.");
        }
    }

    onMount(() => load());
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center justify-between">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Tags class="h-8 w-8 text-primary" />
                Gerenciamento de Tags
            </Card.Title>
            <Card.Description>
                Organize seus produtos através de etiquetas de identificação
                (Tags).
            </Card.Description>
        </div>
        <Button
            class="cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => goto("/etiquetas/novo")}
        >
            <Plus class="mr-2 h-4 w-4" />
            Nova Tag
        </Button>
    </Card.Header>
    <Card.Content>
        <div class="mb-6 flex items-center justify-between">
            <div class="relative flex-1 max-w-sm">
                <Search
                    class="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground"
                />
                <Input
                    type="search"
                    placeholder="Pesquisar por nome da tag..."
                    class="pl-8"
                    bind:value={searchQuery}
                    oninput={handleSearch}
                />
            </div>
        </div>

        <div class="rounded-md border">
            <Table.Root>
                <Table.Header>
                    <Table.Row>
                        <Table.Head>Nome da Tag</Table.Head>
                        <Table.Head class="w-24 text-right">Ações</Table.Head>
                    </Table.Row>
                </Table.Header>
                <Table.Body>
                    {#each tags as t (t.id)}
                        <Table.Row>
                            <Table.Cell class="font-bold text-primary">
                                {t.nome}
                            </Table.Cell>
                            <Table.Cell class="text-right">
                                <div class="flex justify-end gap-2">
                                    <Button
                                        variant="ghost"
                                        size="icon"
                                        onclick={() => {
                                            Id.id = t.id;
                                            goto(`/etiquetas/id/edit`);
                                        }}
                                    >
                                        <PencilLine
                                            class="h-4 w-4 stroke-3 text-lime-600"
                                        />
                                    </Button>
                                    <Button
                                        variant="ghost"
                                        size="icon"
                                        onclick={() => delete_(t.id)}
                                    >
                                        <Trash2
                                            class="h-4 w-4 stroke-3 text-red-500"
                                        />
                                    </Button>
                                </div>
                            </Table.Cell>
                        </Table.Row>
                    {:else}
                        <Table.Row>
                            <Table.Cell
                                colspan={2}
                                class="text-center py-10 text-muted-foreground h-32"
                            >
                                Nenhuma tag encontrada.
                            </Table.Cell>
                        </Table.Row>
                    {/each}
                </Table.Body>
            </Table.Root>
        </div>

        <div class="mt-4">
            <PaginationControl count={totalItems} {perPage} bind:page />
        </div>
    </Card.Content>
</Card.Root>
