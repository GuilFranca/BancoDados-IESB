-- Questões de consultas

-- Liste todos os livros disponíveis na biblioteca, mostrando o título e o preço.
SELECT titulo, preco FROM  livro;


-- Consultas com relação a data.
SELECT * FROM aluno WHERE data_nascimento = '2011-01-09';

SELECT * 
FROM aluno 
WHERE YEAR(data_nascimento) = 2010;

SELECT *
FROM aluno
WHERE YEAR(data_nascimento) BETWEEN 1998 AND 2025;

SELECT *
FROM aluno
WHERE MONTH(data_nascimento) = 2 AND DAY(data_nascimento) = 1;


-- Filtragem com Múltiplas Condições: Liste os livros que têm 'Banco de Dados' no título E cujo preço é maior que R$ 50,00.
SELECT *
FROM livro
WHERE titulo LIKE '%Banco de dados%' AND preco > 50.00;


-- Ordenação de Resultados: Mostre todos os livros, ordenados pelo título em ordem alfabética crescente.
SELECT *
FROM livro
ORDER BY titulo ASC; -- Ordem crescente

SELECT *
FROM livro
ORDER BY titulo DESC; -- Ordem decrescente

SELECT * FROM livro; -- Ordernado pelo id

-- Contagem de Registros: Quantos livros existem na tabela livro?
SELECT COUNT(*)  AS total_livros 
FROM livro;

SELECT COUNT(titulo)
FROM livro
WHERE titulo LIKE '%Banco de dados%';

SELECT COUNT(titulo)
FROM livro
WHERE titulo = 'Banco de dados';


-- Agregação e Agrupamento: Qual é o preço médio dos livros?
SELECT AVG(preco) AS preco_medio -- AVG faz o calculo da média
FROM livro;

SELECT Round(AVG(preco), 2) AS preco_medio -- ROUND limita as casas deciamais
FROM livro;

SELECT MAX(preco) AS max_preco
FROM livro;

SELECT MIN(preco) AS min_preco
FROM livro;


--  Contagem com Agrupamento: Conte quantos livros cada editora possui (assumindo que 'editora' é um código numérico).
SELECT editora, COUNT(*) AS qtd_livro_editora
FROM livro
GROUP BY editora;

SELECT matricula, COUNT(*) AS qtd_livros_comprados
FROM controle_aluno_livro
GROUP BY matricula;

SELECT A.matricula, A.nome, COUNT(CAL.codigo_livro) AS qtd_livros_comprados
FROM aluno A
JOIN controle_aluno_livro CAL ON A.matricula = CAL.matricula
GROUP BY A.matricula, A.nome;


-- Questão 7: Junção de Tabelas (INNER JOIN): Liste o nome do aluno e o título do livro que ele pegou emprestado.
SELECT a.nome, l.titulo
FROM aluno a
INNER JOIN controle_aluno_livro cal ON a.matricula = cal.matricula
INNER JOIN livro l ON cal.codigo_livro = l.codigo_livro;