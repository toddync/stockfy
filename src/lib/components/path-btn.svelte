<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import * as Sidebar from "@/components/ui/sidebar/index.js";

    let { path = "", children } = $props();
</script>

<Sidebar.MenuItem>
    <Sidebar.MenuButton
        class="font-bold cursor-pointer {page.url.pathname.includes(path) &&
            'bg-accent'}"
        onclick={() => goto(path)}
    >
        {@render children?.()}
    </Sidebar.MenuButton>
</Sidebar.MenuItem>
