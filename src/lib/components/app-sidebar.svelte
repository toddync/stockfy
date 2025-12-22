<script lang="ts">
    import { goto } from "$app/navigation";
    import * as Sidebar from "$lib/components/ui/sidebar/index.js";
    import Boxes from "@lucide/svelte/icons/boxes";
    import DolarSign from "@lucide/svelte/icons/dollar-sign";
    import FileText from "@lucide/svelte/icons/file-text";
    import HandBag from "@lucide/svelte/icons/handbag";
    import MapPin from "@lucide/svelte/icons/map-pin";
    import Recycle from "@lucide/svelte/icons/recycle";
    import Route from "@lucide/svelte/icons/route";
    import ShieldCheck from "@lucide/svelte/icons/shield-check";
    import ShoppingBag from "@lucide/svelte/icons/shopping-bag";
    import Tags from "@lucide/svelte/icons/tags";
    import Truck from "@lucide/svelte/icons/truck";
    import Undo2 from "@lucide/svelte/icons/undo-2";
    import UserCog from "@lucide/svelte/icons/user-cog";
    import Users from "@lucide/svelte/icons/users";
    import Wallet from "@lucide/svelte/icons/wallet";

    let { toggle } = Sidebar.useSidebar();
</script>

<Sidebar.Root variant="floating" collapsible="icon">
    <Sidebar.Header>
        <Sidebar.Menu>
            <Sidebar.MenuItem>
                <Sidebar.MenuButton
                    size="lg"
                    class="text-2xl font-bold cursor-pointer"
                    onclick={() => goto("/")}
                >
                    <Boxes class="stroke-primary size-7!" />
                    <span class="flex gap-0">
                        Stock
                        <span class="text-primary/80">fy</span>
                    </span>
                </Sidebar.MenuButton>
            </Sidebar.MenuItem>
        </Sidebar.Menu>
    </Sidebar.Header>
    <Sidebar.Separator />
    <Sidebar.Content>
        <Sidebar.Group>
            <Sidebar.Menu>
                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("clientes")}
                    >
                        <Users class="stroke-3!" /> Clientes
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("vendedores")}
                    >
                        <DolarSign class="stroke-3!" /> Vendedores
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("contas")}
                    >
                        <Wallet class="stroke-3!" /> Financeiro
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("fornecedores")}
                    >
                        <Truck class="stroke-3!" /> Fornecedores
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("produto-grupos")}
                    >
                        <Boxes class="stroke-3!" /> Grupos
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("compras")}
                    >
                        <ShoppingBag class="stroke-3!" /> Compras
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("pedidos")}
                    >
                        <HandBag class="stroke-3!" /> Pedidos
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("devolucoes")}
                    >
                        <Undo2 class="stroke-3!" /> Devoluções
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("pracas")}
                    >
                        <MapPin class="stroke-3!" /> Praças
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("solicitacoes")}
                    >
                        <FileText class="stroke-3!" /> Solicitações
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("residuos")}
                    >
                        <Recycle class="stroke-3!" /> Resíduos
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("permissoes")}
                    >
                        <ShieldCheck class="stroke-3!" /> Permissões
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("etiquetas")}
                    >
                        <Tags class="stroke-3!" /> Etiquetas
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer whitespace-nowrap"
                        onclick={() => goto("usuario-permissoes")}
                    >
                        <UserCog class="stroke-3!" /> Usuários/Permissões
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("produtos")}
                    >
                        <Boxes class="stroke-3!" /> Produtos
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("usuarios")}
                    >
                        <Users class="stroke-3!" /> Usuários
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>

                <Sidebar.MenuItem>
                    <Sidebar.MenuButton
                        class="font-bold cursor-pointer"
                        onclick={() => goto("rotas")}
                    >
                        <Route class="stroke-3!" /> Rotas
                    </Sidebar.MenuButton>
                </Sidebar.MenuItem>
            </Sidebar.Menu>
        </Sidebar.Group>
    </Sidebar.Content>
    <Sidebar.Footer />
</Sidebar.Root>
