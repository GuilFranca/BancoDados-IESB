CREATE TABLE `biblioteca` (
  `id` integer PRIMARY KEY,
  `CNPJ` char(14),
  `nome` varchar(35),
  `endereco` varchar(65),
  `telefone` char(11)
);

CREATE TABLE `Biblioteca_Usuario` (
  `biblioteca_id` integer NOT NULL,
  `usuario_id` integer NOT NULL
);

CREATE TABLE `usuario` (
  `id` integer PRIMARY KEY,
  `nome` varchar(35),
  `telefone` integer(11),
  `email` varchar(50)
);

CREATE TABLE `Biblioteca_Livro` (
  `biblioteca_id` integer NOT NULL,
  `livro_id` integer NOT NULL
);

CREATE TABLE `livro` (
  `id` integer PRIMARY KEY,
  `titulo` varchar(255),
  `ano_lancamento` date,
  `qtd` integer
);

CREATE TABLE `Livro_Usuario` (
  `livro_id` integer NOT NULL,
  `usuario_id` integer NOT NULL
);

CREATE TABLE `Livro_Autor` (
  `livro_id` integer NOT NULL,
  `autor_id` integer NOT NULL
);

CREATE TABLE `autor` (
  `id` integer PRIMARY KEY,
  `nome` varchar(35)
);

CREATE TABLE `Livro_Genero` (
  `livro_id` integer NOT NULL,
  `genero_id` integer NOT NULL
);

CREATE TABLE `genero` (
  `id` integer PRIMARY KEY,
  `descricao` varchar(35)
);

ALTER TABLE `Biblioteca_Usuario` ADD CONSTRAINT `Biblioteca_Usuario` FOREIGN KEY (`biblioteca_id`) REFERENCES `biblioteca` (`id`);

ALTER TABLE `Biblioteca_Usuario` ADD CONSTRAINT `Biblioteca_Usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `Biblioteca_Livro` ADD CONSTRAINT `Biblioteca_Livro` FOREIGN KEY (`biblioteca_id`) REFERENCES `biblioteca` (`id`);

ALTER TABLE `Biblioteca_Livro` ADD CONSTRAINT `Biblioteca_Livro` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`id`);

ALTER TABLE `Livro_Usuario` ADD CONSTRAINT `Livro_Usuario` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`id`);

ALTER TABLE `Livro_Usuario` ADD CONSTRAINT `Livro_Usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `Livro_Autor` ADD CONSTRAINT `Livro_Autor` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`id`);

ALTER TABLE `Livro_Autor` ADD CONSTRAINT `Livro_Autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

ALTER TABLE `Livro_Genero` ADD CONSTRAINT `Livro_Genero` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`id`);

ALTER TABLE `Livro_Genero` ADD CONSTRAINT `Livro_Genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`);
