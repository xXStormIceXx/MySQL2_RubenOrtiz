show databases;
use Mysql_Dia_4;
show tables;

-- Creación de la tabla Sucursal
CREATE TABLE Sucursal (
    idSucursal INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefonoFijo VARCHAR(20) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    correoElectronico VARCHAR(100) NOT NULL
);

-- Creación de la tabla Empleado
CREATE TABLE Empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    idSucursal INT NOT NULL,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudadResidencia VARCHAR(100) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    correoElectronico VARCHAR(100) NOT NULL,
    FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)
);

-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudadResidencia VARCHAR(100) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    correoElectronico VARCHAR(100) NOT NULL
);

-- Creación de la tabla Vehiculo
CREATE TABLE Vehiculo (
    idVehiculo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    placa VARCHAR(20) NOT NULL UNIQUE,
    referencia VARCHAR(100) NOT NULL,
    modelo INT NOT NULL,
    puertas INT NOT NULL,
    capacidad INT NOT NULL,
    sunroof ENUM('Sí', 'No') NOT NULL,
    motor VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
);

-- Creación de la tabla Alquiler
CREATE TABLE Alquiler (
    idAlquiler INT AUTO_INCREMENT PRIMARY KEY,
    idVehiculo INT NOT NULL,
    idCliente INT NOT NULL,
    idEmpleado INT NOT NULL,
    idSucursalSalida INT NOT NULL,
    idSucursalLlegada INT NOT NULL,
    fechaSalida DATE NOT NULL,
    fechaLlegada DATE,
    fechaEsperadaLlegada DATE NOT NULL,
    valorAlquilerSemana DECIMAL(10, 2) NOT NULL,
    valorAlquilerDia DECIMAL(10, 2) NOT NULL,
    porcentajeDescuento DECIMAL(5, 2) NOT NULL,
    valorCotizado DECIMAL(10, 2) NOT NULL,
    valorPagado DECIMAL(10, 2),
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    FOREIGN KEY (idSucursalSalida) REFERENCES Sucursal(idSucursal),
    FOREIGN KEY (idSucursalLlegada) REFERENCES Sucursal(idSucursal)
);

-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idEmpleado INT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    tipoUsuario ENUM('Cliente', 'Empleado') NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- Inserciones Surcursales
INSERT INTO Sucursal (ciudad, direccion, telefonoFijo, celular, correoElectronico) VALUES
('Ciudad A', 'Calle 123, Barrio Central', '011-1234567', '011-987654321', 'contactoA@autorental.com');
INSERT INTO Sucursal (ciudad, direccion, telefonoFijo, celular, correoElectronico) VALUES
('Ciudad B', 'Avenida Principal 456, Zona Norte', '022-2345678', '022-876543210', 'contactoB@autorental.com');
INSERT INTO Sucursal (ciudad, direccion, telefonoFijo, celular, correoElectronico) VALUES
('Ciudad C', 'Carrera 789, Distrito Empresarial', '033-3456789', '033-765432109', 'contactoC@autorental.com');
INSERT INTO Sucursal (ciudad, direccion, telefonoFijo, celular, correoElectronico) VALUES
('Ciudad D', 'Boulevard 1011, Sector Residencial', '044-4567890', '044-654321098', 'contactoD@autorental.com');
INSERT INTO Sucursal (ciudad, direccion, telefonoFijo, celular, correoElectronico) VALUES
('Ciudad E', 'Plaza Central 1213, Zona Comercial', '055-5678901', '055-543210987', 'contactoE@autorental.com');

