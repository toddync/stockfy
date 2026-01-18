<script lang="ts">
    import * as Tooltip from "@/components/ui/tooltip";
</script>

<Tooltip.Provider>
    <Tooltip.Root>
        <Tooltip.Trigger>
            <i class="inline-block my-auto text-red-500">*</i>
        </Tooltip.Trigger>
        <Tooltip.Content>Campo obrigatório</Tooltip.Content>
    </Tooltip.Root>
</Tooltip.Provider>
