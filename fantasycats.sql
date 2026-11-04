CREATE DATABASE fantasy_cats;

Use fantasy_cats;

-- 1. TABELA CLIENTE
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    endereco VARCHAR(150),
    data_cadastro DATE
);

-- 2. TABELA CATEGORIA
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- 3. TABELA MARCA
CREATE TABLE marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

-- 4. TABELA PRODUTO
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_marca INT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco_unitario DECIMAL(10,2),
    estoque INT,
    status_produto VARCHAR(30),
    data_cadastro DATE,

    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

-- 5. TABELA PEDIDO
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME,
    valor_total DECIMAL(10,2),
    taxa_entrega DECIMAL(10,2),
    endereco_entrega VARCHAR(150),
    status_pedido VARCHAR(30),
    observacao VARCHAR(255),

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- 6. TABELA ITEM_PEDIDO
CREATE TABLE item_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),

    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- 7. TABELA VENDA
CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNIQUE,
    data_venda DATETIME,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    status_venda VARCHAR(30),

    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);