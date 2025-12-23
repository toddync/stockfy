<script lang="ts">
    import { goto } from "$app/navigation";
    import * as Sidebar from "$lib/components/ui/sidebar/index.js";
    import Boxes from "@lucide/svelte/icons/boxes";
    import Package from "@lucide/svelte/icons/package";
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
    import ShieldUser from "@lucide/svelte/icons/shield-user";
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

                <PathBtn path="/solicitacoes">
                    <FileText /> Solicitações
                </PathBtn>

                <PathBtn path="/residuos">
                    <Recycle /> Resíduos
                </PathBtn>

                <PathBtn path="/permissoes">
                    <ShieldCheck /> Permissões
                </PathBtn>

                <PathBtn path="/etiquetas">
                    <Tags /> Etiquetas
                </PathBtn>

                <PathBtn path="/usuario-permissoes">
                    <ShieldUser /> Usuários/Permissões
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
    <Sidebar.Footer />
</Sidebar.Root>
