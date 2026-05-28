CREATE TABLE fornecedor (
    id_fornecedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
);

CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    volume VARCHAR(20) NOT NULL,
    preco_custo NUMERIC(10,2) NOT NULL CHECK (preco_custo > 0),
    preco_venda NUMERIC(10,2) NOT NULL CHECK (preco_venda > 0),
    estoque_atual INTEGER NOT NULL CHECK (estoque_atual >= 0),
    estoque_minimo INTEGER NOT NULL CHECK (estoque_minimo >= 0),
    data_validade DATE NOT NULL,
    id_fornecedor INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,
    
    CONSTRAINT fk_produto_fornecedor
        FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor (id_fornecedor),
        
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria (id_categoria)
);

CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
);

CREATE TABLE entrada_estoque (
    id_entrada SERIAL PRIMARY KEY,
    data_entrada DATE NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    valor_unitario NUMERIC(10,2) NOT NULL CHECK (valor_unitario > 0),
    id_produto INTEGER NOT NULL,
    id_fornecedor INTEGER NOT NULL,

    CONSTRAINT fk_entrada_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto),

    CONSTRAINT fk_entrada_fornecedor
        FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor (id_fornecedor)
);

CREATE TABLE venda (
    id_venda SERIAL PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL CHECK (valor_total >= 0),
    id_cliente INTEGER NOT NULL,

    CONSTRAINT fk_venda_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente)
);

CREATE TABLE item_venda (
    id_item_venda SERIAL PRIMARY KEY,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    valor_unitario NUMERIC(10,2) NOT NULL CHECK (valor_unitario > 0),
    subtotal NUMERIC(10,2) NOT NULL CHECK (subtotal >= 0),
    id_venda INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,

    CONSTRAINT fk_item_venda_venda
        FOREIGN KEY (id_venda)
        REFERENCES venda (id_venda),

    CONSTRAINT fk_item_venda_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto)
);