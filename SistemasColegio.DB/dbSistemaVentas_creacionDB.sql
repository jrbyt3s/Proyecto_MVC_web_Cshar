CREATE DATABASE dbVentas;
USE dbVentas;

--DROP database dbVentas;
--SET LANGUAGE ENGLISH;
CREATE TABLE Cliente
(
Codigo SMALLINT PRIMARY KEY IDENTITY(1,1),
Nombres VARCHAR(50) NOT NULL,
Apellidos VARCHAR(50) NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Ciudad VARCHAR(50) NOT NULL,
FechaNacimiento DATE NOT NULL,
);

CREATE TABLE Productos
(
Codigo INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Stock INT NOT NULL,
Precio DECIMAL(18, 2) NOT NULL
);

--TABLA VENTA:
CREATE TABLE Venta
(
Codigo INT PRIMARY KEY IDENTITY(1,1),
Fecha DATETIME NOT NULL,
CodigoCliente SMALLINT NOT NULL,
Monto DECIMAL(18,2),
FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);

CREATE TABLE DetalleVenta
(
    CodigoDetalle INT PRIMARY KEY IDENTITY(1,1),
	CodigoVenta INT NOT NULL,
	CodigoProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio DECIMAL(18, 2) NOT NULL,
    SubTotal DECIMAL(18, 2) NOT NULL,
	FOREIGN KEY (CodigoVenta) REFERENCES Venta(codigo),
	FOREIGN KEY (CodigoProducto) REFERENCES Productos(codigo),
);

-- Poblando las Tablas:

INSERT INTO Productos (Nombre, Stock, Precio)
VALUES
    ('Laptop EliteBook', 50, 20.00),
    ('Monitor UltraWide', 30, 12.00),
    ('Teclado Mecánico', 10, 10.00),
    ('Impresora LaserJet', 25, 150.00),
    ('Disco Duro Externo 512GB', 15, 80.00),
    ('Tablet Galaxy Tab', 20, 200.00),
    ('Mouse Ergonómico', 40, 15.00),
    ('All-in-One Inspiron', 5, 700.00),
    ('Chromebook Spin', 12, 300.00),
    ('iMac Pro', 8, 2500.00),
    ('MacBook Air', 18, 1200.00),
    ('Monitor Predator', 22, 600.00),
    ('Laptop ThinkPad', 30, 1300.00),
    ('Teclado Bluetooth', 15, 40.00),
    ('Impresora DeskJet', 28, 80.00),
    ('Disco SSD Evo', 10, 130.00),
    ('Tablet Surface Pro', 25, 900.00),
    ('Mouse Gaming G502', 20, 60.00),
    ('All-in-One Vivo AiO', 7, 800.00),
    ('iMac 27 pulgadas', 10, 1800.00),
    ('Laptop Alienware Aurora', 50, 2000.00),
    ('Monitor LG UltraGear', 35, 550.00),
    ('Teclado Razer BlackWidow', 15, 130.00),
    ('Impresora Canon PIXMA', 20, 90.00),
    ('Disco Duro Externo Seagate Backup Plus', 12, 120.00),
    ('Tablet Samsung Galaxy Tab S7', 18, 500.00),
    ('Mouse Logitech MX Master 3', 30, 80.00),
    ('All-in-One HP Envy', 8, 800.00),
    ('Chromebook Acer Spin 13', 10, 400.00),
    ('iMac 24 pulgadas', 25, 1400.00),
    ('MacBook Pro M1', 22, 1500.00),
    ('Monitor ASUS ROG Swift', 28, 700.00),
    ('Laptop MSI Stealth', 40, 1800.00),
    ('Teclado Corsair K95 RGB', 5, 150.00),
    ('Impresora Epson EcoTank', 32, 250.00),
    ('Disco SSD Crucial MX500', 14, 110.00),
    ('Tablet Lenovo Tab P11 Pro', 23, 600.00),
    ('Mouse SteelSeries Rival 600', 20, 70.00),
    ('All-in-One Dell Inspiron', 6, 650.00),
    ('iMac 27 pulgadas (2021)', 15, 2200.00);

