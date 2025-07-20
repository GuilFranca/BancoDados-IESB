-- Questões de CRUD
USE biblioteca_sicoob;
SET SQL_SAFE_UPDATES=0;

-- Atualização de Dados: Atualize o preço do livro 'Programando na Linguagem' para R$ 40,00.
UPDATE livro
SET preco = 40.00
WHERE titulo = 'Programando na Linguagem';

SELECT * FROM livro;



-- Inserção de Dados: Adicione um novo aluno com os seguintes dados:
INSERT INTO aluno (nome, cpf, endereco, data_nascimento, nacionalidade) VALUES ('Maria Silva', '11122233344', 'Rua das Flores, 123', '2005-05-15', 'Brasileira');

SELECT * FROM aluno;

UPDATE aluno
SET cpf = '10000000004'
WHERE nome = 'Maria Silva';



-- Exclusão de Dados: Remova o livro com o título 'Linguagem Procedural' do banco de dados.
DELETE FROM livro
WHERE titulo = 'Linguagem Procedural';

SELECT * FROM livro;



-- Uso de DISTINCT: Liste todos os assuntos distintos dos livros.
SELECT DISTINCT assunto
FROM livro;



-- HAVING Clause: Liste as editoras que possuem mais de 1 livro.
SELECT editora, COUNT(*) AS total_livros
FROM livro
GROUP BY editora
HAVING COUNT(*) > 1;



-- Busca por Nulos: Encontre os livros que não possuem uma data de lançamento registrada.
SELECT *
FROM livro
WHERE lancamento IS NULL;



-- Múltiplas Condições com OR: Liste os alunos que são 'Brasileiro' OU 'Italiana'.
SELECT *
FROM aluno
WHERE nacionalidade = 'Brasileira' OR nacionalidade = 'Italiana';

UPDATE aluno
SET nacionalidade = 'Brasileira'
WHERE nacionalidade = 'Brasileiro';



-- Livros não emprestados (usando NOT EXISTS ou LEFT JOIN com WHERE IS NULL): Encontre os títulos dos livros que atualmente não estão emprestados a nenhum aluno.
INSERT INTO livro (titulo, lancamento, assunto, editora, preco) VALUES ('Código limpo', '2008-08-01', 'A', 8, 112.34);

SELECT l.titulo
FROM livro l
LEFT JOIN controle_aluno_livro cal ON l.codigo_livro = cal.codigo_livro
WHERE cal.codigo_livro IS NULL;



-- Alunos que pegaram mais de um livro: Liste o nome dos alunos que pegaram emprestado mais de um livro.
SELECT a.nome, COUNT(cal.codigo_livro) AS livros_comprados
FROM aluno a
JOIN controle_aluno_livro cal ON  cal.matricula = a.matricula
GROUP BY a.matricula, a.nome
HAVING COUNT(cal.codigo_livro) > 1;

--  Livros com o mesmo título, mas preços diferentes: Encontre os títulos de livros que aparecem mais de uma vez, mas com preços diferentes.
SELECT titulo
FROM livro
GROUP BY titulo
HAVING COUNT(DISTINCT preco) > 1;