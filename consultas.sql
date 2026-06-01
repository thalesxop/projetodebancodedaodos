SELECT
    produto.nome AS produto,
    produto.marca,
    fornecedor.nome AS fornecedor
FROM produto
INNER JOIN fornecedor
ON produto.id_fornecedor = fornecedor.id_fornecedor;

SELECT
    produto.nome AS produto,
    produto.marca,
    categoria.nome_categoria AS categoria
FROM produto
INNER JOIN categoria
ON produto.id_categoria = categoria.id_categoria;

SELECT
    cliente.nome AS cliente,
    venda.id_venda,
    venda.data_venda,
    venda.valor_total
FROM venda
INNER JOIN cliente
ON venda.id_cliente = cliente.id_cliente;

SELECT
    venda.id_venda,
    cliente.nome AS cliente,
    produto.nome AS produto,
    item_venda.quantidade,
    item_venda.valor_unitario,
    item_venda.subtotal,
    venda.data_venda
FROM item_venda
INNER JOIN venda
ON item_venda.id_venda = venda.id_venda
INNER JOIN cliente
ON venda.id_cliente = cliente.id_cliente
INNER JOIN produto
ON item_venda.id_produto = produto.id_produto;

SELECT
    entrada_estoque.id_entrada,
    entrada_estoque.data_entrada,
    produto.nome AS produto,
    fornecedor.nome AS fornecedor,
    entrada_estoque.quantidade,
    entrada_estoque.valor_unitario
FROM entrada_estoque
INNER JOIN produto
ON entrada_estoque.id_produto = produto.id_produto
INNER JOIN fornecedor
ON entrada_estoque.id_fornecedor = fornecedor.id_fornecedor;

SELECT
    SUM(valor_total) AS valor_total_vendas
FROM venda;

SELECT
    SUM(quantidade) AS quantidade_total_vendida
FROM item_venda;

SELECT
    nome,
    estoque_atual
FROM produto
ORDER BY estoque_atual DESC
LIMIT 1;

SELECT
    nome,
    estoque_atual,
    estoque_minimo
FROM produto
WHERE estoque_atual <= estoque_minimo;

SELECT
    produto.nome,
    produto.marca,
    categoria.nome_categoria
FROM produto
INNER JOIN categoria
ON produto.id_categoria = categoria.id_categoria
WHERE categoria.nome_categoria = 'Refrigerante';

SELECT
    id_venda,
    data_venda,
    valor_total
FROM venda
WHERE valor_total > 25.00;

SELECT
    produto.nome AS produto,
    SUM(item_venda.quantidade) AS total_vendido
FROM item_venda
INNER JOIN produto
ON item_venda.id_produto = produto.id_produto
GROUP BY produto.nome
ORDER BY total_vendido DESC;

SELECT
    cliente.nome AS cliente,
    COUNT(venda.id_venda) AS total_vendas
FROM venda
INNER JOIN cliente
ON venda.id_cliente = cliente.id_cliente
GROUP BY cliente.nome
ORDER BY total_vendas DESC;

SELECT
    produto.nome AS produto,
    SUM(item_venda.quantidade) AS total_vendido
FROM item_venda
INNER JOIN produto
ON item_venda.id_produto = produto.id_produto
GROUP BY produto.nome
HAVING SUM(item_venda.quantidade) > 2
ORDER BY total_vendido DESC;

SELECT
    nome,
    estoque_atual
FROM produto
WHERE estoque_atual >
(
    SELECT AVG(estoque_atual)
    FROM produto
);

SELECT
    cliente.nome AS cliente,
    venda.valor_total
FROM venda
INNER JOIN cliente
ON venda.id_cliente = cliente.id_cliente
WHERE venda.valor_total >
(
    SELECT AVG(valor_total)
    FROM venda
);

SELECT
    nome,
    marca,
    preco_venda
FROM produto
WHERE preco_venda >
(
    SELECT AVG(preco_venda)
    FROM produto
);

SELECT
    produto.nome AS produto,
    produto.marca,
    SUM(item_venda.quantidade) AS quantidade_vendida,
    SUM(item_venda.subtotal) AS valor_total_vendido
FROM item_venda
INNER JOIN produto
ON item_venda.id_produto = produto.id_produto
GROUP BY produto.nome, produto.marca
ORDER BY valor_total_vendido DESC;

SELECT
    cliente.nome AS cliente,
    COUNT(venda.id_venda) AS total_compras,
    SUM(venda.valor_total) AS valor_movimentado
FROM venda
INNER JOIN cliente
ON venda.id_cliente = cliente.id_cliente
GROUP BY cliente.nome
ORDER BY valor_movimentado DESC;

SELECT
    nome AS produto,
    marca,
    estoque_atual,
    estoque_minimo,
    CASE
        WHEN estoque_atual <= estoque_minimo THEN 'Estoque Baixo'
        ELSE 'Estoque Adequado'
    END AS situacao_estoque
FROM produto
ORDER BY estoque_atual ASC;