INSERT INTO Cliente (Nombres, Apellidos, Direccion, Ciudad, FechaNacimiento)
VALUES
    ('Ricardo', 'López', 'Calle 789', 'Bogotá', '1994-02-12'),
    ('Carolina', 'García', 'Av. Principal', 'Medellín', '1989-07-18'),
    ('Fernando', 'Martínez', 'Calle 456', 'Cali', '1991-11-05'),
    ('Gabriela', 'Hernández', 'Carrera 101', 'Barranquilla', '1996-04-30'),
    ('Andrea', 'Díaz', 'Calle 234', 'Cartagena', '1993-09-22'),
    ('Alejandro', 'Torres', 'Av. Libertad', 'Bucaramanga', '1990-03-15'),
    ('Valeria', 'Ramírez', 'Calle 567', 'Pereira', '1998-08-10'),
    ('Javier', 'Castro', 'Carrera 303', 'Santa Marta', '1995-01-25'),
    ('Natalia', 'Ortega', 'Av. Bolívar', 'Villavicencio', '1992-06-20'),
    ('Santiago', 'Vargas', 'Calle 678', 'Ibagué', '1988-12-05'),
    ('Paula', 'Góngora', 'Carrera 505', 'Armenia', '1997-03-10'),
    ('Mateo', 'Guzmán', 'Av. 20 de Julio', 'Tunja', '1999-10-18'),
    ('Isabella', 'Mendoza', 'Calle 789', 'Popayán', '1994-05-03'),
    ('Emilio', 'Rojas', 'Av. Los Alpes', 'Neiva', '1991-09-28'),
    ('Camilo', 'Vélez', 'Carrera 404', 'Sincelejo', '1997-04-12'),
    ('Luciana', 'Zapata', 'Calle 123', 'Riohacha', '1995-11-20'),
    ('Diego', 'Castañeda', 'Av. Simón Bolívar', 'Quibdó', '1993-07-08'),
    ('Valentina', 'Santos', 'Carrera 606', 'Leticia', '1998-12-15'),
    ('Juan Pablo', 'Gómez', 'Calle 555', 'Cúcuta', '1996-02-01'),
    ('María José', 'Herrera', 'Av. 123', 'Pasto', '1999-09-10'),
	('Carlos', 'García', 'Calle 789', 'Cartagena', '1995-02-18'),
    ('Ana', 'López', 'Av. Central', 'Bucaramanga', '1987-09-12'),
    ('Jorge', 'Hernández', 'Carrera 101', 'Pereira', '1993-06-25'),
    ('Isabel', 'Díaz', 'Calle 234', 'Santa Marta', '1998-04-30'),
    ('Andrés', 'Torres', 'Av. Libertad', 'Villavicencio', '1991-07-08'),
    ('Sofía', 'Ramírez', 'Calle 567', 'Ibagué', '1989-10-22'),
    ('Diego', 'Castro', 'Carrera 303', 'Armenia', '1997-01-05'),
    ('Valentina', 'Ortega', 'Av. Bolívar', 'Cúcuta', '1994-03-15'),
    ('Mateo', 'Vargas', 'Calle 678', 'Pasto', '1996-12-01'),
    ('Camila', 'Góngora', 'Carrera 505', 'Manizales', '1999-11-10'),
    ('Felipe', 'Guzmán', 'Av. 20 de Julio', 'Tunja', '1992-08-28'),
    ('Lucía', 'Mendoza', 'Calle 789', 'Popayán', '1988-05-03'),
    ('Daniel', 'Rojas', 'Av. Los Alpes', 'Neiva', '1990-09-20'),
    ('Valeria', 'Vélez', 'Carrera 404', 'Sincelejo', '1993-04-12'),
    ('Gabriel', 'Zapata', 'Calle 123', 'Riohacha', '1997-03-28'),
    ('Renata', 'Castañeda', 'Av. Simón Bolívar', 'Quibdó', '1995-10-15'),
    ('Emilio', 'Santos', 'Carrera 606', 'Leticia', '1998-07-05'),
    ('Pedro', 'Diaz', 'Los alamps 1222', 'Lima', '1980-05-08'),
    ('María', 'Gómez', 'Av. Principal 456', 'Arequipa', '1995-09-20'),
    ('Carlos', 'Pérez', 'Calle Flores 789', 'Trujillo', '1988-03-12'),
    ('Ana', 'Rodríguez', 'Jr. San Martín 321', 'Cusco', '1992-11-05'),
    ('Luis', 'Hernández', 'Calle Los Pinos 987', 'Piura', '1985-07-15'),
    ('Laura', 'Torres', 'Av. Los Jazmines 654', 'Chiclayo', '1998-02-28'),
    ('Javier', 'Vargas', 'Calle Las Rosas 123', 'Iquitos', '1990-09-10'),
    ('Isabel', 'López', 'Av. Los Cedros 567', 'Tacna', '1982-04-18'),
    ('Diego', 'Mendoza', 'Jr. Las Orquídeas 789', 'Huancayo', '1993-06-25'),
    ('Sofía', 'García', 'Calle Los Laureles 234', 'Pucallpa', '1987-12-03'),
    ('Andrés', 'Fernández', 'Av. Los Pájaros 876', 'Trujillo', '1996-01-15'),
    ('Valentina', 'Martínez', 'Jr. Las Violetas 543', 'Arequipa', '1984-08-20'),
    ('Gabriel', 'Ramírez', 'Calle Los Girasoles 210', 'Lima', '1991-03-30'),
    ('Camila', 'Silva', 'Av. Los Cerezos 765', 'Cusco', '1989-10-12'),
    ('Mateo', 'González', 'Jr. Las Margaritas 432', 'Piura', '1997-05-05'),
    ('Lucía', 'Pérez', 'Calle Los Lirios 678', 'Chiclayo', '1983-12-08'),
    ('Emilio', 'Herrera', 'Av. Los Almendros 987', 'Iquitos', '1994-09-22'),
    ('Renata', 'Ortega', 'Jr. Las Azucenas 345', 'Tacna', '1986-06-17'),
    ('Matías', 'Sánchez', 'Calle Los Robles 543', 'Huancayo', '1999-02-10'),
    ('Natalia', 'Luna', 'Av. Los Tulipanes 210', 'Pucallpa', '1981-07-28'),
    ('Patricia', 'López', 'Av. Los Girasoles 543', 'Lima', '1987-11-15'),
    ('Fernando', 'García', 'Calle Los Lirios 678', 'Chiclayo', '1992-08-10'),
    ('Carmen', 'Herrera', 'Av. Los Almendros 987', 'Iquitos', '1985-03-25'),
    ('Ricardo', 'Ortega', 'Jr. Las Azucenas 345', 'Tacna', '1990-12-18'),
    ('Paula', 'Sánchez', 'Calle Los Robles 543', 'Huancayo', '1983-07-05'),
    ('Hugo', 'Luna', 'Av. Los Tulipanes 210', 'Pucallpa', '1996-02-28'),
    ('Valentín', 'Martínez', 'Jr. Las Violetas 543', 'Arequipa', '1981-09-20'),
    ('Renata', 'Ramírez', 'Calle Los Cedros 567', 'Trujillo', '1994-04-12'),
    ('Joaquín', 'Silva', 'Av. Los Pájaros 876', 'Iquitos', '1988-01-05'),
    ('Isabella', 'González', 'Jr. Las Margaritas 432', 'Piura', '1993-06-15'),
    ('Sebastián', 'Pérez', 'Calle Los Laureles 234', 'Chiclayo', '1986-03-30'),
    ('Camilo', 'Torres', 'Av. Los Jazmines 654', 'Arequipa', '1999-10-22'),
    ('Daniela', 'Hernández', 'Jr. San Martín 321', 'Cusco', '1984-05-08'),
    ('Felipe', 'Vargas', 'Calle Flores 789', 'Trujillo', '1991-02-18'),
    ('Luciana', 'Rodríguez', 'Av. Principal 456', 'Arequipa', '1989-09-05'),
    ('Gustavo', 'Pérez', 'Los alamps 1222', 'Lima', '1997-04-28'),
    ('Marcela', 'Gómez', 'Av. Los Cerezos 765', 'Cusco', '1982-11-15'),
    ('Andrea', 'Diaz', 'Calle Las Rosas 123', 'Iquitos', '1995-08-10'),
    ('Juan', 'Fernández', 'Jr. Las Orquídeas 789', 'Huancayo', '1987-03-25'),
    ('Santiago', 'López', 'Av. Los Cedros 567', 'Trujillo', '1992-12-18'),
    ('Rosa', 'Martínez', 'Av. Los Pinos 987', 'Piura', '1998-04-10'),
    ('Pedro', 'Gómez', 'Calle Las Rosas 123', 'Iquitos', '1983-11-25'),
    ('Lorena', 'Hernández', 'Jr. Las Orquídeas 789', 'Huancayo', '1990-06-18'),
    ('Felipe', 'Ramírez', 'Av. Los Cedros 567', 'Trujillo', '1987-01-05'),
    ('Carla', 'Silva', 'Calle Los Laureles 234', 'Chiclayo', '1995-08-20'),
    ('Martín', 'Pérez', 'Av. Los Jazmines 654', 'Arequipa', '1982-03-12'),
    ('Valeria', 'Vargas', 'Jr. San Martín 321', 'Cusco', '1999-10-28'),
    ('Javier', 'Ortega', 'Calle Flores 789', 'Trujillo', '1984-05-15'),
    ('Camila', 'Luna', 'Av. Principal 456', 'Arequipa', '1991-02-08'),
    ('Andrés', 'Fernández', 'Los alamps 1222', 'Lima', '1989-09-30'),
    ('Isabel', 'Torres', 'Av. Los Cerezos 765', 'Cusco', '1996-07-12'),
    ('Diego', 'González', 'Calle Los Girasoles 210', 'Lima', '1981-12-03'),
    ('Sofía', 'Diaz', 'Av. Los Tulipanes 210', 'Pucallpa', '1994-09-22'),
    ('Gabriel', 'Herrera', 'Jr. Las Violetas 543', 'Arequipa', '1986-06-17'),
    ('Lucía', 'Rodríguez', 'Calle Los Lirios 678', 'Chiclayo', '1993-03-30'),
    ('Emilio', 'Pérez', 'Av. Los Almendros 987', 'Iquitos', '1988-08-12'),
    ('Renata', 'García', 'Jr. Las Azucenas 345', 'Tacna', '1995-05-05'),
    ('Matías', 'Sánchez', 'Calle Los Robles 543', 'Huancayo', '1980-10-18'),
    ('Natalia', 'López', 'Av. Los Pájaros 876', 'Trujillo', '1997-07-28'),
    ('Sebastián', 'Martínez', 'Jr. San Martín 321', 'Cusco', '1985-04-15');

