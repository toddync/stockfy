<script>
    import X from "@lucide/svelte/icons/x";
    import LaptopMinimal from "@lucide/svelte/icons/laptop-minimal";
    import Minus from "@lucide/svelte/icons/minus";
    import { getCurrentWindow } from "@tauri-apps/api/window";
    import { onMount } from "svelte";
    import Button from "./ui/button/button.svelte";

    let apw = $state();

    onMount(() => {
        apw = getCurrentWindow();
    });
</script>

<div
    data-tauri-drag-region
    class="w-svw h-8 border-b bg-accent flex fixed top-0 z-100"
>
    <div
        class="ml-auto my-auto h-min flex gap-2 px-3 select-none group [&_svg]:stroke-foreground [&_svg]:stroke-3 *:cursor-pointer *:hover:bg-primary/50!"
    >
        <Button
            variant="ghost"
            size="icon-sm"
            onclick={() => {
                apw.minimize();
            }}
        >
            <Minus />
        </Button>

        <Button
            variant="ghost"
            size="icon-sm"
            onclick={() => {
                apw.toggleMaximize();
            }}
        >
            <LaptopMinimal class="rotate-180" />
        </Button>

        <Button
            variant="ghost"
            size="icon-sm"
            onclick={() => {
                apw.close();
            }}
        >
            <X />
        </Button>
    </div>
</div>
