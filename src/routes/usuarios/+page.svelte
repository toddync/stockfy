<script lang="ts">
    import Users from "@lucide/svelte/icons/users";
    import * as Card from "$lib/components/ui/card/index.js";
    import * as Dialog from "$lib/components/ui/dialog/index.js";
    import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index.js";
    import * as Table from "$lib/components/ui/table/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import db, { queryHelper } from "@/db/db.svelte";
    import { Checkbox } from "@/components/ui/checkbox/index";
    import type { Usuario } from "$lib/types";
    import Ellipsis from "@lucide/svelte/icons/ellipsis";
    import PencilLine from "@lucide/svelte/icons/pencil-line";
    import Plus from "@lucide/svelte/icons/plus";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import Search from "@lucide/svelte/icons/search";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let usuarios = $state<Array<Usuario>>([]);
    let dialog = $state<string | null>(null);
    let searchQuery = $state("");

    let filteredUsuarios = $derived(
        searchQuery
            ? usuarios.filter((u) =>
                  u.nome.toLowerCase().includes(searchQuery.toLowerCase()),
              )
            : usuarios,
    );

    let usuarioData = $state<Partial<Usuario>>({
        nome: "",
        senha_hash: "",
        ativo: true,
    });

    async function save() {
        try {
            const dataToSave = { ...usuarioData };
            delete (dataToSave as any).data_criacao;

            let q = queryHelper(dataToSave);
            let query = "";

            if (dataToSave.id) {
                query = `UPDATE usuarios SET ${q.setClauses} WHERE id = ${dataToSave.id}`;
            } else {
                query = `INSERT INTO usuarios (${q.columns}) VALUES (${q.placeholders})`;
            }

            await db.execute(query, q.values);

            await load();
            dialog = null;
            toast.success(
                `Usuário ${dataToSave.id ? "atualizado" : "criado"} com sucesso!`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao salvar usuário: ${message}`);
            console.error("Erro ao salvar usuário:", e);
        }
    }

    async function delete_(id: number) {
        if (!confirm("Tem certeza que deseja excluir este usuário?")) return;
        try {
            await db.execute("DELETE FROM usuarios WHERE id = $1", [id]);
            await load();
            toast.success("Usuário excluído com sucesso!");
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao deletar usuário: ${message}`);
            console.error("Erro ao deletar usuário:", e);
        }
    }

    async function load() {
        try {
            usuarios = (await db.select(
                "SELECT * FROM usuarios",
                [],
            )) as Array<Usuario>;
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            toast.error(`Falha ao carregar usuários: ${message}`);
            console.error("Erro ao carregar usuários:", e);
        }
    }

    onMount(() => load());

    function resetUsuarioData() {
        usuarioData = {
            nome: "",
            senha_hash: "",
            ativo: true,
        };
    }
</script>

<Card.Root class="m-10">
    <Card.Header class="flex flex-row items-center">
        <div>
            <Card.Title class="text-3xl flex items-center gap-2">
                <Users class="h-8 w-8 text-primary" />
                Gerenciamento de Usuários
            </Card.Title>
            <Card.Description
                >Gerencie os usuários do sistema e suas permissões.</Card.Description
            >
        </div>
        <Button
            class="ml-auto cursor-pointer"
            variant="outline"
            size="lg"
            onclick={() => {
                resetUsuarioData();
                dialog = "new";
            }}
        >
            Novo usuário
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
                    placeholder="Pesquisar por nome ou usuário..."
                    class="pl-8"
                    bind:value={searchQuery}
                />
            </div>
        </div>

        <Table.Root>
            <Table.Header>
                <Table.Row>
                    <Table.Head>Nome</Table.Head>
                    <!-- <Table.Head>Usuário</Table.Head> -->
                    <Table.Head>Ativo</Table.Head>
                    <Table.Head>Data Criação</Table.Head>
                    <Table.Head class="w-12.5"></Table.Head>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {#each filteredUsuarios as usuario (usuario.id)}
                    <Table.Row>
                        <Table.Cell class="font-medium"
                            >{usuario.nome}</Table.Cell
                        >
                        <Table.Cell>
                            <span
                                class={`px-2.5 py-0.5 rounded-full text-xs font-semibold ${
                                    usuario.ativo
                                        ? "bg-green-100 text-green-800"
                                        : "bg-red-100 text-red-800"
                                }`}
                            >
                                {usuario.ativo ? "Ativo" : "Inativo"}
                            </span>
                        </Table.Cell>
                        <Table.Cell
                            >{new Date(usuario.data_criacao).toLocaleDateString(
                                "pt-BR",
                            )}</Table.Cell
                        >
                        <Table.Cell>
                            <Button
                                variant="ghost"
                                size="icon-lg"
                                onclick={() => {
                                    usuarioData = { ...usuario };
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
                                class="text-destructive focus:text-destructive"
                                onclick={() => delete_(usuario.id)}
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
                            colspan={4}
                            class="text-center py-10 text-muted-foreground"
                        >
                            Nenhum usuário encontrado.
                        </Table.Cell>
                    </Table.Row>
                {/each}
            </Table.Body>
        </Table.Root>
    </Card.Content>
</Card.Root>

<Dialog.Root
    open={dialog != null}
    onOpenChange={(e) => {
        if (!e) {
            dialog = null;
        }
    }}
>
    <Dialog.Content class="sm:max-w-[425px]">
        <Dialog.Header>
            <Dialog.Title>
                {dialog === "new" ? "Novo Usuário" : "Editar Usuário"}
            </Dialog.Title>
            <Dialog.Description>
                Preencha os dados do usuário abaixo.
            </Dialog.Description>
        </Dialog.Header>

        <div class="grid gap-4 py-4">
            <div class="grid gap-2">
                <Label for="nome">Nome de Usuário</Label>
                <Input
                    id="nome"
                    bind:value={usuarioData.nome}
                    placeholder="Ex: admin"
                />
            </div>
            <div class="grid gap-2">
                <Label for="senha">Senha</Label>
                <Input
                    id="senha"
                    type="password"
                    bind:value={usuarioData.senha_hash}
                    placeholder={dialog === "edit"
                        ? "Deixe em branco para não alterar"
                        : "Senha do usuário"}
                />
            </div>
            <div class="flex items-center space-x-2">
                <Checkbox id="ativo" bind:checked={usuarioData.ativo} />
                <Label
                    for="ativo"
                    class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                >
                    Usuário Ativo
                </Label>
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