-- Inserciones Empleados
INSERT INTO Empleado (idSucursal, cedula, nombres, apellidos, direccion, ciudadResidencia, celular, correoElectronico) VALUES
(1, '10000001', 'Juan', 'Pérez', 'Calle 1, Ciudad A', 'Ciudad A', '011-9000001', 'juan.perez@autorental.com'),
(1, '10000002', 'Ana', 'Gómez', 'Calle 2, Ciudad A', 'Ciudad A', '011-9000002', 'ana.gomez@autorental.com'),
(1, '10000003', 'Luis', 'Martínez', 'Calle 3, Ciudad A', 'Ciudad A', '011-9000003', 'luis.martinez@autorental.com'),
(1, '10000004', 'María', 'Rodríguez', 'Calle 4, Ciudad A', 'Ciudad A', '011-9000004', 'maria.rodriguez@autorental.com'),
(1, '10000005', 'Carlos', 'López', 'Calle 5, Ciudad A', 'Ciudad A', '011-9000005', 'carlos.lopez@autorental.com'),
(1, '10000006', 'Laura', 'Sánchez', 'Calle 6, Ciudad A', 'Ciudad A', '011-9000006', 'laura.sanchez@autorental.com'),
(1, '10000007', 'José', 'García', 'Calle 7, Ciudad A', 'Ciudad A', '011-9000007', 'jose.garcia@autorental.com'),
(1, '10000008', 'Lucía', 'Hernández', 'Calle 8, Ciudad A', 'Ciudad A', '011-9000008', 'lucia.hernandez@autorental.com'),
(1, '10000009', 'Miguel', 'Torres', 'Calle 9, Ciudad A', 'Ciudad A', '011-9000009', 'miguel.torres@autorental.com'),
(1, '10000010', 'Rosa', 'Ramírez', 'Calle 10, Ciudad A', 'Ciudad A', '011-9000010', 'rosa.ramirez@autorental.com'),
(2, '20000001', 'Pedro', 'Flores', 'Calle 1, Ciudad B', 'Ciudad B', '022-9000001', 'pedro.flores@autorental.com'),
(2, '20000002', 'Carmen', 'Morales', 'Calle 2, Ciudad B', 'Ciudad B', '022-9000002', 'carmen.morales@autorental.com'),
(2, '20000003', 'Raúl', 'Jiménez', 'Calle 3, Ciudad B', 'Ciudad B', '022-9000003', 'raul.jimenez@autorental.com'),
(2, '20000004', 'Sara', 'Ortiz', 'Calle 4, Ciudad B', 'Ciudad B', '022-9000004', 'sara.ortiz@autorental.com'),
(2, '20000005', 'Manuel', 'Castro', 'Calle 5, Ciudad B', 'Ciudad B', '022-9000005', 'manuel.castro@autorental.com'),
(2, '20000006', 'Paula', 'Ramos', 'Calle 6, Ciudad B', 'Ciudad B', '022-9000006', 'paula.ramos@autorental.com'),
(2, '20000007', 'Alberto', 'Vargas', 'Calle 7, Ciudad B', 'Ciudad B', '022-9000007', 'alberto.vargas@autorental.com'),
(2, '20000008', 'Andrea', 'Mendoza', 'Calle 8, Ciudad B', 'Ciudad B', '022-9000008', 'andrea.mendoza@autorental.com'),
(2, '20000009', 'Daniel', 'Herrera', 'Calle 9, Ciudad B', 'Ciudad B', '022-9000009', 'daniel.herrera@autorental.com'),
(2, '20000010', 'Isabel', 'Fernández', 'Calle 10, Ciudad B', 'Ciudad B', '022-9000010', 'isabel.fernandez@autorental.com'),
(3, '30000001', 'Enrique', 'Ruiz', 'Calle 1, Ciudad C', 'Ciudad C', '033-9000001', 'enrique.ruiz@autorental.com'),
(3, '30000002', 'Verónica', 'Guzmán', 'Calle 2, Ciudad C', 'Ciudad C', '033-9000002', 'veronica.guzman@autorental.com'),
(3, '30000003', 'Marcos', 'Salinas', 'Calle 3, Ciudad C', 'Ciudad C', '033-9000003', 'marcos.salinas@autorental.com'),
(3, '30000004', 'Alicia', 'Ríos', 'Calle 4, Ciudad C', 'Ciudad C', '033-9000004', 'alicia.rios@autorental.com'),
(3, '30000005', 'Ricardo', 'Navarro', 'Calle 5, Ciudad C', 'Ciudad C', '033-9000005', 'ricardo.navarro@autorental.com'),
(3, '30000006', 'Sofía', 'Escobar', 'Calle 6, Ciudad C', 'Ciudad C', '033-9000006', 'sofia.escobar@autorental.com'),
(3, '30000007', 'Francisco', 'Romero', 'Calle 7, Ciudad C', 'Ciudad C', '033-9000007', 'francisco.romero@autorental.com'),
(3, '30000008', 'Claudia', 'Muñoz', 'Calle 8, Ciudad C', 'Ciudad C', '033-9000008', 'claudia.munoz@autorental.com'),
(3, '30000009', 'Oscar', 'Cruz', 'Calle 9, Ciudad C', 'Ciudad C', '033-9000009', 'oscar.cruz@autorental.com'),
(3, '30000010', 'Marta', 'Chávez', 'Calle 10, Ciudad C', 'Ciudad C', '033-9000010', 'marta.chavez@autorental.com'),
(4, '40000001', 'Gabriel', 'Paredes', 'Calle 1, Ciudad D', 'Ciudad D', '044-9000001', 'gabriel.paredes@autorental.com'),
(4, '40000002', 'Beatriz', 'Silva', 'Calle 2, Ciudad D', 'Ciudad D', '044-9000002', 'beatriz.silva@autorental.com'),
(4, '40000003', 'Emilio', 'Luna', 'Calle 3, Ciudad D', 'Ciudad D', '044-9000003', 'emilio.luna@autorental.com'),
(4, '40000004', 'Adriana', 'Figueroa', 'Calle 4, Ciudad D', 'Ciudad D', '044-9000004', 'adriana.figueroa@autorental.com'),
(4, '40000005', 'Hugo', 'Sandoval', 'Calle 5, Ciudad D', 'Ciudad D', '044-9000005', 'hugo.sandoval@autorental.com'),
(4, '40000006', 'Julia', 'Ponce', 'Calle 6, Ciudad D', 'Ciudad D', '044-9000006', 'julia.ponce@autorental.com'),
(4, '40000007', 'Pablo', 'Maldonado', 'Calle 7, Ciudad D', 'Ciudad D', '044-9000007', 'pablo.maldonado@autorental.com'),
(4, '40000008', 'Gloria', 'Soto', 'Calle 8, Ciudad D', 'Ciudad D', '044-9000008', 'gloria.soto@autorental.com'),
(4, '40000009', 'Sergio', 'Aguilar', 'Calle 9, Ciudad D', 'Ciudad D', '044-9000009', 'sergio.aguilar@autorental.com'),
(4, '40000010', 'Patricia', 'Delgado', 'Calle 10, Ciudad D', 'Ciudad D', '044-9000010', 'patricia.delgado@autorental.com'),
(5, '50000001', 'Fernando', 'Vega', 'Calle 1, Ciudad E', 'Ciudad E', '055-9000001', 'fernando.vega@autorental.com'),
(5, '50000002', 'Elena', 'Campos', 'Calle 2, Ciudad E', 'Ciudad E', '055-9000002', 'elena.campos@autorental.com'),
(5, '50000003', 'Héctor', 'Arias', 'Calle 3, Ciudad E', 'Ciudad E', '055-9000003', 'hector.arias@autorental.com'),
(5, '50000004', 'Mónica', 'Peña', 'Calle 4, Ciudad E', 'Ciudad E', '055-9000004', 'monica.pena@autorental.com'),
(5, '50000005', 'Roberto', 'Rivas', 'Calle 5, Ciudad E', 'Ciudad E', '055-9000005', 'roberto.rivas@autorental.com'),
(5, '50000006', 'Natalia', 'Miranda', 'Calle 6, Ciudad E', 'Ciudad E', '055-9000006', 'natalia.miranda@autorental.com'),
(5, '50000007', 'Javier', 'Fuentes', 'Calle 7, Ciudad E', 'Ciudad E', '055-9000007', 'javier.fuentes@autorental.com'),
(5, '50000008', 'Silvia', 'Lara', 'Calle 8, Ciudad E', 'Ciudad E', '055-9000008', 'silvia.lara@autorental.com'),
(5, '50000009', 'Esteban', 'Guerrero', 'Calle 9, Ciudad E', 'Ciudad E', '055-9000009', 'esteban.guerrero@autorental.com'),
(5, '50000010', 'Teresa', 'Carrillo', 'Calle 10, Ciudad E', 'Ciudad E', '055-9000010', 'teresa.carrillo@autorental.com'),
(1, '10000011', 'María', 'Alonso', 'Calle 11, Ciudad A', 'Ciudad A', '011-9000011', 'maria.alonso@autorental.com'),
(1, '10000012', 'Jorge', 'Villegas', 'Calle 12, Ciudad A', 'Ciudad A', '011-9000012', 'jorge.villegas@autorental.com'),
(1, '10000013', 'Luisa', 'Escalante', 'Calle 13, Ciudad A', 'Ciudad A', '011-9000013', 'luisa.escalante@autorental.com'),
(1, '10000014', 'Martín', 'Méndez', 'Calle 14, Ciudad A', 'Ciudad A', '011-9000014', 'martin.mendez@autorental.com'),
(1, '10000015', 'Gabriela', 'Oliva', 'Calle 15, Ciudad A', 'Ciudad A', '011-9000015', 'gabriela.oliva@autorental.com'),
(1, '10000016', 'Alejandro', 'Toscano', 'Calle 16, Ciudad A', 'Ciudad A', '011-9000016', 'alejandro.toscano@autorental.com'),
(1, '10000017', 'Cristina', 'Rentería', 'Calle 17, Ciudad A', 'Ciudad A', '011-9000017', 'cristina.renteria@autorental.com'),
(1, '10000018', 'René', 'Guevara', 'Calle 18, Ciudad A', 'Ciudad A', '011-9000018', 'rene.guevara@autorental.com'),
(1, '10000019', 'Gloria', 'Avendaño', 'Calle 19, Ciudad A', 'Ciudad A', '011-9000019', 'gloria.avendano@autorental.com'),
(1, '10000020', 'Felipe', 'Arrieta', 'Calle 20, Ciudad A', 'Ciudad A', '011-9000020', 'felipe.arrieta@autorental.com'),
(2, '20000011', 'Nicolás', 'Mora', 'Calle 11, Ciudad B', 'Ciudad B', '022-9000011', 'nicolas.mora@autorental.com'),
(2, '20000012', 'Valeria', 'Montaño', 'Calle 12, Ciudad B', 'Ciudad B', '022-9000012', 'valeria.montano@autorental.com'),
(2, '20000013', 'Javier', 'Solano', 'Calle 13, Ciudad B', 'Ciudad B', '022-9000013', 'javier.solano@autorental.com'),
(2, '20000014', 'Fernanda', 'Román', 'Calle 14, Ciudad B', 'Ciudad B', '022-9000014', 'fernanda.roman@autorental.com'),
(2, '20000015', 'Andrés', 'Rojas', 'Calle 15, Ciudad B', 'Ciudad B', '022-9000015', 'andres.rojas@autorental.com'),
(2, '20000016', 'Sandra', 'Díaz', 'Calle 16, Ciudad B', 'Ciudad B', '022-9000016', 'sandra.diaz@autorental.com'),
(2, '20000017', 'Juan', 'Castillo', 'Calle 17, Ciudad B', 'Ciudad B', '022-9000017', 'juan.castillo@autorental.com'),
(2, '20000018', 'Carolina', 'Ibáñez', 'Calle 18, Ciudad B', 'Ciudad B', '022-9000018', 'carolina.ibanez@autorental.com'),
(2, '20000019', 'Eduardo', 'Guerra', 'Calle 19, Ciudad B', 'Ciudad B', '022-9000019', 'eduardo.guerra@autorental.com'),
(2, '20000020', 'Claudia', 'Palacios', 'Calle 20, Ciudad B', 'Ciudad B', '022-9000020', 'claudia.palacios@autorental.com'),
(3, '30000011', 'Héctor', 'Serrano', 'Calle 11, Ciudad C', 'Ciudad C', '033-9000011', 'hector.serrano@autorental.com'),
(3, '30000012', 'Verónica', 'Noriega', 'Calle 12, Ciudad C', 'Ciudad C', '033-9000012', 'veronica.noriega@autorental.com'),
(3, '30000013', 'Mauricio', 'Barrios', 'Calle 13, Ciudad C', 'Ciudad C', '033-9000013', 'mauricio.barrios@autorental.com'),
(3, '30000014', 'Natalia', 'Estrada', 'Calle 14, Ciudad C', 'Ciudad C', '033-9000014', 'natalia.estrada@autorental.com'),
(3, '30000015', 'Rodrigo', 'Valencia', 'Calle 15, Ciudad C', 'Ciudad C', '033-9000015', 'rodrigo.valencia@autorental.com'),
(3, '30000016', 'Daniela', 'Calderón', 'Calle 16, Ciudad C', 'Ciudad C', '033-9000016', 'daniela.calderon@autorental.com'),
(3, '30000017', 'Pablo', 'Gámez', 'Calle 17, Ciudad C', 'Ciudad C', '033-9000017', 'pablo.gamez@autorental.com'),
(3, '30000018', 'María', 'Segura', 'Calle 18, Ciudad C', 'Ciudad C', '033-9000018', 'maria.segura@autorental.com'),
(3, '30000019', 'Ignacio', 'Bravo', 'Calle 19, Ciudad C', 'Ciudad C', '033-9000019', 'ignacio.bravo@autorental.com'),
(3, '30000020', 'Sofía', 'Marín', 'Calle 20, Ciudad C', 'Ciudad C', '033-9000020', 'sofia.marin@autorental.com'),
(4, '40000011', 'Mario', 'García', 'Calle 11, Ciudad D', 'Ciudad D', '044-9000011', 'mario.garcia@autorental.com'),
(4, '40000012', 'Liliana', 'Vega', 'Calle 12, Ciudad D', 'Ciudad D', '044-9000012', 'liliana.vega@autorental.com'),
(4, '40000013', 'Ricardo', 'Campos', 'Calle 13, Ciudad D', 'Ciudad D', '044-9000013', 'ricardo.campos@autorental.com'),
(4, '40000014', 'Ana', 'Montes', 'Calle 14, Ciudad D', 'Ciudad D', '044-9000014', 'ana.montes@autorental.com'),
(4, '40000015', 'Francisco', 'Gómez', 'Calle 15, Ciudad D', 'Ciudad D', '044-9000015', 'francisco.gomez@autorental.com'),
(4, '40000016', 'Andrea', 'Pineda', 'Calle 16, Ciudad D', 'Ciudad D', '044-9000016', 'andrea.pineda@autorental.com'),
(4, '40000017', 'Diego', 'Rivera', 'Calle 17, Ciudad D', 'Ciudad D', '044-9000017', 'diego.rivera@autorental.com'),
(4, '40000018', 'Valentina', 'Reyes', 'Calle 18, Ciudad D', 'Ciudad D', '044-9000018', 'valentina.reyes@autorental.com'),
(4, '40000019', 'Carlos', 'Medina', 'Calle 19, Ciudad D', 'Ciudad D', '044-9000019', 'carlos.medina@autorental.com'),
(4, '40000020', 'María', 'López', 'Calle 20, Ciudad D', 'Ciudad D', '044-9000020', 'maria.lopez@autorental.com'),
(5, '50000011', 'José', 'Mendoza', 'Calle 11, Ciudad E', 'Ciudad E', '055-9000011', 'jose.mendoza@autorental.com'),
(5, '50000012', 'Eva', 'Durán', 'Calle 12, Ciudad E', 'Ciudad E', '055-9000012', 'eva.duran@autorental.com'),
(5, '50000013', 'Ramón', 'Gil', 'Calle 13, Ciudad E', 'Ciudad E', '055-9000013', 'ramon.gil@autorental.com'),
(5, '50000014', 'Patricia', 'Navarro', 'Calle 14, Ciudad E', 'Ciudad E', '055-9000014', 'patricia.navarro@autorental.com'),
(5, '50000015', 'Ignacio', 'Reyes', 'Calle 15, Ciudad E', 'Ciudad E', '055-9000015', 'ignacio.reyes@autorental.com'),
(5, '50000016', 'Rocío', 'López', 'Calle 16, Ciudad E', 'Ciudad E', '055-9000016', 'rocio.lopez@autorental.com'),
(5, '50000017', 'Gabriel', 'Santos', 'Calle 17, Ciudad E', 'Ciudad E', '055-9000017', 'gabriel.santos@autorental.com'),
(5, '50000018', 'María', 'Campos', 'Calle 18, Ciudad E', 'Ciudad E', '055-9000018', 'maria.campos@autorental.com'),
(5, '50000019', 'Luis', 'Hernández', 'Calle 19, Ciudad E', 'Ciudad E', '055-9000019', 'luis.hernandez@autorental.com'),
(5, '50000020', 'Alicia', 'Vega', 'Calle 20, Ciudad E', 'Ciudad E', '055-9000020', 'alicia.vega@autorental.com');

