<script lang="ts">
    import { goto } from "$app/navigation";
    import { page } from "$app/state";
    import { Button } from "@/components/ui/button/index";
    import * as Card from "@/components/ui/card/index.js";
    import { Input } from "@/components/ui/input/index";
    import { Label } from "@/components/ui/label/index";
    import * as Select from "@/components/ui/select/index.js";
    import { Spinner } from "@/components/ui/spinner";
    import * as Table from "@/components/ui/table/index.js";
    import Needed from "@/components/needed.svelte";
    import db, { queryHelper } from "@/db/db.svelte";
    import Id from "@/id.svelte";
    import ArrowLeft from "@lucide/svelte/icons/arrow-left";
    import Layers from "@lucide/svelte/icons/layers";
    import Plus from "@lucide/svelte/icons/plus";
    import Save from "@lucide/svelte/icons/save";
    import TagsIcon from "@lucide/svelte/icons/tags";
    import Trash2 from "@lucide/svelte/icons/trash-2";
    import { onMount } from "svelte";
    import { toast } from "svelte-sonner";

    const id = Id.id;
    let loading = $state(true);
    let saving = $state(false);

    let grupos = $state<Array<{ id: number; descricao: string }>>([]);
    let allTags = $state<Array<{ id: number; nome: string }>>([]);

    let produtoData = $state({
        codigo: "",
        descricao: "",
        grupo_id: "-1",
        preco_custo: 0,
        preco_venda: 0,
        preco_venda_b: 0,
        preco_minimo: 0,
    });

    let variacoes = $state<
        Array<{
            id?: number;
            sku: string;
            tamanho: string;
            cor: string;
            estoque_atual: number;
        }>
    >([]);
    let selectedTagIds = $state<Array<number>>([]);

    let newVariation = $state({
        sku: "",
        tamanho: "",
        cor: "",
        estoque_atual: 0,
    });

    async function load() {
        loading = true;
        try {
            const [pRes, vRes, tRes, gRes, allTRes] = await Promise.all([
                db.select("SELECT * FROM produtos WHERE id = $1", [id]) as any,
                db.select(
                    "SELECT * FROM produto_variacoes WHERE produto_id = $1 ORDER BY id ASC",
                    [id],
                ) as any,
                db.select(
                    "SELECT tag_id FROM produto_tags WHERE produto_id = $1",
                    [id],
                ) as any,
                db.select(
                    "SELECT id, descricao FROM produto_grupos ORDER BY descricao ASC",
                    [],
                ) as any,
                db.select(
                    "SELECT id, nome FROM tags ORDER BY nome ASC",
                    [],
                ) as any,
            ]);

            // Handling group table name correction if needed (usually it's produto_grupos based on schema.ts)
            let finalGrupos = gRes;
            if (!gRes || gRes.length === 0) {
                finalGrupos = (await db.select(
                    "SELECT id, descricao FROM produto_grupos ORDER BY descricao ASC",
                    [],
                )) as any;
            }
            grupos = finalGrupos;

            if (pRes && pRes[0]) {
                const p = pRes[0];
                produtoData = {
                    codigo: p.codigo,
                    descricao: p.descricao,
                    grupo_id: p.grupo_id ? String(p.grupo_id) : "-1",
                    preco_custo: p.preco_custo || 0,
                    preco_venda: p.preco_venda || 0,
                    preco_venda_b: p.preco_venda_b || 0,
                    preco_minimo: p.preco_minimo || 0,
                };
            } else {
                goto("/produtos");
            }

            variacoes = vRes;
            selectedTagIds = tRes.map((t: any) => t.tag_id);
            allTags = allTRes;
        } catch (e: any) {
            console.error("Critical error loading data:", e);
            toast.error("Erro ao carregar dados do produto.");
        } finally {
            loading = false;
        }
    }

    function addVariation() {
        if (!newVariation.sku && !newVariation.tamanho && !newVariation.cor) {
            toast.error("Preencha pelo menos um campo da variação.");
            return;
        }
        variacoes.push({ ...newVariation });
        newVariation = { sku: "", tamanho: "", cor: "", estoque_atual: 0 };
    }

    function removeVariation(index: number) {
        variacoes.splice(index, 1);
    }

    function toggleTag(tagId: number) {
        if (selectedTagIds.includes(tagId)) {
            selectedTagIds = selectedTagIds.filter((id) => id !== tagId);
        } else {
            selectedTagIds.push(tagId);
        }
    }

    async function save() {
        if (!produtoData.codigo || !produtoData.descricao) {
            toast.error("Código e descrição são obrigatórios.");
            return;
        }

        if (variacoes.length === 0) {
            toast.error("O produto deve possuir pelo menos uma variação.");
            return;
        }

        saving = true;
        try {
            const dataToUpdate = {
                codigo: produtoData.codigo,
                descricao: produtoData.descricao,
                grupo_id:
                    produtoData.grupo_id === "-1"
                        ? null
                        : parseInt(produtoData.grupo_id),
                preco_custo: produtoData.preco_custo || 0,
                preco_venda: produtoData.preco_venda || 0,
                preco_venda_b: produtoData.preco_venda_b || 0,
                preco_minimo: produtoData.preco_minimo || 0,
                data_atualizacao: new Date().toISOString(),
            };

            let q = queryHelper(dataToUpdate);
            await db.execute(
                `UPDATE produtos SET ${q.setClauses} WHERE id = ${id}`,
                q.values,
            );

            // Sync Variations: Delete and re-insert for simplicity
            // NOTE: In a production app with orders, deleting variations could break FKs.
            // But based on the schema and objective, we'll follow the "sync" pattern.
            await db.execute(
                "DELETE FROM produto_variacoes WHERE produto_id = $1",
                [id],
            );
            for (const v of variacoes) {
                const vToSave = {
                    produto_id: parseInt(id),
                    sku: v.sku || null,
                    tamanho: v.tamanho || null,
                    cor: v.cor || null,
                    estoque_atual: v.estoque_atual || 0,
                };
                let qv = queryHelper(vToSave);
                await db.execute(
                    `INSERT INTO produto_variacoes (${qv.columns}) VALUES (${qv.placeholders})`,
                    qv.values,
                );
            }

            // Sync Tags
            await db.execute("DELETE FROM produto_tags WHERE produto_id = $1", [
                id,
            ]);
            for (const tagId of selectedTagIds) {
                await db.execute(
                    "INSERT INTO produto_tags (produto_id, tag_id) VALUES ($1, $2)",
                    [id, tagId],
                );
            }

            toast.success("Produto atualizado com sucesso!");
            Id.id = id;
            goto(`/produtos/id`);
        } catch (e: any) {
            toast.error(e.message || "Erro ao atualizar produto");
            console.error(e);
        } finally {
            saving = false;
        }
    }

    onMount(() => load());