-- TRUNCATE TABLE Productos;

-- Poblar datos en ventas:
INSERT INTO Venta (Fecha, CodigoCliente,Monto)
VALUES 
	('2024-06-08', 1, 32.0 ),
	('2024-06-08', 2, 42.0 ),
	('2024-06-08', 3, 192.0 ),
	('2024-06-08', 4, 272.0 );

INSERT INTO DetalleVenta (CodigoVenta, CodigoProducto, Cantidad, Precio, SubTotal)
VALUES
	(1, 1, 1, 20, 20),
	(1, 2, 1, 12, 12),
	(2, 1, 1, 20, 20),
	(2, 2, 1, 12, 12),
	(2, 3, 1, 10, 10),
	(3, 1, 1, 20, 20),
	(3, 2, 1, 12, 12),
	(3, 3, 1, 10, 10),
	(3, 4, 1, 150, 150),
	(4, 1, 1, 20, 20),
	(4, 2, 1, 12, 12),
	(4, 3, 1, 10, 10),
	(4, 4, 1, 150, 150),
	(4, 5, 1, 80, 80);
	


-- Ejecutar consulta para verificar los datos insertados
SELECT * FROM Cliente WITH(NOLOCK);


-- Ejecutar consulta para verificar los datos insertados
SELECT * FROM Productos(NOLOCK);

