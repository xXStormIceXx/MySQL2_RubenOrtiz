-- ###################################
-- #####     DIA 4 - MySQL 2     #####
-- ###################################
show databases;
create database Mysql_Dia_4;
use Mysql_Dia_4;

-- Creacion de usuario a cualquier parte
create user 'camper'@'%' identified by 'campus2023';

-- Revisar permisos de X usuario
show grants for 'camper'@'%';

-- Crear una tabla de Personas
create table persona (id int primary key, nombre varchar(255), apellido varchar(255));
insert into persona (id,nombre,apellido) values (1,'Juan','Perez');
insert into persona (id,nombre,apellido) values (2,'Andres','Pastrana');
insert into persona (id,nombre,apellido) values (3,'Pedro','Gómez');
insert into persona (id,nombre,apellido) values (4,'Camilo','Gonzalez');
insert into persona (id,nombre,apellido) values (5,'Stiven','Maldonado');
insert into persona (id,nombre,apellido) values (6,'Ardila','Perez');
insert into persona (id,nombre,apellido) values (7,'Ruben','Gómez');
insert into persona (id,nombre,apellido) values (8,'Andres','Portilla');
insert into persona (id,nombre,apellido) values (9,'Miguel','Carvajal');
insert into persona (id,nombre,apellido) values (10,'Andrea','Gómez');

-- Asignar permisos a X usuario para que acceda a la tabla persona de Y
-- base de datos

grant select on Mysql_Dia_4 to 'camper'@'%';

-- Refrescar permisos de la BBDD
flush privileges;

-- Añadir permisos para hacer CRUD 
grant update, insert, delete on Mysql_Dia_4.persona to 'camper'@'%';

-- PELIGROSO!!! Crear un usuario con permisos a TODO desde cualquier
-- lado con mala contraseña
create user 'todito'@'%';
grant all on *.* to 'todito'@'%';
show grants for 'todito'@'%';

-- Denegar todos los permisos 
revoke all on *.* from 'todito'@'%';

-- Crear un usuario con acceso unico desde ip establecida
create user 'deivid'@'172.16.102.30' identified by 'deivid123';
grant update, insert, delete on Mysql_Dia_4.persona to 'deivid'@'172.16.102.30';
revoke all on *.* from 'deivid'@'172.16.102.30';
-- Crear un usuario con acceso desde cualquier parte 
create user 'deivid'@'%' identified by 'deivid123';
grant select on Mysql_Dia_4.* to 'deivid'@'%';
revoke all on *.* from 'deivid'@'%';

-- Crear una tabla de Personas
create table persona2 (id int primary key, nombre varchar(255), apellido varchar(255));
insert into persona2 (id,nombre,apellido) values (1,'Lucia','Perez');
insert into persona2 (id,nombre,apellido) values (2,'Felipe','Pastrana');
insert into persona2 (id,nombre,apellido) values (3,'Jhon','Gómez');
insert into persona2 (id,nombre,apellido) values (4,'Daniela','Gonzalez');
insert into persona2 (id,nombre,apellido) values (5,'Santiago','Maldonado');
insert into persona2 (id,nombre,apellido) values (6,'Adrian','Perez');
insert into persona2 (id,nombre,apellido) values (7,'Ruben','Gómez');
insert into persona2 (id,nombre,apellido) values (8,'Paola','Portilla');
insert into persona2 (id,nombre,apellido) values (9,'Kevin','Carvajal');
insert into persona2 (id,nombre,apellido) values (10,'Sofia','Gómez');

-- crear un limite para que solamente se hagan x consultas por hora
alter user 'camper'@'%' with max_connections_per_hour 5;
flush privileges;
-- create user 'camper'@'%' identified by 'campus2023';

-- Revisar los limites o permisos que tiene un usuario
-- a nivel motor
select * from mysql.user where  Host='%';

-- eliminar usuarios
drop user 'deivid'@'%';
drop user 'deivid'@'172.16.102.30';
drop user 'todito'@'%';

-- Revocar todos los permisos de camper
revoke all on *.* from 'camper'@'%';

-- Solo poner permisos para que consulte una 
-- x base de datos, una tabla y una z columna
grant select (nombre) on Mysql_Dia_4.persona to 'camper'@'%';