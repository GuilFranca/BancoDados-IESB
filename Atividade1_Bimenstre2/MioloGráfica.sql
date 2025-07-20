CREATE DATABASE miolo_grafica;

-- DROP DATABASE miolo_grafica;

USE miolo_grafica;

CREATE TABLE loja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    contato VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255),
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id INT,
    fornecedor_id INT,
    destaque BOOLEAN,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    telefone VARCHAR(20),
    data_cadastro DATETIME
);

CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    cargo VARCHAR(50),
    adm_autorizado BOOLEAN,
    loja_id INT,
    FOREIGN KEY (loja_id) REFERENCES loja(id)
);

CREATE TABLE adm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255)
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE item_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

CREATE TABLE relatorio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100),
    data_geracao DATETIME,
    conteudo VARCHAR(255)
);

CREATE TABLE ia_suporte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    mensagem VARCHAR(255),
    resposta VARCHAR(255),
    data DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE funcionario_destaque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    mes VARCHAR(10),
    ano INT,
    motivo VARCHAR(255),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);
