SHOW DATABASES;
CREATE DATABASE Dia_7;
USE Dia_7;

CREATE TABLE `customer` (
`id` int DEFAULT NULL,
`first_name` varchar (30) DEFAULT NULL,
`surname` varchar (40) DEFAULT NULL
);
INSERT INTO `customer`
VALUES (1, 'Yvonne', 'Clegg'),
(2, 'Johnny', 'Chaka-Chaka'),
(3, 'Winston', 'Powers'),
(4, 'Patricia', 'Mankuku'),
(5, 'Francois', 'Papo'),
(6, 'Winnie', 'Dlamini'),
(7, 'Neil', 'Beneke');

select * from customer order by surname;
ALTER TABLE customer ADD PRIMARY KEY(id);
DESCRIBE customer;

CREATE TABLE usuario (id INT NOT NULL,
apellidos CHAR(30) NOT NULL,
nombre CHAR(30) NOT NULL,
PRIMARY KEY (id),
INDEX indice01 (apellidos, nombre));

DESCRIBE usuario;

SHOW KEYS FROM usuario;

CREATE TABLE articles (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(200),
body TEXT,
FULLTEXT (title, body)
);

DESCRIBE articles;

CREATE TABLE ui_test(f1 INT, f2 INT, UNIQUE(f1));
ALTER TABLE customer ADD INDEX (surname(10));

CREATE INDEX Lorena_Paxton ON empleado (nombre, apellido1);