</script>

<div class="p-6 space-y-6 w-full">
    <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
            <Button
                variant="ghost"
                size="icon"
                onclick={() => goto("/produtos")}
            >
                <ArrowLeft class="h-5 w-5" />
            </Button>
            <h1 class="text-3xl font-bold tracking-tight">Editar Produto</h1>
        </div>
        <Button onclick={save} class="gap-2 px-6" disabled={loading || saving}>
            <Save class="h-4 w-4" />
            Salvar Alterações
        </Button>
    </div>

    {#if loading}
        <div class="flex h-100 items-center justify-center">
            <Spinner class="h-12 w-12" />
        </div>
    {:else}
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div class="lg:col-span-2 space-y-6">
                <!-- Basic Info -->
                <Card.Root
                    class="shadow-sm border-primary/20 bg-primary/5 pb-0"
                >
                    <Card.Header>
                        <Card.Title class="text-primary font-black"
                            >Informações do Produto</Card.Title
                        >
                        <Card.Description
                            >Dados cadastrais principais.</Card.Description
                        >
                    </Card.Header>
                    <Card.Content
                        class="space-y-6 bg-background rounded-b-xl border-t p-8"
                    >
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div class="grid gap-2">
                                <Label for="codigo">Código <Needed /></Label>
                                <Input
                                    id="codigo"
                                    bind:value={produtoData.codigo}
                                    class="font-mono font-bold uppercase"
                                />
                            </div>
                            <div class="grid gap-2">
                                <Label for="grupo">Grupo</Label>
                                <Select.Root
                                    type="single"
                                    bind:value={produtoData.grupo_id}
                                >
                                    <Select.Trigger class="w-full">
                                        {grupos.find(
                                            (g) =>
                                                String(g.id) ===
                                                produtoData.grupo_id,
                                        )?.descricao || "Selecione o grupo..."}
                                    </Select.Trigger>
                                    <Select.Content>
                                        <Select.Item value="-1"
                                            >Selecione o grupo...</Select.Item
                                        >
                                        {#each grupos as grupo}
                                            <Select.Item
                                                value={String(grupo.id)}
                                                >{grupo.descricao}</Select.Item
                                            >
                                        {/each}
                                    </Select.Content>
                                </Select.Root>
                            </div>
                        </div>
                        <div class="grid gap-2">
                            <Label for="descricao">Descrição <Needed /></Label>
                            <Input
                                id="descricao"
                                bind:value={produtoData.descricao}
                                class="text-lg font-semibold"
                            />
                        </div>
                    </Card.Content>
                </Card.Root>

                <!-- Variations -->
                <Card.Root class="shadow-sm border-t-4 border-t-primary">
                    <Card.Header>
                        <Card.Title class="flex items-center gap-2">
                            <Layers class="h-6 w-6 text-primary" />
                            Variações de SKU e Estoque
                        </Card.Title>
                        <Card.Description
                            >Gerencie tamanhos, cores e o estoque individual de
                            cada item.</Card.Description
                        >
                    </Card.Header>
                    <Card.Content class="space-y-6 p-8">
                        <!-- Add Variation Form -->
                        <div
                            class="grid grid-cols-1 md:grid-cols-4 gap-4 items-end bg-muted/40 p-5 rounded-2xl border border-dashed border-primary/20"
                        >
                            <div class="grid gap-2">
                                <Label>SKU</Label>
                                <Input
                                    bind:value={newVariation.sku}
                                    placeholder="Opcional"
                                    class="bg-background font-mono text-xs"
                                />
                            </div>
                            <div class="grid gap-2">
                                <Label>Tamanho</Label>
                                <Input
                                    bind:value={newVariation.tamanho}
                                    placeholder="Ex: P, M, G"
                                    class="bg-background"
                                />
                            </div>
                            <div class="grid gap-2">
                                <Label>Cor</Label>
                                <Input
                                    bind:value={newVariation.cor}
                                    placeholder="Ex: Azul"
                                    class="bg-background"
                                />
                            </div>
                            <div class="grid gap-2">
                                <Label>Estoque</Label>
                                <Input
                                    type="number"
                                    bind:value={newVariation.estoque_atual}
                                    class="bg-background"
                                />
                            </div>
                            <div class="md:col-span-4 flex justify-end">
                                <Button
                                    variant="secondary"
                                    onclick={addVariation}
                                    class="gap-2"
                                >
                                    <Plus class="h-4 w-4" />
                                    Adicionar Variação
                                </Button>
                            </div>
                        </div>

                        <Table.Root>
                            <Table.Header>
                                <Table.Row class="bg-muted/50">
                                    <Table.Head>SKU</Table.Head>
                                    <Table.Head>Tamanho</Table.Head>
                                    <Table.Head>Cor</Table.Head>
                                    <Table.Head class="text-right"
                                        >Estoque</Table.Head
                                    >
                                    <Table.Head class="w-10"></Table.Head>
                                </Table.Row>
                            </Table.Header>
                            <Table.Body>
                                {#each variacoes as varia, i}
                                    <Table.Row>
                                        <Table.Cell class="font-mono text-xs"
                                            >{varia.sku || "—"}</Table.Cell
                                        >
                                        <Table.Cell
                                            >{varia.tamanho || "—"}</Table.Cell
                                        >
                                        <Table.Cell
                                            >{varia.cor || "—"}</Table.Cell
                                        >
                                        <Table.Cell
                                            class="text-right font-black text-primary"
                                            >{varia.estoque_atual}</Table.Cell
                                        >
                                        <Table.Cell>
                                            <Button
                                                variant="ghost"
                                                size="icon"
                                                onclick={() =>
                                                    removeVariation(i)}
                                                class="hover:text-red-500"
                                            >
                                                <Trash2 class="h-4 w-4" />
                                            </Button>
                                        </Table.Cell>
                                    </Table.Row>
                                {:else}
                                    <Table.Row>
                                        <Table.Cell
                                            colspan={5}
                                            class="text-center py-10 text-muted-foreground italic"
                                            >Nenhuma variação definida.</Table.Cell
                                        >
                                    </Table.Row>
                                {/each}
                            </Table.Body>
                        </Table.Root>
                    </Card.Content>
                </Card.Root>
            </div>

            <div class="space-y-6">
                <!-- Prices Sidebar -->
                <Card.Root
                    class="shadow-md border-emerald-500/20 bg-emerald-500/5"
                >
                    <Card.Header>
                        <Card.Title class="text-emerald-700 font-bold"
                            >Precificação</Card.Title
                        >
                    </Card.Header>
                    <Card.Content class="space-y-4">
                        <div class="grid gap-2">
                            <Label>Preço de Custo</Label>
                            <Input
                                type="number"
                                step="0.01"
                                bind:value={produtoData.preco_custo}
                                class="font-bold text-emerald-600"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label>Preço Venda A</Label>
                            <Input
                                type="number"
                                step="0.01"
                                bind:value={produtoData.preco_venda}
                                class="font-black text-primary"
                            />
                        </div>
                        <div class="grid gap-2">
                            <Label>Preço Venda B</Label>
                            <Input
                                type="number"
                                step="0.01"
                                bind:value={produtoData.preco_venda_b}
                                class="font-black text-primary"
                            />
                        </div>
                        <div class="grid gap-2 border-t pt-4 mt-4">
                            <Label>Preço Mínimo</Label>
                            <Input
                                type="number"
                                step="0.01"
                                bind:value={produtoData.preco_minimo}
                                class="font-bold text-orange-600"
                            />
                        </div>
                    </Card.Content>
                </Card.Root>

                <!-- Tags Sidebar -->
                <Card.Root class="shadow-sm">
                    <Card.Header>
                        <Card.Title class="flex items-center gap-2">
                            <TagsIcon class="h-5 w-5 text-primary" />
                            Categorias (Tags)
                        </Card.Title>
                    </Card.Header>
                    <Card.Content>
                        <div class="flex flex-wrap gap-2">
                            {#each allTags as tag (tag.id)}
                                <button
                                    class="px-3 py-1.5 rounded-full text-xs font-semibold transition-all border
                                        {selectedTagIds.includes(tag.id)
                                        ? 'bg-primary/5 text-primary border-primary/20 shadow-sm scale-105'
                                        : 'bg-accent-foreground/5 text-accent-foreground  border-accent-foreground/20'}"
                                    onclick={() => toggleTag(tag.id)}
                                >
                                    {tag.nome}
                                </button>
                            {:else}
                                <p class="text-xs text-muted-foreground italic">
                                    Nenhuma tag cadastrada no sistema.
                                </p>
                            {/each}
                        </div>
                    </Card.Content>
                </Card.Root>
            </div>
        </div>
    {/if}
</div>
