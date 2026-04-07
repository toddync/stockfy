<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Badge } from "@/components/ui/badge/index";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import * as Table from "@/components/ui/table/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import type { Cliente, Pedido, PedidoItem, Vendedor } from "@/types";
    import db from "@/db/db.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Calendar from "@lucide/svelte/icons/calendar";
    import User from "@lucide/svelte/icons/user";
    import Briefcase from "@lucide/svelte/icons/briefcase";
    import Package from "@lucide/svelte/icons/package";
    import Download from "@lucide/svelte/icons/download";
    import { onMount } from "svelte";
    import jsPDF from "jspdf";
    import autoTable from "jspdf-autotable";
    import { Label } from "@/components/ui/label";
    import Id from "@/id.svelte";

    type OrderItem = PedidoItem & { codigo: string; descricao: string };

    let pedido = $state<Pedido | null>(null);
    let items = $state<Array<OrderItem>>([]);
    let cliente = $state<Cliente | null>(null);
    let vendedor = $state<Vendedor | null>(null);
    let loading = $state(true);

    const pedidoId = Id.id;

    async function load() {
        loading = true;
        try {
            const [pRes, iRes] = await Promise.all([
                db.select("SELECT * FROM pedidos WHERE id = $1 LIMIT 1", [
                    pedidoId,
                ]),
                db.select(
                    `
                    SELECT pi.*, p.descricao, p.codigo
                    FROM pedido_itens pi
                    LEFT JOIN produtos p ON pi.produto_id = p.id
                    WHERE pedido_id = $1`,
                    [pedidoId],
                ),
            ]);

            pedido = (pRes as Array<Pedido>)[0];
            items = iRes as Array<OrderItem>;

            if (pedido) {
                const [cRes, vRes] = await Promise.all([
                    db.select("SELECT * FROM clientes WHERE id = $1", [
                        pedido.cliente_id,
                    ]),
                    pedido.vendedor_id
                        ? db.select("SELECT * FROM vendedores WHERE id = $1", [
                              pedido.vendedor_id,
                          ])
                        : Promise.resolve(null),
                ]);

                cliente = (cRes as Array<Cliente>)[0];
                vendedor = vRes ? (vRes as Array<Vendedor>)[0] : null;
            }
        } catch (e: any) {
            console.error(e);
        } finally {
            loading = false;
        }
    }

    onMount(() => load());

    function formatCurrency(v: number | null) {
        return (v || 0).toLocaleString("pt-BR", {
            style: "currency",
            currency: "BRL",
        });
    }

    function formatDate(dateString: string | null) {
        if (!dateString) return "—";
        return new Date(dateString).toLocaleDateString("pt-BR");
    }

    function getStatusVariant(status: string) {
        switch (status) {
            case "faturado":
                return "bg-green-100 text-green-700 border-green-200";
            case "pendente":
                return "bg-amber-100 text-amber-700 border-amber-200";
            case "cancelado":
                return "bg-red-100 text-red-700 border-red-200";
            case "devolvido":
                return "bg-blue-100 text-blue-700 border-blue-200";
            default:
                return "bg-gray-100 text-gray-700 border-gray-200";
        }
    }

    function generatePDF() {
        if (!pedido) return;

        const doc = new jsPDF();
        const primaryColor = [22, 22, 22]; // Dark color for headers

        // Title
        doc.setFontSize(22);
        doc.setFont("helvetica", "bold");
        doc.text(`Pedido #${pedido.numero_pedido}`, 15, 20);
        
        // Status Badge-like text
        doc.setFontSize(12);
        doc.setTextColor(100);
        doc.text(`${pedido.situacao.toUpperCase()}`, 150, 20, { align: "right" });
        doc.setTextColor(0);

        // Date Info
        doc.setFontSize(10);
        doc.setFont("helvetica", "normal");
        doc.text(`Emitido em: ${formatDate(pedido.data_pedido)}`, 15, 28);
        if (pedido.data_entrega) {
            doc.text(`Previsão de Entrega: ${formatDate(pedido.data_entrega)}`, 15, 33);
        }

        // Horizontal Line
        doc.setDrawColor(200);
        doc.line(15, 38, 195, 38);

        // Client & Seller Section
        const startY = 48;
        
        // Client Column
        doc.setFontSize(11);
        doc.setFont("helvetica", "bold");
        doc.text("DADOS DO CLIENTE", 15, startY);
        doc.setFontSize(10);
        doc.setFont("helvetica", "normal");
        doc.text(cliente?.nome || "Cliente Não Identificado", 15, startY + 6);
        if (cliente) {
            const endereco = [cliente.cidade, cliente.estado].filter(Boolean).join(" - ");
            if (endereco) doc.text(endereco, 15, startY + 11);
            if (cliente.email) doc.text(cliente.email, 15, startY + 16);
            if (cliente.telefone) doc.text(cliente.telefone, 15, startY + 21);
        }

        // Seller Column
        doc.setFontSize(11);
        doc.setFont("helvetica", "bold");
        doc.text("VENDEDOR", 110, startY);
        doc.setFontSize(10);
        doc.setFont("helvetica", "normal");
        doc.text(vendedor?.nome || "Venda Direta", 110, startY + 6);

        // Items Table
        const tableBody = items.map(item => {
            const qtd = item.quantidade_saida - (item.quantidade_retorno || 0);
            const subtotal = (item.preco_unitario || 0) * qtd;
            return [
                item.codigo,
                item.descricao,
                qtd.toString(),
                formatCurrency(item.preco_unitario),
                formatCurrency(subtotal)
            ];
        });

        autoTable(doc, {
            startY: startY + 30,
            head: [['Código', 'Descrição', 'Qtd', 'V. Unit.', 'Subtotal']],
            body: tableBody,
            theme: 'striped',
            headStyles: { 
                fillColor: [30, 30, 30],
                textColor: 255,
                fontStyle: 'bold'
            },
            columnStyles: {
                0: { cellWidth: 25 }, // Código
                1: { cellWidth: 'auto' }, // Descrição
                2: { halign: 'center', cellWidth: 20 }, // Qtd
                3: { halign: 'right', cellWidth: 30 }, // Unit
                4: { halign: 'right', cellWidth: 35 }  // Subtotal
            },
            styles: { fontSize: 9, cellPadding: 3 },
        });

        // Totals Section
        const finalY = (doc as any).lastAutoTable.finalY + 10;
        const rightMargin = 195;
        
        doc.setFontSize(10);
        
        // Subtotal
        const valorBruto = pedido.valor_bruto || (pedido as any).valor_total;
        doc.text("Subtotal:", rightMargin - 40, finalY);
        doc.text(formatCurrency(valorBruto), rightMargin, finalY, { align: "right" });

        // Discount
        const discount = pedido.valor_desconto || 0;
        if (discount > 0) {
            doc.setTextColor(200, 0, 0);
            doc.text("Desconto:", rightMargin - 40, finalY + 6);
            doc.text(`-${formatCurrency(discount)}`, rightMargin, finalY + 6, { align: "right" });
            doc.setTextColor(0);
        }

        // Total
        const total = pedido.valor_liquido || ((pedido as any).valor_total - discount);
        doc.setFontSize(12);
        doc.setFont("helvetica", "bold");
        doc.text("Total:", rightMargin - 40, finalY + 14);
        doc.text(formatCurrency(total), rightMargin, finalY + 14, { align: "right" });

        // Observations if any
        if (pedido.observacoes) {
            const obsY = finalY + 25;
            doc.setFontSize(9);
            doc.setFont("helvetica", "bold");
            doc.text("Observações:", 15, obsY);
            doc.setFont("helvetica", "italic");
            doc.setFontSize(9);
            
            const splitObs = doc.splitTextToSize(pedido.observacoes, 120);
            doc.text(splitObs, 15, obsY + 5);
        }

        // Footer w/ Page numbers
        const pageCount = (doc as any).internal.getNumberOfPages();
        for(let i = 1; i <= pageCount; i++) {
            doc.setPage(i);
            doc.setFontSize(8);
            doc.setTextColor(150);
            doc.text(`Página ${i} de ${pageCount}`, 195, 290, { align: "right" });
            doc.text(`Gerado em ${new Date().toLocaleString()}`, 15, 290);
        }

        doc.save(`Pedido_${pedido.numero_pedido}.pdf`);
    }
