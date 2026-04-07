<script lang="ts">
    //@ts-nocheck
    import * as Pagination from "@/components/ui/pagination";

    let {
        count = 0,
        perPage = 10,
        page = $bindable(1),
        class: className,
    } = $props();
</script>

<Pagination.Root {count} {perPage} bind:page class={className}>
    {#snippet children({ pages, range })}
        <div class="flex items-center justify-between w-full">
            <div class="text-sm text-muted-foreground">
                Exibindo
                <span class="font-medium">{(page - 1) * perPage + 1}</span>
                a
                <span class="font-medium">
                    {Math.min(page * perPage, count)}
                </span>
                de
                <span class="font-medium">{count}</span>
                resultados
            </div>
            <div class="flex items-center space-x-2">
                <Pagination.Content>
                    <Pagination.Item>
                        <Pagination.PrevButton />
                    </Pagination.Item>
                    {#each pages as page (page.key)}
                        {#if page.type === "ellipsis"}
                            <Pagination.Item>
                                <Pagination.Ellipsis />
                            </Pagination.Item>
                        {:else}
                            <Pagination.Item>
                                <Pagination.Link
                                    {page}
                                    isActive={range.start === page.value}
                                />
                            </Pagination.Item>
                        {/if}
                    {/each}
                    <Pagination.Item>
                        <Pagination.NextButton />
                    </Pagination.Item>
                </Pagination.Content>
            </div>
        </div>
    {/snippet}
</Pagination.Root>
