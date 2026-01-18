<script lang="ts">
    import { Input } from "@/components/ui/input";
    import { Label } from "@/components/ui/label";

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
