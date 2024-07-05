Show databases;
create database Dia_7_Ejercicio;

use Dia_7_Ejercicio;

-- Creacion tabla Gama Producto
create table gama_producto(
gama varchar(50) primary key,
descripcion_texto TEXT,
descripcion_html TEXT,
imagen varchar(256)
);

INSERT INTO gama_producto VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO gama_producto VALUES ('Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO gama_producto VALUES ('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);

-- Creacion tabla Producto
create table producto(
codigo_producto varchar(15) primary key,
nombre varchar(70) not null,
gama varchar(50) not null,
dimensiones varchar(25),
proveedor varchar(50),
descripcion TEXT,
cantidad_en_stock SMALLINT(6) not null,
precio_venta DECIMAL(15,2) not null,
precio_proveedor DECIMAL(15,2) not null,

foreign key (gama) references gama_producto(gama)
);

INSERT INTO producto VALUES ('11679','Sierra de Poda 400MM','Herramientas','0,258','HiperGarden Tools','Gracias a la poda se consigue manipular un poco la naturaleza, dándole la forma que más nos guste. Este trabajo básico de jardinería también facilita que las plantas crezcan de un modo más equilibrado, y que las flores y los frutos vuelvan cada año con regularidad. Lo mejor es dar forma cuando los ejemplares son jóvenes, de modo que exijan pocos cuidados cuando sean adultos. Además de saber cuándo y cómo hay que podar, tener unas herramientas adecuadas para esta labor es también de vital importancia.',15,14,11);
INSERT INTO producto VALUES ('21636','Pala','Herramientas','0,156','HiperGarden Tools','Palas de acero con cresta de corte en la punta para cortar bien el terreno. Buena penetración en tierras muy compactas.',15,14,13);


-- Creacion tabla Cliente
create table cliente(
codigo_cliente int(11) auto_increment primary key,
nombre_cliente varchar(50) not null,
nombre_contacto varchar(30),
apellido_contacto varchar(30),
telefono varchar(15) not null,
fax varchar(15) not null,
linea_direccion1 varchar(50) not null,
linea_direccion2 varchar(50),
ciudad varchar(50) not null,
region varchar(50),
pais varchar(50),
codigo_postal varchar(10),
codigo_empleado_rep_ventas int(11),
limite_credito DECIMAL(15,2),

foreign key (codigo_empleado_rep_ventas) references empleado(codigo_empleado)
);