SELECT TOP 3 * FROM Cliente(NOLOCK);
SELECT TOP 3 * FROM Productos(NOLOCK);
SELECT TOP 3 * FROM Venta(NOLOCK);


-- Ejecutar BUSQUEDA:

SELECT * FROM Cliente WITH(NOLOCK) WHERE Nombres LIKE 'M%' --Busca los datos que comienza con la letra M
SELECT * FROM Cliente WITH(NOLOCK) WHERE Nombres LIKE '%A' --Busca los datos que terminan con la letra A

-- Contar registros en la tabla:
SELECT COUNT(Codigo) FROM Cliente WITH(NOLOCK)  --Cantidad de registros de la tabla clientes


-- hacer una tabla con la cantidad de registros, el cliente más joven, el cliente más mayor:
SELECT COUNT(Codigo) as CantidadRegistros,
MAX(FechaNacimiento) as ClienteMasJoven, 
MIN(FechaNacimiento) as ClienteMasMayor 
FROM Cliente WITH(NOLOCK)  --Cliente mas joven e de mas edad

--Encontrar la cantidad de personas con el mismo nombre
SELECT Nombres, COUNT(Nombres) as Cantidad FROM Cliente(NOLOCK)
GROUP BY Nombres
HAVING  COUNT(Nombres)>1
ORDER BY Nombres DESC

---Encontrar la cantidad de personas que cumplen años por meses
SELECT MONTH(FechaNacimiento) as Mes, 
COUNT(MONTH(FechaNacimiento)) as cantidadPersonas 
FROM Cliente WITH(NOLOCK)
GROUP BY MONTH(FechaNacimiento)
ORDER BY MONTH(FechaNacimiento) ASC

-- JOINS:
SELECT T_Cliente.Nombres, T_Cliente.Apellidos, T_Venta.Codigo AS CodigoVenta, T_Venta.Fecha, T_Venta.Monto
FROM Cliente(NOLOCK) T_Cliente
INNER JOIN Venta (NOLOCK) T_Venta
ON T_Cliente.Codigo = T_Venta.CodigoCliente;

