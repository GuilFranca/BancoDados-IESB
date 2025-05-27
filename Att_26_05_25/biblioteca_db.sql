-- Criação do Banco de dados de uma biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca_db;

-- Definido qual banco de dados será acessado
USE biblioteca_db;

-- DROP DATABASE biblioteca_db;

-- DROP TABLE autor;

-- Criando a tabela autor
CREATE TABLE autor(
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
-- DROP TABLE autor;
-- Inserindo valores dentro da tabela autor
INSERT INTO autor(nome) VALUES
('Josefino'),
('Armaldo'),
('Armando');

-- Criando tabela livro
CREATE TABLE livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    ano_publicacao DATE,
    id_autor INT,
    
    -- Declarando a fk_key da tabela livro como a primary_key de autor
    CONSTRAINT fk_id_autor FOREIGN KEY (id_autor) REFERENCES autor (id_autor)
);
-- DROP TABLE livro;
-- Inserindo valores dentro da tabela livro
INSERT INTO livro(nome, ano_publicacao, id_autor) VALUES 
('Mil e um dias', '2025-12-30', 1),
('Jacinto dor', '2002-05-27', 2),
('Maria Sisters', '2000-01-15', 3),
('', '2000-01-15', 3);

-- Selecionando os atributos em comum das tabelas autor e livro, através dos atributos nome e ano_publicacao
SELECT a.nome, l.nome as titulo, l.ano_publicacao
FROM autor a
INNER JOIN livro l ON a.id_autor = l.id_autor;

-- Selecionando todos os valores das tabelas, mesmo os vazios, utilizando LEFT JOIN
SELECT a.nome, l.nome as titulo, l.ano_publicacao
FROM autor a
LEFT JOIN livro l ON a.id_autor = l.id_autor;

-- Selecionando valores com GROUP BY

