INSERT INTO livro (codigo_livro, titulo, lancamento, assunto, editora, preco) VALUES 
(2, 'Programando na Linguagem', '1997-01-10', 'P', 1, 35.00),
(1, 'Banco de Dados', '1999-10-01', 'B', 1, 31.20),
(5, 'Banco de Dados SQL Server', NULL, 'D', 1, 60.00),
(6, 'Banco de Dados SQL Server', NULL, 'B', 1, 85.00),
(7, 'Linguagem Procedural', '2004-10-09', 'D', 1, 60.00);

SELECT * FROM livro;

INSERT INTO aluno (matricula, nome, cpf, endereco, data_nascimento, nacionalidade) VALUES 
(10000, 'Jose Bonifacio', '10000000001', 'Rua Jose', '2010-01-09', 'Brasileiro'),
(10001, 'Mane Garrincha', '10000000002', 'Rua Lovan', '2011-01-09', 'Italiana'),
(10002, 'Antonio', '10000000003', 'Estrada de Itapecerica', '1998-02-01', 'Portuguesa');

SELECT * FROM aluno;

INSERT INTO controle_aluno_livro (codigo_livro, matricula) VALUES 
(2, 10000),
-- (3, 10002),
-- (4, 10001),
(1, 10000),
(5, 10001),
(6, 10002);
-- (7, 10003);