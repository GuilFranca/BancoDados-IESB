CREATE TABLE `herois` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `real_nome` varchar(255),
  `power_level` integer
);

CREATE TABLE `time` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `base` varchar(255)
);

CREATE TABLE `herois_time` (
  `herois_id` integer NOT NULL,
  `time_id` integer NOT NULL
);

ALTER TABLE `herois_time` ADD CONSTRAINT `herois_time` FOREIGN KEY (`herois_id`) REFERENCES `herois` (`id`);

ALTER TABLE `herois_time` ADD CONSTRAINT `herois_time` FOREIGN KEY (`time_id`) REFERENCES `time` (`id`);
