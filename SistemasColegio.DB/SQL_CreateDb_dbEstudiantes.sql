CREATE DATABASE Colegio;
USE Colegio;
-- Crear tabla Alumnos:
CREATE TABLE Alumno(
	AlumnoID SMALLINT IDENTITY(1000,1),
	Nombres nvarchar(50) NOT NULL,
	Apellidos nvarchar(60) NOT NULL,
	Direccion nvarchar(150) NOT NULL,
	Sexo nvarchar(10) NOT NULL,
	FechaNacimiento date NOT NULL,
	CONSTRAINT PK_Alumno PRIMARY KEY (AlumnoID)
 );
 -- crear tabla Grado:
CREATE TABLE Grado(
	GradoID SMALLINT IDENTITY(1,1),
	Nivel nvarchar(50) NOT NULL,
	CONSTRAINT PK_Grado PRIMARY KEY (GradoID)
);
 -- Crear tabla Seccion:
CREATE TABLE Seccion(
	SeccionID SMALLINT IDENTITY(1,1),
	Nombre nvarchar(50) NOT NULL,
	GradoID SMALLINT,
	CONSTRAINT PK_Seccion PRIMARY KEY (SeccionID),
	CONSTRAINT FK_Seccion_Grado FOREIGN KEY (GradoID) REFERENCES Grado(GradoID)
);
 -- Crear tabla Curso:
 CREATE TABLE Curso(
	CursoID SMALLINT IDENTITY(1,1),
	GradoID SMALLINT,
	Nombre nvarchar(50) NOT NULL,
	CONSTRAINT PK_Curso PRIMARY KEY (CursoID),
	CONSTRAINT FK_Curso_Grado FOREIGN KEY (GradoID) REFERENCES Grado(GradoID)
);
 -- Crear Matricula:
