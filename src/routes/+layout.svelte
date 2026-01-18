<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/stores";
    import favicon from "@/assets/favicon.svg";
    import { auth } from "@/auth.svelte";
    import AppSidebar from "@/components/app-sidebar.svelte";
    import * as Sidebar from "@/components/ui/sidebar/index.js";
    import { Toaster } from "@/components/ui/sonner/index.js";
    import TittleBar from "@/components/tittle-bar.svelte";
    import db from "@/db/db.svelte";
    import { onMount } from "svelte";
    import "./layout.css";
    import { Spinner } from "@/components/ui/spinner";

    let { children } = $props();
    let loaded = $state<boolean>(false);

    onMount(() => {
        (async () => {
            await db.init();
            await auth.init();
            loaded = true;
        })();
    });

    $effect(() => {
        if (!loaded) return;

        if (!auth.user && $page.url.pathname !== "/login") {
            goto("/login");
        } else if (auth.user && $page.url.pathname === "/login") {
            goto("/");
        }
    });
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<Toaster richColors position="top-center" />

<TittleBar />

<main class="h-[calc(100svh-32px)]! mt-8 overflow-hidden">
    {#if loaded}
        {#if auth.user}
            <Sidebar.Provider>
                <AppSidebar />
                <main
                    class="flex-1 p-1 overflow-auto max-h-[calc(100svh-32px)]!"
                >
                    {@render children?.()}
                </main>
            </Sidebar.Provider>
        {:else}
            <main class="flex-1 overflow-auto max-h-[calc(100svh-32px)]!">
                {@render children?.()}
            </main>
        {/if}
    {:else}
        <div class="h-full w-full flex items-center justify-center">
            <Spinner />
        </div>
    {/if}
</main>
