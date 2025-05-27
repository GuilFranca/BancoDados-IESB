-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS lojaDB;

-- DROP DATABASE lojaDB;

-- Conectando com o banco de dados
USE lojaDB;

-- Criação de tabela
CREATE TABLE clientes(
	idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Iserindo dados na tabela clientes
INSERT INTO clientes(nome, email) VALUES
('Cleiton Rhasta', 'cletin_cabeçaDEGELO@gmail.com'), -- id 1 --
('Luan Raio Laser', 'LuanDoRaio@gmail.com'), -- id 2 --
('Robson Cruzué', 'cruzuezinhoCEI@gmail.com');  -- id 3 --

-- Mostrar tabela clientes
SELECT * FROM clientes;

CREATE TABLE pedidos(
	idpedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    
    -- Criando e Referenciando Chave estrangeira
    CONSTRAINT fk_idcliente FOREIGN KEY (id_cliente) REFERENCES clientes (idcliente)
);

INSERT INTO pedidos(id_cliente, data_pedido, valor_total) VALUES
(1, '2025-05-01', 2150.99),
(1, '2023-09-21', 10.00),
(3, '2022-02-24', 999.99);

SELECT * FROM pedidos;


-- INNER JOIN -> Retorna registro que tem em ambas as tabelas
-- SELECT -> Seleciona quais colunas serão exibidas no resultado
-- c.nome -> Aliace -> Apelido da coluna nome da tabela cliente ('c' cliente)
-- p.data_pedido e p.valor_total -> Acessar colunas da tabela pedido (Apelido com 'p')
-- FROM -> CLIENTES C: DEFINE CLIENTES 
-- ON -> Comando de junção que compara o ID da tabela X com ID da tabela y 

-- Junta dads de duas tabelas ao mesmo tempo e três colunas
SELECT c.nome, p.data_pedido, p.valor_total
FROM clientes c
INNER JOIN pedidos p ON c.idcliente = p.id_cliente;

-- LEFT JOIN -> Retorna todos os clientes, mesmo os que não tem pedidos (os valores do pedido aparecem como null)

SELECT c.nome, p.data_pedido, p.valor_total
FROM clientes c
LEFT JOIN podidos p ON c.idcliente = p.id_cliente;

-- RIGHT/FULL OUTER JOIN ** PRÓXIMA AULA

-- SUM() -> Soma os valores de uma coluna
-- GROUP BY -> Agrupa os registros para aplicar funções

SELECT c.nome, SUM(p.valor_total) AS total_gastos
FROM clientes c
JOIN pedidos p ON c.idcliente = p.id_cliente
GROUP BY c.nome;

SELECT * FROM clientes;
INSERT INTO clientes(nome, email) VALUES 
("Fernanda", "fernanda@gmail.com"), -- ID 1
("Josef", "joaozinGaymeplai@gmal.com");

INSERT INTO clientes(nome) VALUES
('jobervaldo');

-- CONSULTAS E COMANDOS --
-- COMANDO LIKE: FILTRA NOMES COM PADRÕES ESPECIFICOS
SELECT * FROM clientes WHERE nome LIKE 'j%';

-- IN: FILTRA MÚLTIPLOS VALORES COM CLAREZA, COMO EXEMPLO CHAVE PRIMÁRIA (ID'S)
SELECT * FROM pedidos WHERE id_cliente IN (1, 2);

-- max e min: ENCONTRA VALORES EXTERNOS NUMÉRICOS --
SELECT 
	MAX(valor_total) AS VALOR_TOTAL_MAXIMO,
    MIN(valor_total) AS VALOR_TOTAL_MINIMO
FROM pedidos;

-- ORDER BY: Organiza os resultados da busca no banco de dados --
SELECT * FROM pedidos ORDER BY valor_total ASC;

-- IS NULL: VERIFICA CAMPOS VAZIOS
SELECT * FROM clientes WHERE email IS NULL;

-- BETWEEN: FILTRA POR FAIXA DE VALORES
SELECT * FROM pedidos WHERE valor_total BETWEEN 400 AND 5000;

-- LIMIT: MOSTRA APENAS OS PRIMEIROS RESULTADOS
SELECT * FROM pedidos ORDER BY valor_total DESC LIMIT 3;

-- DISTINCT: REMOVE DUPLICIDADES
SELECT DISTINCT id_cliente FROM pedidos;

SELECT * FROM pedidos;

-- INER JOIN: TABELAS COM RELACIONAMENTO