CREATE TABLE Matricula(
	MatriculaID INT IDENTITY(1,1),
	Fecha DATETIME DEFAULT GETDATE(),
	GradoID SMALLINT NOT NULL,
	SeccionID SMALLINT NOT NULL,
	AlumnoID SMALLINT NOT NULL,
	CONSTRAINT PK_Matricula PRIMARY KEY (MatriculaID),
	CONSTRAINT FK_Matricula_Grado FOREIGN KEY (GradoID) REFERENCES Grado(GradoID),
	CONSTRAINT FK_Matricula_Seccion FOREIGN KEY (SeccionID) REFERENCES Seccion(SeccionID),
	CONSTRAINT FK_Matricula_Alumno FOREIGN KEY (AlumnoID) REFERENCES Alumno(AlumnoID)
);
 -- Notas
 CREATE TABLE Notas(
	NotasID INT IDENTITY(1,1),
	AlumnoID SMALLINT NOT NULL,
	CursoID SMALLINT NOT NULL,
	Notas DECIMAL(4,1) DEFAULT 0,
	CONSTRAINT PK_Notas PRIMARY KEY (NotasID),
	CONSTRAINT FK_Notas_Alumno FOREIGN KEY (AlumnoID) REFERENCES Alumno(AlumnoID),
	CONSTRAINT FK_Notas_Curso FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

-- Insertando m�s datos en la tabla Alumno con direcciones de Lima, Per� y fechas de nacimiento a partir del 2009
INSERT INTO Alumno (Nombres, Apellidos, Direccion, Sexo, FechaNacimiento) 
VALUES
    ('Lucas', 'S�nchez Rodr�guez', 'Av. Javier Prado Este 1234, San Isidro', 'Masculino', '2009-03-08'),
    ('Valentina', 'G�mez P�rez', 'Av. Arequipa 567, Miraflores', 'Femenino', '2010-05-15'),
    ('Mateo', 'Mart�nez D�az', 'Calle Las Begonias 890, San Borja', 'Masculino', '2009-11-20'),
    ('Isabella', 'Torres Ruiz', 'Av. Paseo de la Rep�blica 2345, Barranco', 'Femenino', '2011-09-17'),
    ('Juan Pablo', 'L�pez Guti�rrez', 'Av. Jos� Larco 678, Miraflores', 'Masculino', '2010-07-25'),
    ('Sof�a', 'Fern�ndez Garc�a', 'Calle Mariscal Castilla 456, Lince', 'Femenino', '2009-04-12'),
    ('Mart�n', 'Ram�rez S�nchez', 'Av. Caminos del Inca 789, Surco', 'Masculino', '2011-02-28'),
    ('Valeria', 'Garc�a Mart�nez', 'Av. Primavera 345, San Borja', 'Femenino', '2012-08-09'),
    ('Joaqu�n', 'Rodr�guez P�rez', 'Av. La Fontana 567, La Molina', 'Masculino', '2010-06-15'),
    ('Camila', 'P�rez L�pez', 'Av. Rep�blica de Panam� 890, San Isidro', 'Femenino', '2009-10-30'),
    ('Emilio', 'Guti�rrez Torres', 'Calle Los Casta�os 123, San Borja', 'Masculino', '2011-12-05'),
    ('Renata', 'Mart�nez Ruiz', 'Av. El Polo 456, Surco', 'Femenino', '2010-03-21'),
    ('Diego', 'S�nchez Garc�a', 'Av. Javier Prado Oeste 789, San Isidro', 'Masculino', '2009-11-14'),
    ('M�a', 'L�pez D�az', 'Av. Pardo y Aliaga 234, San Isidro', 'Femenino', '2011-07-07'),
    ('Sebasti�n', 'Fern�ndez Rodr�guez', 'Av. Rep�blica de Chile 567, Jes�s Mar�a', 'Masculino', '2010-09-23'),
    ('Abril', 'Garc�a G�mez', 'Av. Aviaci�n 890, San Borja', 'Femenino', '2012-04-18'),
    ('Facundo', 'P�rez S�nchez', 'Av. Larco 123, Miraflores', 'Masculino', '2011-10-12'),
    ('Aitana', 'Mart�nez P�rez', 'Av. Angamos 456, Surquillo', 'Femenino', '2009-08-27'),
    ('Sim�n', 'Torres Guti�rrez', 'Av. Jos� G�lvez Barrenechea 789, San Borja', 'Masculino', '2010-05-03'),
    ('Martina', 'G�mez Mart�nez', 'Av. Rep�blica de Panam� 234, San Isidro', 'Femenino', '2011-03-29'),
    ('Thiago', 'Rodr�guez Ruiz', 'Calle Mariscal Sucre 567, Magdalena', 'Masculino', '2012-11-05'),
    ('Elena', 'L�pez Garc�a', 'Av. Del Ej�rcito 890, Miraflores', 'Femenino', '2010-12-10'),
    ('Lautaro', 'Fern�ndez D�az', 'Av. Comandante Espinar 123, Miraflores', 'Masculino', '2009-09-13'),
    ('Emma', 'S�nchez S�nchez', 'Av. La Marina 456, San Miguel', 'Femenino', '2011-06-18'),
    ('Benjam�n', 'Garc�a Torres', 'Av. Santa Cruz 789, Miraflores', 'Masculino', '2010-04-02'),
    ('Josefina', 'Mart�nez Mart�nez', 'Av. Salaverry 234, Jes�s Mar�a', 'Femenino', '2009-10-25'),
    ('Mat�as', 'P�rez L�pez', 'Av. Alfredo Benavides 567, Surco', 'Masculino', '2012-07-14'),
    ('Antonella', 'Rodr�guez Garc�a', 'Av. Petit Thouars 890, San Isidro', 'Femenino', '2010-08-08'),
    ('Facundo', 'G�mez D�az', 'Av. 28 de Julio 123, Miraflores', 'Masculino', '2011-04-30'),
    ('Ainhoa', 'L�pez Ruiz', 'Av. Garcilaso de la Vega 456, Lima', 'Femenino', '2012-01-15');


INSERT INTO Grado (Nivel)
VALUES
('Primaria-Primer-grado'),
('Primaria-Segundo-grado'),
('Primaria-Tercer-grado'),
('Primaria-Cuarto-grado'),
('Primaria-Quinto-grado'),
('Primaria-Sexto-grado'),
('Secundaria-Primer-grado'),
('Secundaria-Segundo-grado'),
('Secundaria-Tercer-grado'),
('Secundaria-Cuarto-grado'),
('Secundaria-Quinto-grado');

INSERT INTO Seccion (Nombre, GradoID)
VALUES
('A',1),
('B',1),
('C',1),
('A',2),
('B',2),
('C',2),
('A',3),
('B',3),
('C',3),
('A',4),
('B',4),
('C',4),
('A',5),
('B',5),
('C',5),
('A',6),
('B',6),
('C',6);

INSERT INTO Curso (GradoID, Nombre)
VALUES
    (1, 'Comunicaci�n y Lenguaje'),
    (1, 'Matem�ticas'),
    (1, 'Ciencias Naturales'),
    (1, 'Ciencias Sociales'),
    (1, 'Educaci�n F�sica'),
    (1, 'Educaci�n Art�stica'),
    (2, 'Comunicaci�n y Lenguaje'),
    (2, 'Matem�ticas'),
    (2, 'Ciencias Naturales'),
    (2, 'Ciencias Sociales'),
    (2, 'Educaci�n F�sica'),
    (2, 'Educaci�n Art�stica'),
    (3, 'Comunicaci�n y Lenguaje'),
    (3, 'Matem�ticas'),
    (3, 'Ciencias Naturales'),
    (3, 'Ciencias Sociales'),
    (3, 'Educaci�n F�sica'),
    (3, 'Educaci�n Art�stica'),
    (4, 'Comunicaci�n y Lenguaje'),
    (4, 'Matem�ticas'),
    (4, 'Ciencias Naturales'),
    (4, 'Ciencias Sociales'),
    (4, 'Educaci�n F�sica'),
    (4, 'Educaci�n Art�stica'),
    (5, 'Comunicaci�n y Lenguaje'),
    (5, 'Matem�ticas'),
    (5, 'Ciencias Naturales'),
    (5, 'Ciencias Sociales'),
    (5, 'Educaci�n F�sica'),
    (5, 'Educaci�n Art�stica'),
    (6, 'Comunicaci�n y Lenguaje'),
    (6, 'Matem�ticas'),
    (6, 'Ciencias Naturales'),
    (6, 'Ciencias Sociales'),
    (6, 'Educaci�n F�sica'),
    (6, 'Educaci�n Art�stica');

	Select TOP 3 * from Grado;
	Select TOP 1 * from Alumno;
	SELECT TOP 3 * FROM Seccion;
	SELECT TOP 3 * FROM Matricula;
	-- Insertar data en matricula
	INSERT INTO Matricula (Fecha, GradoID, SeccionID, AlumnoID)
	VALUES ('2024-06-09',1,1,1000);
	
	

	-- JOINS:

SELECT Matricula.MatriculaID, Matricula.Fecha, Grado.Nivel, Seccion.Nombre, Alumno.Nombres, Alumno.Apellidos, Alumno.Sexo, Alumno.FechaNacimiento 
FROM Matricula
INNER JOIN Alumno ON Alumno.AlumnoID = Matricula.AlumnoID
INNER JOIN Grado ON Matricula.GradoID = Grado.GradoID
INNER JOIN Seccion ON Matricula.SeccionID = Seccion.SeccionID
	