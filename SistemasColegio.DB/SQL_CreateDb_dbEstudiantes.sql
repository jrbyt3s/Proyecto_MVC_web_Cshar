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

-- Insertando más datos en la tabla Alumno con direcciones de Lima, Perú y fechas de nacimiento a partir del 2009
INSERT INTO Alumno (Nombres, Apellidos, Direccion, Sexo, FechaNacimiento) 
VALUES
    ('Lucas', 'Sánchez Rodríguez', 'Av. Javier Prado Este 1234, San Isidro', 'Masculino', '2009-03-08'),
    ('Valentina', 'Gómez Pérez', 'Av. Arequipa 567, Miraflores', 'Femenino', '2010-05-15'),
    ('Mateo', 'Martínez Díaz', 'Calle Las Begonias 890, San Borja', 'Masculino', '2009-11-20'),
    ('Isabella', 'Torres Ruiz', 'Av. Paseo de la República 2345, Barranco', 'Femenino', '2011-09-17'),
    ('Juan Pablo', 'López Gutiérrez', 'Av. José Larco 678, Miraflores', 'Masculino', '2010-07-25'),
    ('Sofía', 'Fernández García', 'Calle Mariscal Castilla 456, Lince', 'Femenino', '2009-04-12'),
    ('Martín', 'Ramírez Sánchez', 'Av. Caminos del Inca 789, Surco', 'Masculino', '2011-02-28'),
    ('Valeria', 'García Martínez', 'Av. Primavera 345, San Borja', 'Femenino', '2012-08-09'),
    ('Joaquín', 'Rodríguez Pérez', 'Av. La Fontana 567, La Molina', 'Masculino', '2010-06-15'),
    ('Camila', 'Pérez López', 'Av. República de Panamá 890, San Isidro', 'Femenino', '2009-10-30'),
    ('Emilio', 'Gutiérrez Torres', 'Calle Los Castaños 123, San Borja', 'Masculino', '2011-12-05'),
    ('Renata', 'Martínez Ruiz', 'Av. El Polo 456, Surco', 'Femenino', '2010-03-21'),
    ('Diego', 'Sánchez García', 'Av. Javier Prado Oeste 789, San Isidro', 'Masculino', '2009-11-14'),
    ('Mía', 'López Díaz', 'Av. Pardo y Aliaga 234, San Isidro', 'Femenino', '2011-07-07'),
    ('Sebastián', 'Fernández Rodríguez', 'Av. República de Chile 567, Jesús María', 'Masculino', '2010-09-23'),
    ('Abril', 'García Gómez', 'Av. Aviación 890, San Borja', 'Femenino', '2012-04-18'),
    ('Facundo', 'Pérez Sánchez', 'Av. Larco 123, Miraflores', 'Masculino', '2011-10-12'),
    ('Aitana', 'Martínez Pérez', 'Av. Angamos 456, Surquillo', 'Femenino', '2009-08-27'),
    ('Simón', 'Torres Gutiérrez', 'Av. José Gálvez Barrenechea 789, San Borja', 'Masculino', '2010-05-03'),
    ('Martina', 'Gómez Martínez', 'Av. República de Panamá 234, San Isidro', 'Femenino', '2011-03-29'),
    ('Thiago', 'Rodríguez Ruiz', 'Calle Mariscal Sucre 567, Magdalena', 'Masculino', '2012-11-05'),
    ('Elena', 'López García', 'Av. Del Ejército 890, Miraflores', 'Femenino', '2010-12-10'),
    ('Lautaro', 'Fernández Díaz', 'Av. Comandante Espinar 123, Miraflores', 'Masculino', '2009-09-13'),
    ('Emma', 'Sánchez Sánchez', 'Av. La Marina 456, San Miguel', 'Femenino', '2011-06-18'),
    ('Benjamín', 'García Torres', 'Av. Santa Cruz 789, Miraflores', 'Masculino', '2010-04-02'),
    ('Josefina', 'Martínez Martínez', 'Av. Salaverry 234, Jesús María', 'Femenino', '2009-10-25'),
    ('Matías', 'Pérez López', 'Av. Alfredo Benavides 567, Surco', 'Masculino', '2012-07-14'),
    ('Antonella', 'Rodríguez García', 'Av. Petit Thouars 890, San Isidro', 'Femenino', '2010-08-08'),
    ('Facundo', 'Gómez Díaz', 'Av. 28 de Julio 123, Miraflores', 'Masculino', '2011-04-30'),
    ('Ainhoa', 'López Ruiz', 'Av. Garcilaso de la Vega 456, Lima', 'Femenino', '2012-01-15');


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
    (1, 'Comunicación y Lenguaje'),
    (1, 'Matemáticas'),
    (1, 'Ciencias Naturales'),
    (1, 'Ciencias Sociales'),
    (1, 'Educación Física'),
    (1, 'Educación Artística'),
    (2, 'Comunicación y Lenguaje'),
    (2, 'Matemáticas'),
    (2, 'Ciencias Naturales'),
    (2, 'Ciencias Sociales'),
    (2, 'Educación Física'),
    (2, 'Educación Artística'),
    (3, 'Comunicación y Lenguaje'),
    (3, 'Matemáticas'),
    (3, 'Ciencias Naturales'),
    (3, 'Ciencias Sociales'),
    (3, 'Educación Física'),
    (3, 'Educación Artística'),
    (4, 'Comunicación y Lenguaje'),
    (4, 'Matemáticas'),
    (4, 'Ciencias Naturales'),
    (4, 'Ciencias Sociales'),
    (4, 'Educación Física'),
    (4, 'Educación Artística'),
    (5, 'Comunicación y Lenguaje'),
    (5, 'Matemáticas'),
    (5, 'Ciencias Naturales'),
    (5, 'Ciencias Sociales'),
    (5, 'Educación Física'),
    (5, 'Educación Artística'),
    (6, 'Comunicación y Lenguaje'),
    (6, 'Matemáticas'),
    (6, 'Ciencias Naturales'),
    (6, 'Ciencias Sociales'),
    (6, 'Educación Física'),
    (6, 'Educación Artística');

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
	