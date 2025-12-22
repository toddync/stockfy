<script lang="ts">
    import { goto } from "$app/navigation";
    import * as Card from "$lib/components/ui/card/index.js";
    import { Button } from "$lib/components/ui/button/index";
    import { Input } from "$lib/components/ui/input/index";
    import { Label } from "$lib/components/ui/label/index";
    import Boxes from "@lucide/svelte/icons/boxes";
    import { toast } from "svelte-sonner";

    let username = $state("");
    let password = $state("");
    let isLoading = $state(false);

    async function handleLogin(e: Event) {
        e.preventDefault();
        isLoading = true;

        // Mock API call based on old project
        setTimeout(() => {
            if (username === "admin" && password === "admin") {
                toast.success("Login bem-sucedido!");
                goto("/pedidos"); // Redirect to a valid page in the new project
            } else {
                toast.error("Usuário ou senha inválidos.");
            }
            isLoading = false;
        }, 1000);
    }
</script>

<div
    class="flex min-h-screen items-center justify-center bg-muted/40 px-4 py-12 sm:px-6 lg:px-8"
>
    <div class="w-full max-w-md space-y-8">
        <div class="flex flex-col items-center justify-center text-center">
            <div
                class="flex h-16 w-16 items-center justify-center rounded-full bg-primary/10 mb-4"
            >
                <Boxes class="h-10 w-10 text-primary" />
            </div>
            <h2 class="text-4xl font-extrabold tracking-tight text-foreground">
                Stock<span class="text-primary/80">fy</span>
            </h2>
            <p class="mt-2 text-sm text-muted-foreground">
                Bem-vindo de volta! Por favor, faça login em sua conta.
            </p>
        </div>

        <Card.Root
            class="border-none shadow-2xl bg-background/60 backdrop-blur-xl"
        >
            <Card.Header class="space-y-1">
                <Card.Title class="text-2xl font-bold">Login</Card.Title>
                <Card.Description
                    >Digite suas credenciais para acessar o painel.</Card.Description
                >
            </Card.Header>
            <Card.Content>
                <form onsubmit={handleLogin} class="space-y-4">
                    <div class="space-y-2">
                        <Label for="username">Usuário</Label>
                        <Input
                            id="username"
                            type="text"
                            placeholder="admin"
                            bind:value={username}
                            required
                            class="bg-background/50"
                        />
                    </div>
                    <div class="space-y-2">
                        <div class="flex items-center justify-between">
                            <Label for="password">Senha</Label>
                            <a
                                href="#"
                                class="text-xs text-primary hover:underline"
                                >Esqueceu a senha?</a
                            >
                        </div>
                        <Input
                            id="password"
                            type="password"
                            placeholder="••••••••"
                            bind:value={password}
                            required
                            class="bg-background/50"
                        />
                    </div>
                    <Button
                        type="submit"
                        class="w-full mt-6"
                        disabled={isLoading}
                    >
                        {#if isLoading}
                            Entrando...
                        {:else}
                            Entrar
                        {/if}
                    </Button>
                </form>
            </Card.Content>
            <Card.Footer class="flex flex-col border-t p-6 bg-muted/20">
                <p class="text-xs text-center text-muted-foreground">
                    Ao entrar, você concorda com nossos <br />
                    <a href="#" class="text-primary hover:underline"
                        >Termos de Serviço</a
                    >
                    e
                    <a href="#" class="text-primary hover:underline"
                        >Política de Privacidade</a
                    >.
                </p>
            </Card.Footer>
        </Card.Root>
    </div>
</div>

<style>
    :global(body) {
        background: radial-gradient(
                circle at top left,
                hsl(var(--primary) / 0.05),
                transparent
            ),
            radial-gradient(
                circle at bottom right,
                hsl(var(--primary) / 0.05),
                transparent
            );
        background-attachment: fixed;
    }
</style>
