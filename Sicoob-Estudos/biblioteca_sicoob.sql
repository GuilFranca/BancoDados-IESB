CREATE DATABASE IF NOT EXISTS biblioteca_sicoob;

USE biblioteca_sicoob;

CREATE TABLE livro(
	codigo_livro INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
    lancamento DATE,
    assunto CHAR,
    editora INT,
    preco FLOAT    
);

CREATE TABLE aluno(
	matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    endereco VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(100)
)AUTO_INCREMENT=9999;

CREATE TABLE controle_aluno_livro(
	codigo_livro INT,
    matricula INT,
    
    PRIMARY KEY (codigo_livro, matricula), -- Chave primária composta
    
    FOREIGN KEY (codigo_livro) REFERENCES livro(codigo_livro),
    FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);