INSERT INTO cliente VALUES (1,'GoldFish Garden','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'San Francisco',NULL,'USA','24006',19,3000);
INSERT INTO cliente VALUES (3,'Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',19,6000);
INSERT INTO cliente VALUES (4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue nº22',NULL,'New York',NULL,'USA','85495',22,12000);
INSERT INTO cliente VALUES (5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street nº69',NULL,'Miami',NULL,'USA','696969',22,600000);
INSERT INTO cliente VALUES (6,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);


-- Creacion de tabla Detalle de Pedido
create table detalle_pedido(
codigo_pedido int(11),
codigo_producto varchar(15),
cantidad int(11) not null,
precio_unidad DECIMAL(15,2) not null,
numero_linea SMALLINT(6) not null,

foreign key (codigo_pedido) references pedido(codigo_pedido),
foreign key (codigo_producto) references producto(codigo_producto)
);

INSERT INTO detalle_pedido VALUES (1,'FR-67',10,70,3);
INSERT INTO detalle_pedido VALUES (1,'OR-127',40,4,1);
INSERT INTO detalle_pedido VALUES (1,'OR-141',25,4,2);
INSERT INTO detalle_pedido VALUES (1,'OR-241',15,19,4);
INSERT INTO detalle_pedido VALUES (1,'OR-99',23,14,5);
INSERT INTO detalle_pedido VALUES (2,'FR-4',3,29,6);

-- Creacion tabla Pedido
create table pedido(
codigo_pedido int(11) auto_increment primary key,
fecha_pedido DATE not null,
fecha_esperada DATE not null,
fecha_entrega DATE not null,
estado varchar(15) not null,
comentarios TEXT,
codigo_cliente int(11) not null,

foreign key (codigo_cliente) references cliente(codigo_cliente)
);

INSERT INTO pedido VALUES (1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5);
INSERT INTO pedido VALUES (2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',5);
INSERT INTO pedido VALUES (3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5);
INSERT INTO pedido VALUES (4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5);


-- Creacion tabla Pago
create table Pago(
codigo_cliente int(11),
forma_pago varchar(40) not null,
id_transaccion varchar(50) primary key,
fecha_pago date not null,
total decimal(15,2),

foreign key (codigo_cliente) references cliente(codigo_cliente)
);

INSERT INTO Pago VALUES (1,'PayPal','ak-std-000001','2008-11-10',2000);
INSERT INTO Pago VALUES (1,'PayPal','ak-std-000002','2008-12-10',2000);
INSERT INTO Pago VALUES (3,'PayPal','ak-std-000003','2009-01-16',5000);
INSERT INTO Pago VALUES (3,'PayPal','ak-std-000004','2009-02-16',5000);
INSERT INTO Pago VALUES (3,'PayPal','ak-std-000005','2009-02-19',926);
INSERT INTO Pago VALUES (4,'PayPal','ak-std-000006','2007-01-08',20000);
INSERT INTO Pago VALUES (4,'PayPal','ak-std-000007','2007-01-08',20000);


-- Creacion tabla Empleado
create table empleado(
codigo_empleado int(11) auto_increment primary key,
nombre varchar(50),
apellido1 varchar(50) not null,
apellido2 varchar(50),
extension varchar(10) not null,
email varchar(100) not null,
codigo_oficina varchar(10) not null,
codigo_jefe int(11),
puesto varchar(50),

foreign key (codigo_oficina) references oficina(codigo_oficina)
);

INSERT INTO empleado VALUES (1,'Marcos','Magaña','Perez','3897','marcos@jardineria.es','TAL-ES',NULL,'Director General');
INSERT INTO empleado VALUES (2,'Ruben','López','Martinez','2899','rlopez@jardineria.es','TAL-ES',1,'Subdirector Marketing');
INSERT INTO empleado VALUES (3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es','TAL-ES',2,'Subdirector Ventas');
INSERT INTO empleado VALUES (4,'Maria','Solís','Jerez','2847','msolis@jardineria.es','TAL-ES',2,'Secretaria');
INSERT INTO empleado VALUES (5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO empleado VALUES (6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO empleado VALUES (7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','MAD-ES',3,'Director Oficina');
INSERT INTO empleado VALUES (8,'Mariano','López','Murcia','2442','mlopez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (9,'Lucio','Campoamor','Martín','2442','lcampoamor@jardineria.es','MAD-ES',7,'Representante Ventas');

 -- Creacion tabla Oficina 
 create table Oficina(
 codigo_oficina varchar(10) primary key,
 ciudad varchar(30) not null,
 pais varchar(50) not null,
 region varchar(50),
 codigo_postal varchar(10),
 telefono varchar(20) not null,
 linea_de_direccion1 varchar(50) not null,
 linea_de_direccion2 varchar(50)
 );
INSERT INTO Oficina VALUES ('BCN-ES','Barcelona','España','Barcelona','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha');
INSERT INTO Oficina VALUES ('BOS-USA','Boston','EEUU','MA','02108','+1 215 837 0825','1550 Court Place','Suite 102');
INSERT INTO Oficina VALUES ('LON-UK','Londres','Inglaterra','EMEA','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor');
INSERT INTO Oficina VALUES ('MAD-ES','Madrid','España','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32','');
INSERT INTO Oficina VALUES ('PAR-FR','Paris','Francia','EMEA','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans','');
INSERT INTO Oficina VALUES ('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300');
INSERT INTO Oficina VALUES ('SYD-AU','Sydney','Australia','APAC','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2');
INSERT INTO Oficina VALUES ('TAL-ES','Talavera de la Reina','España','Castilla-LaMancha','45632','+34 925 867231','Francisco Aguirre, 32','5º piso (exterior)');
INSERT INTO Oficina VALUES ('TOK-JP','Tokyo','Japón','Chiyoda-Ku','102-8578','+81 33 224 5000','4-1 Kioicho','');
show tables;


-- 1. Consulta para agrupar los clientes de todos los empleados cuyo puesto sea responsable de ventas:

SELECT 
    cliente.nombre_cliente,
    cliente.telefono,
    cliente.ciudad,
    empleado.nombre,
    empleado.apellido1,
    empleado.email
FROM 
    cliente
JOIN 
    empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE 
    empleado.puesto LIKE '%Representante Ventas%';


-- 2. Consulta para obtener los registros de los pedidos entre el 15 de marzo del 2009 y el 15 de julio del 2009, para todos los clientes que sean de la ciudad de Sotogrande:

SELECT 
    pedido.codigo_pedido,
    pedido.fecha_pedido,
    pedido.fecha_entrega,
    pedido.estado,
    pedido.comentarios,
    pedido.codigo_cliente
FROM 
    pedido
JOIN 
    cliente ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE 
    cliente.ciudad = 'Sotogrande'
    AND pedido.fecha_pedido BETWEEN '2009-03-15' AND '2009-07-15';


-- 3. Consulta para obtener los productos cuya gama pertenezca a las frutas y que el proveedor sea Frutas Talaveras S.A, mostrando los detalles del producto y la cantidad en los distintos pedidos:

SELECT 
    producto.codigo_producto,
    producto.nombre,
    producto.descripcion,
    producto.cantidad_en_stock,
    producto.precio_venta * 0.9 AS precio_con_descuento,
    detalle_pedido.cantidad
FROM 
    producto
JOIN 
    detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE 
    producto.gama = 'Frutales'
    AND producto.proveedor = 'Frutas Talaveras S.A';
