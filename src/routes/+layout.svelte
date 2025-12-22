<script lang="ts">
    import favicon from "$lib/assets/favicon.svg";
    import AppSidebar from "$lib/components/app-sidebar.svelte";
    import * as Sidebar from "$lib/components/ui/sidebar/index.js";
    import { Toaster } from "$lib/components/ui/sonner/index.js";
    import { onMount } from "svelte";
    import "./layout.css";
    import db from "@/db/db.svelte";

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

<Sidebar.Provider>
    <AppSidebar />
    <main class="flex-1 m-1">
        {#if loaded}
            {@render children?.()}
        {/if}
    </main>
</Sidebar.Provider>
