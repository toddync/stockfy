export default [
    `ALTER TABLE clientes ADD COLUMN vendedor_id INTEGER REFERENCES vendedores(id) ON DELETE SET NULL;`,
];
