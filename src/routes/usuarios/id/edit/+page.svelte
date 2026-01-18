<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import { Switch } from "@/components/ui/switch/index";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Key from "@lucide/svelte/icons/key";
    import Save from "@lucide/svelte/icons/save";
    import Shield from "@lucide/svelte/icons/shield";
    import User from "@lucide/svelte/icons/user";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    const id = Id.id;
    let loading = $state(true);
    let saving = $state(false);
    let vendedores = $state<Array<{ id: number; nome: string }>>([]);

    let userData = $state({
        username: "",
        password: "", // Optional update
        role: "user",
        ativo: true,
        vendedor_id: "-1",
    });

    async function load() {
        loading = true;
        try {
            const [uRes, vRes] = await Promise.all([
                db.select("SELECT * FROM usuarios WHERE id = $1", [id]) as any,
                db.select(
                    "SELECT id, nome FROM vendedores WHERE ativo = 1 ORDER BY nome ASC",
                    [],
                ) as any,
            ]);

            vendedores = vRes;

            if (uRes && uRes[0]) {
                const u = uRes[0];
                userData = {
                    username: u.username,
                    password: "", // Password is not loaded for security
                    role: u.role || "user",
                    ativo: u.ativo === 1,
                    vendedor_id: u.vendedor_id ? String(u.vendedor_id) : "-1",
                };
            } else {
                goto("/usuarios");
            }
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar dados do usuário.");
        } finally {
            loading = false;
        }
    }

    async function save() {
        if (!userData.username) {
            toast.error("Nome de usuário é obrigatório.");
            return;
        }

        saving = true;
        try {
            const dataToUpdate: any = {
                username: userData.username,
                role: userData.role,
                ativo: userData.ativo ? 1 : 0,
                vendedor_id:
                    userData.vendedor_id === "-1"
                        ? null
                        : parseInt(userData.vendedor_id),
            };

            // Only update password if provided
            if (userData.password) {
                dataToUpdate.password_hash = userData.password;
            }

            let q = queryHelper(dataToUpdate);
            await db.execute(
                `UPDATE usuarios SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            toast.success("Usuário atualizado com sucesso!");
            goto("/usuarios");
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar usuário");
            console.error(e);
        } finally {
            saving = false;
        }
    }

    onMount(() => load());
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/usuarios")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight text-primary">
                Editar Usuário
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading || saving}>
            <Save class="h-4 w-4" />
            Salvar Alterações
        </Button>
    </div>

    {#if loading}
        <div class="flex h-64 items-center justify-center">
            <Spinner class="h-10 w-10 text-primary" />
        </div>
    {:else}
        <div class="grid grid-cols-1 gap-6">
            <Card.Root class="shadow-lg border-primary/20 bg-primary/5 pb-0">
                <Card.Header>
                    <Card.Title
                        class="flex items-center gap-2 text-primary font-black"
                    >
                        <User class="h-6 w-6" />
                        Perfil do Usuário
                    </Card.Title>
                    <Card.Description
                        >Gerencie as informações de acesso e permissões.</Card.Description
                    >
                </Card.Header>
                <Card.Content
                    class="space-y-6 bg-background rounded-b-xl border-t p-8"
                >
                    <div class="grid gap-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="grid gap-2">
                                <Label for="username"
                                    >Nome de Usuário <Needed /></Label
                                >
                                <Input
                                    id="username"
                                    bind:value={userData.username}
                                    class="font-bold uppercase tracking-tight"
                                />
                            </div>
                            <div class="grid gap-2">
                                <Label
                                    for="password"
                                    class="flex items-center gap-2"
                                >
                                    Nova Senha
                                    <span
                                        class="text-[10px] font-normal text-muted-foreground"
                                        >(Deixe em branco para não alterar)</span
                                    >
                                </Label>
                                <div class="relative">
                                    <Key
                                        class="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground"
                                    />
                                    <Input
                                        id="password"
                                        type="password"
                                        bind:value={userData.password}
                                        placeholder="••••••••"
                                        class="pl-10"
                                    />
                                </div>
                            </div>
                        </div>

                        <div
                            class="grid grid-cols-1 md:grid-cols-2 gap-6 pt-4 border-t"
                        >
                            <div class="grid gap-2">
                                <Label for="role">Nível de Acesso (Papel)</Label
                                >
                                <Select.Root
                                    type="single"
                                    bind:value={userData.role}
                                >
                                    <Select.Trigger class="w-full">
                                        <div
                                            class="flex items-center gap-2 capitalize"
                                        >
                                            <Shield
                                                class="h-4 w-4 text-muted-foreground"
                                            />
                                            {userData.role}
                                        </div>
                                    </Select.Trigger>
                                    <Select.Content>
                                        <Select.Item value="admin"
                                            >Administrador</Select.Item
                                        >

                                        <Select.Item value="vendedor"
                                            >Vendedor</Select.Item
                                        >
                                    </Select.Content>
                                </Select.Root>
                            </div>
                            <div class="grid gap-2">
                                <Label for="vendedor">Vendedor Associado</Label>
                                <Select.Root
                                    type="single"
                                    bind:value={userData.vendedor_id}
                                >
                                    <Select.Trigger class="w-full">
                                        {vendedores.find(
                                            (v) =>
                                                String(v.id) ===
                                                userData.vendedor_id,
                                        )?.nome || "Selecione o vendedor..."}
                                    </Select.Trigger>
                                    <Select.Content>
                                        <Select.Item value="-1"
                                            >Nenhum</Select.Item
                                        >
                                        {#each vendedores as vendedor}
                                            <Select.Item
                                                value={String(vendedor.id)}
                                                >{vendedor.nome}</Select.Item
                                            >
                                        {/each}
                                    </Select.Content>
                                </Select.Root>
                            </div>
                        </div>

                        <div
                            class="flex items-center justify-between p-4 bg-muted/30 rounded-lg border border-border mt-4"
                        >
                            <div class="space-y-0.5">
                                <Label class="text-base font-bold"
                                    >Usuário Ativo</Label
                                >
                                <p
                                    class="text-sm text-muted-foreground font-medium"
                                >
                                    Define se o usuário pode acessar o sistema.
                                </p>
                            </div>
                            <Switch bind:checked={userData.ativo} />
                        </div>
                    </div>
                </Card.Content>
            </Card.Root>
        </div>
    {/if}
</div>
