CREATE DATABASE IF NOT EXISTS nerds_db;
USE nerds_db;

-- DROP DATABASE nerds_db; --

CREATE TABLE usuarios(
	id_usuarios INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE
);

CREATE TABLE categorias(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produto(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL (10,2),
    estoque INT DEFAULT 0,
	categoria_id INT,
    FOREIGN KEY(categoria_id) REFERENCES categorias(id_categoria)
);

CREATE TABLE pedidos(
	id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    usuarios_id INT,
    data_pedidos DATETIME,
    status_pedidos VARCHAR(20) DEFAULT 'PENDENTE',
    FOREIGN KEY(usuarios_id) REFERENCES usuario(id_usuarios)
);