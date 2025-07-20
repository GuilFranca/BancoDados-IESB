USE biblioteca_sicoob;

-- Selecionando as colunas titulo e lançamento da tabela livro que tenham o assunto = a P e a editora 1.
SELECT titulo, lancamento FROM livro WHERE assunto = "P" AND editora = 1;


-- Mosta o titulo e o preco de todos os livros do Jose Bonifacio
SELECT 
	L.titulo,
    L.preco
FROM
	Livro L
JOIN
	controle_aluno_livro CAL ON L.codigo_livro = CAL.codigo_livro
JOIN
	aluno A ON CAL.matricula = A.matricula
WHERE
	A.nome = 'Jose Bonifacio';