-- Insert Clientes
INSERT INTO Cliente (cedula, nombres, apellidos, direccion, ciudadResidencia, celular, correoElectronico) VALUES
('10000001', 'Carlos', 'Pérez', 'Avenida 1, Ciudad A', 'Ciudad A', '099-1000001', 'carlos.perez@cliente.com'),
('10000002', 'Ana', 'González', 'Avenida 2, Ciudad A', 'Ciudad A', '099-1000002', 'ana.gonzalez@cliente.com'),
('10000003', 'Luis', 'Rodríguez', 'Avenida 3, Ciudad A', 'Ciudad A', '099-1000003', 'luis.rodriguez@cliente.com'),
('10000004', 'María', 'Martínez', 'Avenida 4, Ciudad A', 'Ciudad A', '099-1000004', 'maria.martinez@cliente.com'),
('10000005', 'Juan', 'Hernández', 'Avenida 5, Ciudad A', 'Ciudad A', '099-1000005', 'juan.hernandez@cliente.com'),
('10000006', 'Marta', 'López', 'Avenida 6, Ciudad A', 'Ciudad A', '099-1000006', 'marta.lopez@cliente.com'),
('10000007', 'Pedro', 'García', 'Avenida 7, Ciudad A', 'Ciudad A', '099-1000007', 'pedro.garcia@cliente.com'),
('10000008', 'Elena', 'Ramírez', 'Avenida 8, Ciudad A', 'Ciudad A', '099-1000008', 'elena.ramirez@cliente.com'),
('10000009', 'Diego', 'Fernández', 'Avenida 9, Ciudad A', 'Ciudad A', '099-1000009', 'diego.fernandez@cliente.com'),
('10000010', 'Laura', 'Sánchez', 'Avenida 10, Ciudad A', 'Ciudad A', '099-1000010', 'laura.sanchez@cliente.com'),
('20000001', 'Raúl', 'Torres', 'Avenida 1, Ciudad B', 'Ciudad B', '099-2000001', 'raul.torres@cliente.com'),
('20000002', 'Carmen', 'Flores', 'Avenida 2, Ciudad B', 'Ciudad B', '099-2000002', 'carmen.flores@cliente.com'),
('20000003', 'Miguel', 'Rivera', 'Avenida 3, Ciudad B', 'Ciudad B', '099-2000003', 'miguel.rivera@cliente.com'),
('20000004', 'Sandra', 'Jiménez', 'Avenida 4, Ciudad B', 'Ciudad B', '099-2000004', 'sandra.jimenez@cliente.com'),
('20000005', 'Pablo', 'Ruiz', 'Avenida 5, Ciudad B', 'Ciudad B', '099-2000005', 'pablo.ruiz@cliente.com'),
('20000006', 'Rosa', 'Moreno', 'Avenida 6, Ciudad B', 'Ciudad B', '099-2000006', 'rosa.moreno@cliente.com'),
('20000007', 'Jorge', 'Díaz', 'Avenida 7, Ciudad B', 'Ciudad B', '099-2000007', 'jorge.diaz@cliente.com'),
('20000008', 'Claudia', 'Álvarez', 'Avenida 8, Ciudad B', 'Ciudad B', '099-2000008', 'claudia.alvarez@cliente.com'),
('20000009', 'Francisco', 'Muñoz', 'Avenida 9, Ciudad B', 'Ciudad B', '099-2000009', 'francisco.munoz@cliente.com'),
('20000010', 'Verónica', 'Castro', 'Avenida 10, Ciudad B', 'Ciudad B', '099-2000010', 'veronica.castro@cliente.com'),
('30000001', 'Luis', 'Ortiz', 'Avenida 1, Ciudad C', 'Ciudad C', '099-3000001', 'luis.ortiz@cliente.com'),
('30000002', 'Gloria', 'Gutiérrez', 'Avenida 2, Ciudad C', 'Ciudad C', '099-3000002', 'gloria.gutierrez@cliente.com'),
('30000003', 'Carlos', 'Romero', 'Avenida 3, Ciudad C', 'Ciudad C', '099-3000003', 'carlos.romero@cliente.com'),
('30000004', 'Andrea', 'Molina', 'Avenida 4, Ciudad C', 'Ciudad C', '099-3000004', 'andrea.molina@cliente.com'),
('30000005', 'Felipe', 'Vargas', 'Avenida 5, Ciudad C', 'Ciudad C', '099-3000005', 'felipe.vargas@cliente.com'),
('30000006', 'Julia', 'Guerrero', 'Avenida 6, Ciudad C', 'Ciudad C', '099-3000006', 'julia.guerrero@cliente.com'),
('30000007', 'Ricardo', 'Pérez', 'Avenida 7, Ciudad C', 'Ciudad C', '099-3000007', 'ricardo.perez@cliente.com'),
('30000008', 'Nuria', 'Ramos', 'Avenida 8, Ciudad C', 'Ciudad C', '099-3000008', 'nuria.ramos@cliente.com'),
('30000009', 'Oscar', 'Sosa', 'Avenida 9, Ciudad C', 'Ciudad C', '099-3000009', 'oscar.sosa@cliente.com'),
('30000010', 'Patricia', 'Benítez', 'Avenida 10, Ciudad C', 'Ciudad C', '099-3000010', 'patricia.benitez@cliente.com'),
('40000001', 'Daniel', 'Herrera', 'Avenida 1, Ciudad D', 'Ciudad D', '099-4000001', 'daniel.herrera@cliente.com'),
('40000002', 'Estela', 'Medina', 'Avenida 2, Ciudad D', 'Ciudad D', '099-4000002', 'estela.medina@cliente.com'),
('40000003', 'Hugo', 'Cortés', 'Avenida 3, Ciudad D', 'Ciudad D', '099-4000003', 'hugo.cortes@cliente.com'),
('40000004', 'Nadia', 'Pineda', 'Avenida 4, Ciudad D', 'Ciudad D', '099-4000004', 'nadia.pineda@cliente.com'),
('40000005', 'Rodrigo', 'Delgado', 'Avenida 5, Ciudad D', 'Ciudad D', '099-4000005', 'rodrigo.delgado@cliente.com'),
('40000006', 'Mariana', 'Maldonado', 'Avenida 6, Ciudad D', 'Ciudad D', '099-4000006', 'mariana.maldonado@cliente.com'),
('40000007', 'Ángel', 'Ríos', 'Avenida 7, Ciudad D', 'Ciudad D', '099-4000007', 'angel.rios@cliente.com'),
('40000008', 'Lucía', 'Cabrera', 'Avenida 8, Ciudad D', 'Ciudad D', '099-4000008', 'lucia.cabrera@cliente.com'),
('40000009', 'Gustavo', 'Campos', 'Avenida 9, Ciudad D', 'Ciudad D', '099-4000009', 'gustavo.campos@cliente.com'),
('40000010', 'Elisa', 'Peña', 'Avenida 10, Ciudad D', 'Ciudad D', '099-4000010', 'elisa.pena@cliente.com'),
('50000001', 'Raúl', 'Reyes', 'Avenida 1, Ciudad E', 'Ciudad E', '099-5000001', 'raul.reyes@cliente.com'),
('50000002', 'Gabriela', 'Navarro', 'Avenida 2, Ciudad E', 'Ciudad E', '099-5000002', 'gabriela.navarro@cliente.com'),
('50000003', 'Fernando', 'Ortega', 'Avenida 3, Ciudad E', 'Ciudad E', '099-5000003', 'fernando.ortega@cliente.com'),
('50000004', 'Alejandra', 'Mendoza', 'Avenida 4, Ciudad E', 'Ciudad E', '099-5000004', 'alejandra.mendoza@cliente.com'),
('50000005', 'Santiago', 'Suárez', 'Avenida 5, Ciudad E', 'Ciudad E', '099-5000005', 'santiago.suarez@cliente.com'),
('50000006', 'Verónica', 'Vargas', 'Avenida 6, Ciudad E', 'Ciudad E', '099-5000006', 'veronica.vargas@cliente.com'),
('50000007', 'Emilio', 'Cruz', 'Avenida 7, Ciudad E', 'Ciudad E', '099-5000007', 'emilio.cruz@cliente.com'),
('50000008', 'Daniela', 'Rojas', 'Avenida 8, Ciudad E', 'Ciudad E', '099-5000008', 'daniela.rojas@cliente.com'),
('50000009', 'Antonio', 'Chávez', 'Avenida 9, Ciudad E', 'Ciudad E', '099-5000009', 'antonio.chavez@cliente.com'),
('50000010', 'Beatriz', 'Aguilar', 'Avenida 10, Ciudad E', 'Ciudad E', '099-5000010', 'beatriz.aguilar@cliente.com'),
('10000011', 'Marcos', 'Ortiz', 'Calle 1, Ciudad A', 'Ciudad A', '099-1000011', 'marcos.ortiz@cliente.com'),
('10000012', 'Clara', 'Guzmán', 'Calle 2, Ciudad A', 'Ciudad A', '099-1000012', 'clara.guzman@cliente.com'),
('10000013', 'Javier', 'Castillo', 'Calle 3, Ciudad A', 'Ciudad A', '099-1000013', 'javier.castillo@cliente.com'),
('10000014', 'Teresa', 'Luna', 'Calle 4, Ciudad A', 'Ciudad A', '099-1000014', 'teresa.luna@cliente.com'),
('10000015', 'Héctor', 'Ramos', 'Calle 5, Ciudad A', 'Ciudad A', '099-1000015', 'hector.ramos@cliente.com'),
('10000016', 'Paula', 'Gil', 'Calle 6, Ciudad A', 'Ciudad A', '099-1000016', 'paula.gil@cliente.com'),
('10000017', 'Andrés', 'Ibáñez', 'Calle 7, Ciudad A', 'Ciudad A', '099-1000017', 'andres.ibanez@cliente.com'),
('10000018', 'Lorena', 'Castro', 'Calle 8, Ciudad A', 'Ciudad A', '099-1000018', 'lorena.castro@cliente.com'),
('10000019', 'Manuel', 'Vega', 'Calle 9, Ciudad A', 'Ciudad A', '099-1000019', 'manuel.vega@cliente.com'),
('10000020', 'Cristina', 'González', 'Calle 10, Ciudad A', 'Ciudad A', '099-1000020', 'cristina.gonzalez@cliente.com'),
('20000011', 'Mario', 'Espinoza', 'Calle 1, Ciudad B', 'Ciudad B', '099-2000011', 'mario.espinoza@cliente.com'),
('20000012', 'Silvia', 'Paredes', 'Calle 2, Ciudad B', 'Ciudad B', '099-2000012', 'silvia.paredes@cliente.com'),
('20000013', 'David', 'Reyes', 'Calle 3, Ciudad B', 'Ciudad B', '099-2000013', 'david.reyes@cliente.com'),
('20000014', 'Natalia', 'Ávila', 'Calle 4, Ciudad B', 'Ciudad B', '099-2000014', 'natalia.avila@cliente.com'),
('20000015', 'Guillermo', 'Soto', 'Calle 5, Ciudad B', 'Ciudad B', '099-2000015', 'guillermo.soto@cliente.com'),
('20000016', 'Cecilia', 'Camacho', 'Calle 6, Ciudad B', 'Ciudad B', '099-2000016', 'cecilia.camacho@cliente.com'),
('20000017', 'Mauricio', 'Vidal', 'Calle 7, Ciudad B', 'Ciudad B', '099-2000017', 'mauricio.vidal@cliente.com'),
('20000018', 'Rebeca', 'Núñez', 'Calle 8, Ciudad B', 'Ciudad B', '099-2000018', 'rebeca.nunez@cliente.com'),
('20000019', 'Fabián', 'Herrera', 'Calle 9, Ciudad B', 'Ciudad B', '099-2000019', 'fabian.herrera@cliente.com'),
('20000020', 'Sofía', 'Márquez', 'Calle 10, Ciudad B', 'Ciudad B', '099-2000020', 'sofia.marquez@cliente.com'),
('30000011', 'Adrián', 'Campos', 'Calle 1, Ciudad C', 'Ciudad C', '099-3000011', 'adrian.campos@cliente.com'),
('30000012', 'Mónica', 'Garrido', 'Calle 2, Ciudad C', 'Ciudad C', '099-3000012', 'monica.garrido@cliente.com'),
('30000013', 'Ramiro', 'Nieves', 'Calle 3, Ciudad C', 'Ciudad C', '099-3000013', 'ramiro.nieves@cliente.com'),
('30000014', 'Susana', 'Quintero', 'Calle 4, Ciudad C', 'Ciudad C', '099-3000014', 'susana.quintero@cliente.com'),
('30000015', 'Gonzalo', 'Serrano', 'Calle 5, Ciudad C', 'Ciudad C', '099-3000015', 'gonzalo.serrano@cliente.com'),
('30000016', 'Ariana', 'Durán', 'Calle 6, Ciudad C', 'Ciudad C', '099-3000016', 'ariana.duran@cliente.com'),
('30000017', 'Tomás', 'Tapia', 'Calle 7, Ciudad C', 'Ciudad C', '099-3000017', 'tomas.tapia@cliente.com'),
('30000018', 'Isabel', 'Salgado', 'Calle 8, Ciudad C', 'Ciudad C', '099-3000018', 'isabel.salgado@cliente.com'),
('30000019', 'Ernesto', 'Ávila', 'Calle 9, Ciudad C', 'Ciudad C', '099-3000019', 'ernesto.avila@cliente.com'),
('30000020', 'Claudia', 'Zamora', 'Calle 10, Ciudad C', 'Ciudad C', '099-3000020', 'claudia.zamora@cliente.com'),
('40000011', 'Rubén', 'Valdés', 'Calle 1, Ciudad D', 'Ciudad D', '099-4000011', 'ruben.valdes@cliente.com'),
('40000012', 'Lorena', 'Reyes', 'Calle 2, Ciudad D', 'Ciudad D', '099-4000012', 'lorena.reyes@cliente.com'),
('40000013', 'Miguel', 'Arévalo', 'Calle 3, Ciudad D', 'Ciudad D', '099-4000013', 'miguel.arevalo@cliente.com'),
('40000014', 'Marcela', 'Montalvo', 'Calle 4, Ciudad D', 'Ciudad D', '099-4000014', 'marcela.montalvo@cliente.com'),
('40000015', 'Luis', 'Porras', 'Calle 5, Ciudad D', 'Ciudad D', '099-4000015', 'luis.porras@cliente.com'),
('40000016', 'Diana', 'Crespo', 'Calle 6, Ciudad D', 'Ciudad D', '099-4000016', 'diana.crespo@cliente.com'),
('40000017', 'Raúl', 'Méndez', 'Calle 7, Ciudad D', 'Ciudad D', '099-4000017', 'raul.mendez@cliente.com'),
('40000018', 'Rocío', 'Estévez', 'Calle 8, Ciudad D', 'Ciudad D', '099-4000018', 'rocio.estevez@cliente.com'),
('40000019', 'Gustavo', 'Lara', 'Calle 9, Ciudad D', 'Ciudad D', '099-4000019', 'gustavo.lara@cliente.com'),
('40000020', 'Sofía', 'Pacheco', 'Calle 10, Ciudad D', 'Ciudad D', '099-4000020', 'sofia.pacheco@cliente.com'),
('50000011', 'Marcos', 'Navarro', 'Calle 1, Ciudad E', 'Ciudad E', '099-5000011', 'marcos.navarro@cliente.com'),
('50000012', 'Alicia', 'Valle', 'Calle 2, Ciudad E', 'Ciudad E', '099-5000012', 'alicia.valle@cliente.com'),
('50000013', 'René', 'Franco', 'Calle 3, Ciudad E', 'Ciudad E', '099-5000013', 'rene.franco@cliente.com'),
('50000014', 'Gloria', 'Barrera', 'Calle 4, Ciudad E', 'Ciudad E', '099-5000014', 'gloria.barrera@cliente.com'),
('50000015', 'Vicente', 'Villalobos', 'Calle 5, Ciudad E', 'Ciudad E', '099-5000015', 'vicente.villalobos@cliente.com'),
('50000016', 'Valeria', 'Velasco', 'Calle 6, Ciudad E', 'Ciudad E', '099-5000016', 'valeria.velasco@cliente.com'),
('50000017', 'Alberto', 'Salinas', 'Calle 7, Ciudad E', 'Ciudad E', '099-5000017', 'alberto.salinas@cliente.com'),
('50000018', 'Mónica', 'Rangel', 'Calle 8, Ciudad E', 'Ciudad E', '099-5000018', 'monica.rangel@cliente.com'),
('50000019', 'Edgar', 'Arrieta', 'Calle 9, Ciudad E', 'Ciudad E', '099-5000019', 'edgar.arrieta@cliente.com'),
('50000020', 'Inés', 'Sánchez', 'Calle 10, Ciudad E', 'Ciudad E', '099-5000020', 'ines.sanchez@cliente.com');

