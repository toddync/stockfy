<script lang="ts">
    import { goto } from "$app/navigation";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select/index.js";
    import { Switch } from "@/components/ui/switch/index";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Save from "@lucide/svelte/icons/save";
    import Shield from "@lucide/svelte/icons/shield";
    import User from "@lucide/svelte/icons/user";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    let loading = $state(false);
    let vendedores = $state<Array<{ id: number; nome: string }>>([]);

    let userData = $state({
        username: "",
        password: "",
        role: "user",
        ativo: true,
        vendedor_id: "-1",
    });

    async function loadVendedores() {
        try {
            vendedores = (await db.select(
                "SELECT id, nome FROM vendedores WHERE ativo = 1 ORDER BY nome ASC",
                [],
            )) as any;
        } catch (e: any) {
            console.error(e);
            toast.error("Erro ao carregar vendedores.");
        }
    }

    async function save() {
        if (!userData.username || !userData.password) {
            toast.error("Por favor, preencha o usuário e a senha.");
            return;
        }

        loading = true;
        try {
            const dataToSave = {
                username: userData.username,
                password_hash: userData.password,
                role: userData.role,
                ativo: userData.ativo ? 1 : 0,
                vendedor_id:
                    userData.vendedor_id === "-1"
                        ? null
                        : parseInt(userData.vendedor_id),
                data_criacao: new Date().toISOString(),
            };

            let q = queryHelper(dataToSave);
            await db.execute(
                `INSERT INTO usuarios (${q.columns}) VALUES (${q.placeholders})`,
                q.values,
            );

            toast.success("Usuário criado com sucesso!");
            goto("/usuarios");
        } catch (e: any) {
            toast.error(e.message || "Erro ao criar usuário");
            console.error(e);
        } finally {
            loading = false;
        }
    }

    onMount(() => loadVendedores());
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
                Novo Usuário
            </h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading}>
            <Save class="h-4 w-4" />
            Salvar Usuário
        </Button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-1 gap-6">
        <Card.Root class="shadow-lg border-primary/20 bg-primary/5 pb-0">
            <Card.Header>
                <Card.Title
                    class="flex items-center gap-2 text-primary font-black"
                >
                    <User class="h-6 w-6" />
                    Credenciais e Perfil
                </Card.Title>
                <Card.Description
                    >Dados de acesso e permissões do usuário.</Card.Description
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
                                placeholder="Ex: joao.silva"
                                class="font-bold uppercase tracking-tight"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label for="password"
                                >Senha de Acesso <Needed /></Label
                            >
                            <Input
                                id="password"
                                type="password"
                                bind:value={userData.password}
                                placeholder="••••••••"
                            />
                        </div>
                    </div>

                    <div
                        class="grid grid-cols-1 md:grid-cols-2 gap-6 pt-4 border-t"
                    >
                        <div class="grid gap-2">
                            <Label for="role">Nível de Acesso (Papel)</Label>
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
                            <Label for="vendedor"
                                >Vendedor Associado (Opcional)</Label
                            >
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
                                    <Select.Item value="-1">Nenhum</Select.Item>
                                    {#each vendedores as vendedor}
                                        <Select.Item value={String(vendedor.id)}
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
</div>
