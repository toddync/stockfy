<script lang="ts">
    import { Input } from "$lib/components/ui/input";
    import { Label } from "$lib/components/ui/label";

    let {
        label = "",
        value = $bindable(),
        name = "",
        placeholder = "",
    } = $props();
</script>

<div class="flex flex-col gap-3">
    <Label for={name}>{label}:</Label>
    <Input id={name} bind:value {placeholder} />
</div>