-- Inserts Vehiculos
INSERT INTO Vehiculo (tipo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) VALUES
('Sedán', 'ABC001', 'Toyota Corolla', 2021, 4, 5, 'No', '1.8L', 'Blanco'),
('Compacto', 'ABC002', 'Honda Fit', 2020, 4, 5, 'No', '1.5L', 'Negro'),
('Camioneta Platón', 'ABC003', 'Ford Ranger', 2022, 4, 5, 'No', '2.0L', 'Azul'),
('Camioneta Lujo', 'ABC004', 'BMW X5', 2021, 4, 5, 'Sí', '3.0L', 'Gris'),
('Deportivo', 'ABC005', 'Porsche 911', 2022, 2, 2, 'Sí', '3.0L', 'Rojo'),
('Sedán', 'ABC006', 'Hyundai Elantra', 2021, 4, 5, 'No', '2.0L', 'Blanco'),
('Compacto', 'ABC007', 'Volkswagen Golf', 2020, 4, 5, 'No', '1.4L', 'Negro'),
('Camioneta Platón', 'ABC008', 'Toyota Hilux', 2022, 4, 5, 'No', '2.4L', 'Blanco'),
('Camioneta Lujo', 'ABC009', 'Audi Q7', 2021, 4, 7, 'Sí', '3.0L', 'Negro'),
('Deportivo', 'ABC010', 'Ferrari F8', 2022, 2, 2, 'Sí', '3.9L', 'Rojo'),
('Sedán', 'ABC011', 'Mazda 3', 2021, 4, 5, 'No', '2.5L', 'Gris'),
('Compacto', 'ABC012', 'Ford Fiesta', 2020, 4, 5, 'No', '1.6L', 'Azul'),
('Camioneta Platón', 'ABC013', 'Chevrolet Colorado', 2022, 4, 5, 'No', '2.8L', 'Rojo'),
('Camioneta Lujo', 'ABC014', 'Mercedes-Benz GLE', 2021, 4, 5, 'Sí', '3.0L', 'Blanco'),
('Deportivo', 'ABC015', 'Lamborghini Huracán', 2022, 2, 2, 'Sí', '5.2L', 'Amarillo'),
('Sedán', 'ABC016', 'Kia Optima', 2021, 4, 5, 'No', '2.4L', 'Negro'),
('Compacto', 'ABC017', 'Nissan Versa', 2020, 4, 5, 'No', '1.6L', 'Gris'),
('Camioneta Platón', 'ABC018', 'Mitsubishi L200', 2022, 4, 5, 'No', '2.5L', 'Azul'),
('Camioneta Lujo', 'ABC019', 'Lexus RX', 2021, 4, 5, 'Sí', '3.5L', 'Blanco'),
('Deportivo', 'ABC020', 'Aston Martin Vantage', 2022, 2, 2, 'Sí', '4.0L', 'Verde'),
('Sedán', 'ABC021', 'Subaru Impreza', 2021, 4, 5, 'No', '2.0L', 'Blanco'),
('Compacto', 'ABC022', 'Chevrolet Spark', 2020, 4, 4, 'No', '1.4L', 'Rojo'),
('Camioneta Platón', 'ABC023', 'Nissan Frontier', 2022, 4, 5, 'No', '2.3L', 'Negro'),
('Camioneta Lujo', 'ABC024', 'Range Rover Sport', 2021, 4, 5, 'Sí', '3.0L', 'Gris'),
('Deportivo', 'ABC025', 'McLaren 720S', 2022, 2, 2, 'Sí', '4.0L', 'Naranja'),
('Sedán', 'ABC026', 'Honda Accord', 2021, 4, 5, 'No', '1.5L', 'Azul'),
('Compacto', 'ABC027', 'Toyota Yaris', 2020, 4, 5, 'No', '1.5L', 'Blanco'),
('Camioneta Platón', 'ABC028', 'Isuzu D-Max', 2022, 4, 5, 'No', '3.0L', 'Gris'),
('Camioneta Lujo', 'ABC029', 'Volvo XC90', 2021, 4, 7, 'Sí', '2.0L', 'Negro'),
('Deportivo', 'ABC030', 'Bugatti Chiron', 2022, 2, 2, 'Sí', '8.0L', 'Azul'),
('Sedán', 'ABC031', 'Ford Fusion', 2021, 4, 5, 'No', '2.5L', 'Negro'),
('Compacto', 'ABC032', 'Mazda 2', 2020, 4, 5, 'No', '1.5L', 'Rojo'),
('Camioneta Platón', 'ABC033', 'Volkswagen Amarok', 2022, 4, 5, 'No', '3.0L', 'Blanco'),
('Camioneta Lujo', 'ABC034', 'Porsche Cayenne', 2021, 4, 5, 'Sí', '3.0L', 'Rojo'),
('Deportivo', 'ABC035', 'Chevrolet Corvette', 2022, 2, 2, 'Sí', '6.2L', 'Amarillo'),
('Sedán', 'ABC036', 'Volkswagen Passat', 2021, 4, 5, 'No', '2.0L', 'Gris'),
('Compacto', 'ABC037', 'Hyundai i20', 2020, 4, 5, 'No', '1.2L', 'Azul'),
('Camioneta Platón', 'ABC038', 'Jeep Gladiator', 2022, 4, 5, 'No', '3.6L', 'Negro'),
('Camioneta Lujo', 'ABC039', 'Tesla Model X', 2021, 4, 7, 'Sí', 'Eléctrico', 'Blanco'),
('Deportivo', 'ABC040', 'Ford Mustang', 2022, 2, 2, 'Sí', '5.0L', 'Rojo'),
('Sedán', 'ABC041', 'Chevrolet Malibu', 2021, 4, 5, 'No', '1.5L', 'Azul'),
('Compacto', 'ABC042', 'Kia Rio', 2020, 4, 5, 'No', '1.6L', 'Negro'),
('Camioneta Platón', 'ABC043', 'Mazda BT-50', 2022, 4, 5, 'No', '3.2L', 'Blanco'),
('Camioneta Lujo', 'ABC044', 'Infiniti QX80', 2021, 4, 7, 'Sí', '5.6L', 'Gris'),
('Deportivo', 'ABC045', 'Nissan GT-R', 2022, 2, 2, 'Sí', '3.8L', 'Blanco'),
('Sedán', 'ABC046', 'Renault Megane', 2021, 4, 5, 'No', '1.6L', 'Rojo'),
('Compacto', 'ABC047', 'Peugeot 208', 2020, 4, 5, 'No', '1.2L', 'Gris'),
('Camioneta Platón', 'ABC048', 'Ram 1500', 2022, 4, 5, 'No', '5.7L', 'Negro'),
('Camioneta Lujo', 'ABC049', 'Acura MDX', 2021, 4, 7, 'Sí', '3.5L', 'Blanco'),
('Deportivo', 'ABC050', 'Jaguar F-Type', 2022, 2, 2, 'Sí', '5.0L', 'Azul'),
('Sedán', 'ABC051', 'Toyota Camry', 2021, 4, 5, 'No', '2.5L', 'Negro'),
('Compacto', 'ABC052', 'Suzuki Swift', 2020, 4, 5, 'No', '1.2L', 'Blanco'),
('Camioneta Platón', 'ABC053', 'Chevrolet Silverado', 2022, 4, 5, 'No', '6.2L', 'Gris'),
('Camioneta Lujo', 'ABC054', 'Cadillac Escalade', 2021, 4, 7, 'Sí', '6.2L', 'Negro'),
('Deportivo', 'ABC055', 'Dodge Challenger', 2022, 2, 2, 'Sí', '6.4L', 'Rojo'),
('Sedán', 'ABC056', 'Honda Civic', 2021, 4, 5, 'No', '2.0L', 'Blanco'),
('Compacto', 'ABC057', 'Fiat 500', 2020, 4, 4, 'No', '1.4L', 'Rojo'),
('Camioneta Platón', 'ABC058', 'Ford F-150', 2022, 4, 5, 'No', '5.0L', 'Negro'),
('Camioneta Lujo', 'ABC059', 'Genesis GV80', 2021, 4, 5, 'Sí', '3.5L', 'Blanco'),
('Deportivo', 'ABC060', 'Lotus Evora', 2022, 2, 2, 'Sí', '3.5L', 'Verde'),
('Sedán', 'ABC061', 'Mercedes-Benz E-Class', 2021, 4, 5, 'No', '2.0L', 'Gris'),
('Compacto', 'ABC062', 'Mini Cooper', 2020, 4, 4, 'No', '1.5L', 'Azul'),
('Camioneta Platón', 'ABC063', 'Toyota Tacoma', 2022, 4, 5, 'No', '3.5L', 'Rojo'),
('Camioneta Lujo', 'ABC064', 'Audi Q5', 2021, 4, 5, 'Sí', '2.0L', 'Negro'),
('Deportivo', 'ABC065', 'Alfa Romeo 4C', 2022, 2, 2, 'Sí', '1.7L', 'Rojo'),
('Sedán', 'ABC066', 'Nissan Altima', 2021, 4, 5, 'No', '2.5L', 'Azul'),
('Compacto', 'ABC067', 'Chevrolet Sonic', 2020, 4, 5, 'No', '1.8L', 'Blanco'),
('Camioneta Platón', 'ABC068', 'GMC Canyon', 2022, 4, 5, 'No', '3.6L', 'Gris'),
('Camioneta Lujo', 'ABC069', 'Land Rover Discovery', 2021, 4, 5, 'Sí', '3.0L', 'Blanco'),
('Deportivo', 'ABC070', 'Subaru BRZ', 2022, 2, 2, 'Sí', '2.4L', 'Azul'),
('Sedán', 'ABC071', 'Chrysler 300', 2021, 4, 5, 'No', '3.6L', 'Negro'),
('Compacto', 'ABC072', 'Renault Clio', 2020, 4, 5, 'No', '1.5L', 'Rojo'),
('Camioneta Platón', 'ABC073', 'Nissan Titan', 2022, 4, 5, 'No', '5.6L', 'Negro'),
('Camioneta Lujo', 'ABC074', 'BMW X3', 2021, 4, 5, 'Sí', '2.0L', 'Gris'),
('Deportivo', 'ABC075', 'Toyota Supra', 2022, 2, 2, 'Sí', '3.0L', 'Blanco'),
('Sedán', 'ABC076', 'Audi A4', 2021, 4, 5, 'No', '2.0L', 'Negro'),
('Compacto', 'ABC077', 'Ford Focus', 2020, 4, 5, 'No', '2.0L', 'Blanco'),
('Camioneta Platón', 'ABC078', 'Chevrolet Colorado', 2022, 4, 5, 'No', '2.8L', 'Azul'),
('Camioneta Lujo', 'ABC079', 'Mercedes-Benz GLC', 2021, 4, 5, 'Sí', '2.0L', 'Gris'),
('Deportivo', 'ABC080', 'Lexus LC', 2022, 2, 2, 'Sí', '5.0L', 'Rojo'),
('Sedán', 'ABC081', 'Genesis G70', 2021, 4, 5, 'No', '2.0L', 'Blanco'),
('Compacto', 'ABC082', 'Honda Fit', 2020, 4, 5, 'No', '1.5L', 'Gris'),
('Camioneta Platón', 'ABC083', 'Toyota Hilux', 2022, 4, 5, 'No', '2.4L', 'Blanco'),
('Camioneta Lujo', 'ABC084', 'Range Rover Evoque', 2021, 4, 5, 'Sí', '2.0L', 'Negro'),
('Deportivo', 'ABC085', 'Jaguar F-Type', 2022, 2, 2, 'Sí', '5.0L', 'Azul'),
('Sedán', 'ABC086', 'Volkswagen Jetta', 2021, 4, 5, 'No', '1.4L', 'Rojo'),
('Compacto', 'ABC087', 'Toyota Yaris', 2020, 4, 5, 'No', '1.5L', 'Negro'),
('Camioneta Platón', 'ABC088', 'Mazda BT-50', 2022, 4, 5, 'No', '3.2L', 'Gris'),
('Camioneta Lujo', 'ABC089', 'Volvo XC90', 2021, 4, 7, 'Sí', '2.0L', 'Blanco'),
('Deportivo', 'ABC090', 'Ferrari F8', 2022, 2, 2, 'Sí', '3.9L', 'Rojo'),
('Sedán', 'ABC091', 'Chevrolet Malibu', 2021, 4, 5, 'No', '1.5L', 'Gris'),
('Compacto', 'ABC092', 'Volkswagen Golf', 2020, 4, 5, 'No', '1.4L', 'Blanco'),
('Camioneta Platón', 'ABC093', 'Nissan Frontier', 2022, 4, 5, 'No', '2.3L', 'Rojo'),
('Camioneta Lujo', 'ABC094', 'Audi Q7', 2021, 4, 7, 'Sí', '3.0L', 'Negro'),
('Deportivo', 'ABC095', 'Porsche 911', 2022, 2, 2, 'Sí', '3.0L', 'Blanco'),
('Sedán', 'ABC096', 'Hyundai Elantra', 2021, 4, 5, 'No', '2.0L', 'Azul'),
('Compacto', 'ABC097', 'Ford Fiesta', 2020, 4, 5, 'No', '1.6L', 'Rojo'),
('Camioneta Platón', 'ABC098', 'Chevrolet Colorado', 2022, 4, 5, 'No', '2.8L', 'Gris'),
('Camioneta Lujo', 'ABC099', 'Mercedes-Benz GLE', 2021, 4, 5, 'Sí', '3.0L', 'Blanco'),
('Deportivo', 'ABC100', 'Lamborghini Huracán', 2022, 2, 2, 'Sí', '5.2L', 'Negro');

