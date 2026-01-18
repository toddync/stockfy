<script lang="ts">
    import { ChartContainer, ChartTooltip } from "@/components/ui/chart";
    import { Chart, Svg, Axis, Bars, Group } from "layerchart";

    let { data } = $props();

    const chartConfig = {
        revenue: {
            label: "Receita",
            color: "var(--primary)",
        },
    } as const;

    function formatCurrency(value: number) {
        return value.toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }
</script>

<div class="h-full w-full hidden">
    {#if data.length > 0}
        <ChartContainer config={chartConfig} class="h-full w-full">
            <Chart
                {data}
                x="month"
                y="revenue"
                padding={{ top: 10, bottom: 20, left: 0, right: 0 }}
            >
                <Svg>
                    <Axis
                        placement="bottom"
                        grid={{
                            stroke: "var(--border)",
                            strokeDasharray: "4",
                        }}
                        labelProps={{
                            class: "fill-muted-foreground font-bold text-[10px]",
                        }}
                    />
                    <Group class="bars">
                        <Bars radius={4} class="fill-primary" />
                    </Group>
                </Svg>
                <ChartTooltip labelFormatter={(v) => `Período: ${v}`}>
                    {#snippet formatter({ value })}
                        <span class="font-bold text-primary"
                            >{formatCurrency(Number(value))}</span
                        >
                    {/snippet}
                </ChartTooltip>
            </Chart>
        </ChartContainer>
    {:else}
        <div
            class="w-full h-full flex items-center justify-center text-muted-foreground italic"
        >
            Sem dados históricos disponíveis
        </div>
    {/if}
</div>
