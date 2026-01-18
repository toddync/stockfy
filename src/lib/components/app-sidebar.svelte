<script lang="ts">
    import { goto } from "$app/navigation";
    import { auth } from "@/auth.svelte";
    import * as Sidebar from "@/components/ui/sidebar/index.js";
    import Boxes from "@lucide/svelte/icons/boxes";
    import DolarSign from "@lucide/svelte/icons/dollar-sign";
    import HandBag from "@lucide/svelte/icons/handbag";
    import LogOut from "@lucide/svelte/icons/log-out";
    import MapPin from "@lucide/svelte/icons/map-pin";
    import Package from "@lucide/svelte/icons/package";
    import Route from "@lucide/svelte/icons/route";
    import ShoppingBag from "@lucide/svelte/icons/shopping-bag";
    import Tags from "@lucide/svelte/icons/tags";
    import Truck from "@lucide/svelte/icons/truck";
    import Undo2 from "@lucide/svelte/icons/undo-2";
    import Users from "@lucide/svelte/icons/users";
    import Wallet from "@lucide/svelte/icons/wallet";
    import PathBtn from "./path-btn.svelte";
</script>

<Sidebar.Root
    variant="floating"
    collapsible="icon"
    class="mt-8 h-[calc(100svh-32px)]!"
>
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
            <Sidebar.Menu class="[&_svg]:stroke-3!">
                <PathBtn path="/clientes">
                    <Users /> Clientes
                </PathBtn>

                <PathBtn path="/vendedores">
                    <DolarSign /> Vendedores
                </PathBtn>

                <PathBtn path="/contas">
                    <Wallet /> Financeiro
                </PathBtn>

                <PathBtn path="/fornecedores">
                    <Truck /> Fornecedores
                </PathBtn>

                <PathBtn path="/produto-grupos">
                    <Boxes /> Grupos
                </PathBtn>

                <PathBtn path="/compras">
                    <ShoppingBag /> Compras
                </PathBtn>

                <PathBtn path="/pedidos">
                    <HandBag /> Pedidos
                </PathBtn>

                <PathBtn path="/devolucoes">
                    <Undo2 /> Devoluções
                </PathBtn>

                <PathBtn path="/pracas">
                    <MapPin /> Praças
                </PathBtn>

                <PathBtn path="/etiquetas">
                    <Tags /> Tags
                </PathBtn>

                <PathBtn path="/produtos">
                    <Package /> Produtos
                </PathBtn>

                <PathBtn path="/usuarios">
                    <Users /> Usuários
                </PathBtn>

                <PathBtn path="/rotas">
                    <Route /> Rotas
                </PathBtn>
            </Sidebar.Menu>
        </Sidebar.Group>
    </Sidebar.Content>
    <Sidebar.Footer>
        <Sidebar.Menu>
            <Sidebar.MenuItem>
                <Sidebar.MenuButton
                    onclick={() => auth.logout()}
                    class="cursor-pointer text-red-500 hover:text-red-600 hover:bg-red-500/10"
                >
                    <LogOut />
                    <span>Sair</span>
                </Sidebar.MenuButton>
            </Sidebar.MenuItem>
        </Sidebar.Menu>
    </Sidebar.Footer>
</Sidebar.Root>