-- Inserts Alquiler
INSERT INTO Alquiler (idVehiculo, idCliente, idEmpleado, idSucursalSalida, idSucursalLlegada, fechaSalida, fechaLlegada, fechaEsperadaLlegada, valorAlquilerSemana, valorAlquilerDia, porcentajeDescuento, valorCotizado, valorPagado)
VALUES
(1, 1, 1, 1, 2, '2023-01-01', '2023-01-07', '2023-01-07', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-01-08', '2023-01-14', '2023-01-14', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-01-15', '2023-01-21', '2023-01-21', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-01-22', '2023-01-28', '2023-01-28', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-01-29', '2023-02-04', '2023-02-04', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-02-05', '2023-02-11', '2023-02-11', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-02-12', '2023-02-18', '2023-02-18', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-02-19', '2023-02-25', '2023-02-25', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-02-26', '2023-03-04', '2023-03-04', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-03-05', '2023-03-11', '2023-03-11', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-03-12', '2023-03-18', '2023-03-18', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-03-19', '2023-03-25', '2023-03-25', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-03-26', '2023-04-01', '2023-04-01', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-04-02', '2023-04-08', '2023-04-08', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-04-09', '2023-04-15', '2023-04-15', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-04-16', '2023-04-22', '2023-04-22', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-04-23', '2023-04-29', '2023-04-29', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-04-30', '2023-05-06', '2023-05-06', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-05-07', '2023-05-13', '2023-05-13', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-05-14', '2023-05-20', '2023-05-20', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-05-21', '2023-05-27', '2023-05-27', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-05-28', '2023-06-03', '2023-06-03', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-06-04', '2023-06-10', '2023-06-10', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-06-11', '2023-06-17', '2023-06-17', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-06-18', '2023-06-24', '2023-06-24', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-06-25', '2023-07-01', '2023-07-01', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-07-02', '2023-07-08', '2023-07-08', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-07-09', '2023-07-15', '2023-07-15', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-07-16', '2023-07-22', '2023-07-22', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-07-23', '2023-07-29', '2023-07-29', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-07-30', '2023-08-05', '2023-08-05', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-08-06', '2023-08-12', '2023-08-12', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-08-13', '2023-08-19', '2023-08-19', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-08-20', '2023-08-26', '2023-08-26', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-08-27', '2023-09-02', '2023-09-02', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-09-03', '2023-09-09', '2023-09-09', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-09-10', '2023-09-16', '2023-09-16', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-09-17', '2023-09-23', '2023-09-23', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-09-24', '2023-09-30', '2023-09-30', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-10-01', '2023-10-07', '2023-10-07', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-10-08', '2023-10-14', '2023-10-14', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-10-15', '2023-10-21', '2023-10-21', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-10-22', '2023-10-28', '2023-10-28', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-10-29', '2023-11-04', '2023-11-04', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-11-05', '2023-11-11', '2023-11-11', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-11-12', '2023-11-18', '2023-11-18', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-11-19', '2023-11-25', '2023-11-25', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-11-26', '2023-12-02', '2023-12-02', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-12-03', '2023-12-09', '2023-12-09', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-12-10', '2023-12-16', '2023-12-16', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2023-12-17', '2023-12-23', '2023-12-23', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2023-12-24', '2023-12-30', '2023-12-30', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2023-12-31', '2024-01-06', '2024-01-06', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-01-07', '2024-01-13', '2024-01-13', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-01-14', '2024-01-20', '2024-01-20', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-01-21', '2024-01-27', '2024-01-27', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-01-28', '2024-02-03', '2024-02-03', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-02-04', '2024-02-10', '2024-02-10', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-02-11', '2024-02-17', '2024-02-17', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-02-18', '2024-02-24', '2024-02-24', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-02-25', '2024-03-02', '2024-03-02', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-03-03', '2024-03-09', '2024-03-09', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-03-10', '2024-03-16', '2024-03-16', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-03-17', '2024-03-23', '2024-03-23', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-03-24', '2024-03-30', '2024-03-30', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-03-31', '2024-04-06', '2024-04-06', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-04-07', '2024-04-13', '2024-04-13', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-04-14', '2024-04-20', '2024-04-20', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-04-21', '2024-04-27', '2024-04-27', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-04-28', '2024-05-04', '2024-05-04', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-05-05', '2024-05-11', '2024-05-11', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-05-12', '2024-05-18', '2024-05-18', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-05-19', '2024-05-25', '2024-05-25', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-05-26', '2024-06-01', '2024-06-01', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-06-02', '2024-06-08', '2024-06-08', 800.00, 110.00, 5.00, 760.00, 760.00),
(1, 1, 1, 1, 2, '2024-06-09', '2024-06-15', '2024-06-15', 700.00, 100.00, 10.00, 630.00, 630.00),
(2, 2, 2, 2, 3, '2024-06-16', '2024-06-22', '2024-06-22', 900.00, 130.00, 15.00, 765.00, 765.00),
(3, 3, 3, 3, 1, '2024-06-23', '2024-06-29', '2024-06-29', 800.00, 110.00, 5.00, 760.00, 760.00);

CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY 'contraseña_admin';
GRANT ALL PRIVILEGES ON *.* TO 'usuario_admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'usuario_restringido'@'localhost' IDENTIFIED BY 'contraseña_restringido';
GRANT SELECT, INSERT, UPDATE ON basededatos.Alquiler TO 'usuario_restringido'@'localhost';
GRANT SELECT ON basededatos.Cliente TO 'usuario_restringido'@'localhost';
FLUSH PRIVILEGES;

DELIMITER //

CREATE TRIGGER ActualizarValorPagado
BEFORE INSERT ON Alquiler
FOR EACH ROW
BEGIN
    DECLARE valor_total DECIMAL(10, 2);
    
    -- Calcular el valor total pagado (por ejemplo, basado en ValorCotizado y PorcentajeDescuento)
    SET valor_total = NEW.ValorCotizado - (NEW.ValorCotizado * (NEW.PorcentajeDescuento / 100));
    
    -- Asignar el valor calculado a ValorPagado
    SET NEW.ValorPagado = valor_total;
END //

DELIMITER ;

CREATE TABLE Empleado_Auditoria (
    OperacionID INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoID INT,
    Operacion VARCHAR(100),
    FechaOperacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER RegistrarModificacionEmpleado
AFTER UPDATE ON Empleado
FOR EACH ROW
BEGIN
    INSERT INTO Empleado_Auditoria (EmpleadoID, Operacion)
    VALUES (OLD.ID, CONCAT('Actualización de datos de empleado ID ', OLD.ID));
END //

DELIMITER ;

CREATE EVENT ActualizarEstadoAlquileres
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
    UPDATE Alquiler
    SET Estado = 'Vencido'
    WHERE FechaEsperadaLlegada < CURDATE() AND Estado != 'Finalizado';

CREATE EVENT GenerarReporteEmpleados
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
    INSERT INTO ReporteEmpleados (SucursalID, EmpleadosActivos, FechaGeneracion)
    SELECT e.SucursalID, COUNT(e.ID) AS EmpleadosActivos, CURDATE() AS FechaGeneracion
    FROM Empleado e
    WHERE e.Estado = 'Activo'
    GROUP BY e.SucursalID;


