CREATE DATABASE IF NOT EXISTS biblioteca_db;

-- DROP DATABASE biblioteca_db;

CREATE TABLE livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    ano_publicacao DATE
);

CREATE TABLE autor(
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_livro INT,
    
    CONSTRAINT fk_id_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);