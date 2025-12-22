<script lang="ts">
    import { Button } from "$lib/components/ui/button";
    import * as Card from "$lib/components/ui/card";
    import * as Dialog from "$lib/components/ui/dialog";
    import { Input } from "$lib/components/ui/input/";
    import { Label } from "@/components/ui/label";
    import * as Table from "$lib/components/ui/table";
    import db, { queryHelper } from "@/db/db.svelte";
    import type { Usuario } from "$lib/types";
    import Plus from "@lucide/svelte/icons/plus";
    import Search from "@lucide/svelte/icons/search";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import UserCog from "@lucide/svelte/icons/user-cog";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    interface Permissao {
        id: number;
        chave: string;
        descricao: string;
    }

    interface UsuarioPermissao {
        usuario_id: number;
        permissao_id: number;
    }

    let usuarioPermissoes = $state<Array<UsuarioPermissao>>([]);
    let usuarios = $state<Array<Usuario>>([]);
    let permissoes = $state<Array<Permissao>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredUP = $derived(
        usuarioPermissoes.filter((up) => {
            const user = usuarios.find((u) => u.id === up.usuario_id);
            const perm = permissoes.find((p) => p.id === up.permissao_id);
            return (
                user?.nome.toLowerCase().includes(searchQuery.toLowerCase()) ||
                perm?.descricao
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                perm?.chave.toLowerCase().includes(searchQuery.toLowerCase())
            );
        }),
    );

    let upData = $state<UsuarioPermissao>({
        usuario_id: 0,
        permissao_id: 0,
    });

    async function save() {
        if (!upData.usuario_id || !upData.permissao_id) {
            toast.error("Selecione um usuário e uma permissão.");
            return;
        }

        try {
            let q = queryHelper(upData);
            await db.execute(
                `INSERT INTO usuario_permissoes (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            await load();
            dialog = null;
            toast.success("Permissão associada com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao salvar associação");
            console.error(e);
        }
    }

    async function delete_(usuario_id: number, permissao_id: number) {
        if (!confirm("Confirmar remoção desta permissão?")) return;
        try {
            await db.execute(
                "DELETE FROM usuario_permissoes WHERE usuario_id = $1 AND permissao_id = $2",
                [usuario_id, permissao_id],
            );
            await load();
            toast.success("Associação removida com sucesso!");
        } catch (e: any) {
            toast.error(e.message || "Erro ao remover associação");
            console.error(e);
        }
    }

    async function load() {
        try {
            usuarioPermissoes = (await db.select(
                "SELECT * FROM usuario_permissoes",
                [],
            )) as Array<UsuarioPermissao>;
            usuarios = (await db.select(
                "SELECT * FROM usuarios",
                [],
            )) as Array<Usuario>;
            permissoes = (await db.select(
                "SELECT * FROM permissoes",
                [],
            )) as Array<Permissao>;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados do banco de dados.");
        }
    }

    onMount(() => load());

    function resetData() {
        upData = {
            usuario_id: 0,
            permissao_id: 0,
        };
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <UserCog class="h-8 w-8 text-primary" />
                Permissões por Usuário
            </Card.Title>
            <Card.Description
                >Associe permissões específicas a cada usuário do sistema.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                resetData();
                dialog = "new";
            }}
        >
            Nova associação
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
                    placeholder="Pesquisar por usuário ou permissão..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Usuário</Table.Head>
                    <Table.Head>Permissão</Table.Head>
                    <Table.Head>Identificador</Table.Head>
                    <Table.Head class="w-[100px]"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredUP as up (up.usuario_id + "-" + up.permissao_id)}
                    <Table.Row>
                        <Table.Cell class="font-bold"
                            >{usuarios.find((u) => u.id === up.usuario_id)
                                ?.nome || "—"}</Table.Cell
                        >
                        <Table.Cell
                            >{permissoes.find((p) => p.id === up.permissao_id)
                                ?.descricao || "—"}</Table.Cell
                        >
                        <Table.Cell>
                            <code
                                class="px-2 py-1 rounded bg-muted text-xs font-mono"
                            >
                                {permissoes.find(
                                    (p) => p.id === up.permissao_id,
                                )?.chave || "—"}
                            </code>
                        </Table.Cell>
                        <Table.Cell class="flex justify-end gap-2">
                            <Button
                                variant="ghost"
                                size="icon"
                                onclick={() =>
                                    delete_(up.usuario_id, up.permissao_id)}
                            >
                                <Trash2 class="h-4 w-4 text-destructive" />
                            </Button>
                        </Table.Cell>
                    </Table.Row>
                {:else}
                    <Table.Row>
                        <Table.Cell
                            colspan={4}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhuma associação encontrada.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root open={dialog != null} onOpenChange={(e) => !e && (dialog = null)}>
    <Dialog.Content class="sm:max-w-[425px]">
        <Dialog.Header>
            <Dialog.Title>Nova Associação</Dialog.Title>
            <Dialog.Description
                >Selecione o usuário e a permissão que deseja atribuir.</Dialog.Description
            >
        </Dialog.Header>
        <div class="grid gap-4 py-4">
            <div class="grid gap-2">
                <Label for="user">Usuário</Label>
                <select
                    id="user"
                    bind:value={upData.usuario_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                >
                    <option value={0}>Selecione um usuário...</option>
                    {#each usuarios as u}
                        <option value={u.id}>{u.nome}</option>
                    {/each}
                </select>
            </div>
            <div class="grid gap-2">
                <Label for="perm">Permissão</Label>
                <select
                    id="perm"
                    bind:value={upData.permissao_id}
                    class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                >
                    <option value={0}>Selecione uma permissão...</option>
                    {#each permissoes as p}
                        <option value={p.id}>{p.descricao} ({p.chave})</option>
                    {/each}
                </select>
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
