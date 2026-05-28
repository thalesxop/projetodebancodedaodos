INSERT INTO fornecedor (nome, cnpj, telefone, email, endereco)
VALUES
('Ambev Distribuidora', '12.345.678/0001-10', '(62) 3333-1111', 'contato@ambev.com', 'Goiânia - GO'),
('Coca-Cola Brasil', '23.456.789/0001-20', '(62) 3333-2222', 'vendas@cocacola.com', 'Aparecida de Goiânia - GO'),
('PepsiCo Distribuição', '34.567.890/0001-30', '(62) 3333-3333', 'suporte@pepsico.com', 'Anápolis - GO');

INSERT INTO categoria (nome_categoria)
VALUES
('Refrigerante'),
('Suco'),
('Água'),
('Cerveja'),
('Energético');

INSERT INTO cliente (nome, cpf_cnpj, telefone, email, endereco)
VALUES
('João Henrique Silva', '123.456.789-10', '(62) 99999-1111', 'joao@email.com', 'Goiânia - GO'),
('Mariana Costa Oliveira', '234.567.890-20', '(62) 99999-2222', 'mariana@email.com', 'Anápolis - GO'),
('Lucas Ferreira Santos', '345.678.901-30', '(62) 99999-3333', 'lucas@email.com', 'Aparecida de Goiânia - GO');


INSERT INTO produto (
    nome,
    marca,
    volume,
    preco_custo,
    preco_venda,
    estoque_atual,
    estoque_minimo,
    data_validade,
    id_fornecedor,
    id_categoria
)
VALUES
('Coca-Cola', 'Coca-Cola', '2L', 6.50, 9.90, 120, 20, '2026-12-10', 2, 1),
('Guaraná Antarctica', 'Ambev', '2L', 5.80, 8.90, 90, 15, '2026-11-15', 1, 1),
('Suco Del Valle', 'Del Valle', '1L', 4.20, 6.80, 60, 10, '2026-10-20', 2, 2),
('Água Crystal', 'Crystal', '500ml', 1.00, 2.50, 200, 30, '2027-01-05', 1, 3),
('Red Bull', 'Red Bull', '250ml', 7.50, 11.90, 40, 10, '2026-09-30', 3, 5);

INSERT INTO entrada_estoque (
    data_entrada,
    quantidade,
    valor_unitario,
    id_produto,
    id_fornecedor
)
VALUES
('2026-05-01', 50, 6.50, 1, 2),
('2026-05-02', 40, 5.80, 2, 1),
('2026-05-03', 30, 4.20, 3, 2),
('2026-05-04', 100, 1.00, 4, 1),
('2026-05-05', 20, 7.50, 5, 3);

INSERT INTO venda (
    data_venda,
    valor_total,
    id_cliente
)
VALUES
('2026-05-10', 28.70, 1),
('2026-05-11', 23.60, 2),
('2026-05-12', 35.70, 3);

INSERT INTO item_venda (
    quantidade,
    valor_unitario,
    subtotal,
    id_venda,
    id_produto
)
VALUES
(2, 9.90, 19.80, 1, 1),
(1, 8.90, 8.90, 1, 2),
(2, 11.90, 23.80, 2, 5),
(3, 9.90, 29.70, 3, 1),
(3, 2.00, 6.00, 3, 4);