</script>

<div class="p-6 w-full space-y-6">
    <div class="flex items-center gap-4">
        <Button variant="ghost" size="icon" onclick={() => goto("/pedidos")}>
            <ArrowLeft class="h-5 w-5" />
        </Button>
        <h1 class="text-3xl font-bold tracking-tight">Detalhes do Pedido</h1>

        {#if pedido}
            <div class="ml-auto flex gap-2">
                <Button
                    variant="outline"
                    onclick={generatePDF}
                >
                    <Download class="mr-2 h-4 w-4" />
                    PDF
                </Button>
                <Button
                    variant="outline"
                    onclick={() => {
                        Id.id = pedidoId;
                        goto(`/pedidos/id/edit`);
                    }}
                >
                    Editar Pedido
                </Button>
            </div>
        {/if}
    </div>

    {#if loading}
        <div class="flex h-[400px] items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else if pedido}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <Card.Root class="md:col-span-2">
                <Card.Header class="pb-4">
                    <div class="flex justify-between items-start">
                        <div class="space-y-1">
                            <Card.Title
                                class="text-3xl font-black text-primary"
                            >
                                #{pedido.numero_pedido}
                            </Card.Title>
                            <Card.Description class="flex items-center gap-2">
                                <Calendar class="h-4 w-4" />
                                Emitido em {formatDate(pedido.data_pedido)}
                            </Card.Description>
                        </div>
                        <Badge
                            variant="outline"
                            class={`text-sm py-1 px-3 font-bold border ${getStatusVariant(pedido.situacao)} capitalize`}
                        >
                            {pedido.situacao}
                        </Badge>
                    </div>
                </Card.Header>
                <Card.Content class="space-y-8">
                    <!-- Client and Seller Info -->
                    <div
                        class="grid grid-cols-1 md:grid-cols-2 gap-8 bg-muted/30 p-6 rounded-2xl border border-border"
                    >
                        <div class="space-y-2">
                            <div
                                class="flex items-center gap-2 text-muted-foreground text-xs uppercase font-black tracking-widest"
                            >
                                <User class="h-3 w-3 text-primary" />
                                Cliente
                            </div>
                            <p class="text-xl font-bold leading-tight">
                                {cliente?.nome || "—"}
                            </p>
                            <p class="text-sm text-muted-foreground">
                                {cliente?.cidade || ""}{cliente?.estado
                                    ? `/${cliente?.estado}`
                                    : ""}
                            </p>
                        </div>
                        <div class="space-y-2">
                            <div
                                class="flex items-center gap-2 text-muted-foreground text-xs uppercase font-black tracking-widest"
                            >
                                <Briefcase class="h-3 w-3 text-primary" />
                                Vendedor
                            </div>
                            <p class="text-xl font-bold">
                                {vendedor?.nome || "Venda Direta"}
                            </p>
                        </div>
                    </div>

                    <!-- Items Table -->
                    <div class="space-y-4">
                        <div class="flex items-center gap-2">
                            <Package class="h-5 w-5 text-primary" />
                            <h3 class="font-bold text-lg">
                                Produtos do Pedido
                            </h3>
                        </div>
                        <div
                            class="rounded-xl border border-border overflow-hidden"
                        >
                            <Table.Root>
                                <Table.Header class="bg-muted/50">
                                    <Table.Row>
                                        <Table.Head>Cód</Table.Head>
                                        <Table.Head>Descrição</Table.Head>
                                        <Table.Head class="text-center"
                                            >Qtd</Table.Head
                                        >
                                        <Table.Head class="text-right"
                                            >Unitário</Table.Head
                                        >
                                        <Table.Head class="text-right"
                                            >Subtotal</Table.Head
                                        >
                                    </Table.Row>
                                </Table.Header>
                                <Table.Body>
                                    {#each items as item}
                                        <Table.Row>
                                            <Table.Cell
                                                class="font-mono text-xs text-muted-foreground"
                                                >{item.codigo}</Table.Cell
                                            >
                                            <Table.Cell class="font-medium"
                                                >{item.descricao}</Table.Cell
                                            >
                                            <Table.Cell
                                                class="text-center font-bold"
                                            >
                                                {item.quantidade_saida -
                                                    (item.quantidade_retorno ||
                                                        0)}
                                            </Table.Cell>
                                            <Table.Cell class="text-right"
                                                >{formatCurrency(
                                                    item.preco_unitario,
                                                )}</Table.Cell
                                            >
                                            <Table.Cell
                                                class="text-right font-black text-primary"
                                            >
                                                {formatCurrency(
                                                    (item.preco_unitario || 0) *
                                                        (item.quantidade_saida -
                                                            (item.quantidade_retorno ||
                                                                0)),
                                                )}
                                            </Table.Cell>
                                        </Table.Row>
                                    {/each}
                                </Table.Body>
                            </Table.Root>
                        </div>
                    </div>

                    {#if pedido.observacoes}
                        <div class="space-y-2">
                            <Label
                                class="text-muted-foreground uppercase text-[10px] font-black tracking-wider"
                                >Observações</Label
                            >
                            <p
                                class="bg-muted/20 p-4 rounded-lg border border-border text-sm leading-relaxed italic"
                            >
                                "{pedido.observacoes}"
                            </p>
                        </div>
                    {/if}
                </Card.Content>
            </Card.Root>

            <div class="space-y-6">
                <Card.Root class="bg-primary/5 border-primary/20">
                    <Card.Header>
                        <Card.Title>Fechamento</Card.Title>
                    </Card.Header>
                    <Card.Content class="space-y-4">
                        <div class="flex justify-between text-sm">
                            <span class="text-muted-foreground"
                                >Valor Bruto</span
                            >
                            <span class="font-medium"
                                >{formatCurrency(
                                    pedido.valor_bruto ||
                                        (pedido as any).valor_total,
                                )}</span
                            >
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-muted-foreground">Desconto</span>
                            <span class="text-red-500 font-medium"
                                >-{formatCurrency(pedido.valor_desconto)}</span
                            >
                        </div>
                        <div class="border-t border-primary/20 pt-4 space-y-4">
                            <div class="flex justify-between items-center">
                                <span class="font-black text-lg"
                                    >Total Líquido</span
                                >
                                <span class="text-3xl font-black text-primary">
                                    {formatCurrency(
                                        pedido.valor_liquido ||
                                            (pedido as any).valor_total -
                                                (pedido.valor_desconto || 0),
                                    )}
                                </span>
                            </div>
                        </div>
                    </Card.Content>
                </Card.Root>

                <Card.Root>
                    <Card.Header>
                        <Card.Title>Logística</Card.Title>
                    </Card.Header>
                    <Card.Content class="space-y-4">
                        <div class="space-y-1">
                            <span
                                class="text-xs text-muted-foreground uppercase font-bold"
                                >Previsão de Entrega</span
                            >
                            <p class="font-semibold">
                                {formatDate(pedido.data_entrega)}
                            </p>
                        </div>
                        <div class="space-y-1">
                            <span
                                class="text-xs text-muted-foreground uppercase font-bold"
                                >Tipo de Pedido</span
                            >
                            <p class="font-semibold capitalize">
                                {pedido.tipo_pedido || "Venda"}
                            </p>
                        </div>
                    </Card.Content>
                </Card.Root>
            </div>
        </div>
    {:else}
        <div
            class="text-center py-20 bg-muted/20 rounded-3xl border border-dashed border-border"
        >
            <h2 class="text-2xl font-bold">Pedido não encontrado.</h2>
            <Button
                variant="link"
                onclick={() => goto("/pedidos")}
                class="mt-4"
            >
                Voltar para a lista de pedidos
            </Button>
        </div>
    {/if}
</div>
