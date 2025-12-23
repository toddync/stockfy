<script lang="ts">
    import favicon from "$lib/assets/favicon.svg";
    import AppSidebar from "$lib/components/app-sidebar.svelte";
    import * as Sidebar from "$lib/components/ui/sidebar/index.js";
    import { Toaster } from "$lib/components/ui/sonner/index.js";
    import { onMount } from "svelte";
    import "./layout.css";
    import db from "@/db/db.svelte";
    import TittleBar from "@/components/tittle-bar.svelte";

    let { children } = $props();
    let loaded = $state<boolean>(false);

    onMount(() => {
        (async () => {
            await db.init();
            loaded = true;
        })();
    });
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<Toaster richColors position="top-center" />

<TittleBar />

<main class="h-[calc(100svh-32px)]! mt-8 overflow-hidden">
    <Sidebar.Provider>
        <AppSidebar />
        <main class="flex-1 p-1 overflow-auto max-h-[calc(100svh-32px)]!">
            {#if loaded}
                {@render children?.()}
            {/if}
        </main>
    </Sidebar.Provider>
</main>
