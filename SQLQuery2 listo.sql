-- Crear base de datos (opcional)
CREATE DATABASE Alejandrozone
USE 

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Tabla de Equipos
CREATE TABLE Equipos (
    EquipoID INT IDENTITY(1,1) PRIMARY KEY,
    TipoEquipo VARCHAR(50),
    Modelo VARCHAR(50),
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Tabla de Técnicos
CREATE TABLE Tecnicos (
    TecnicoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100),
    Especialidad VARCHAR(100)
);

-- Tabla de Reparaciones
CREATE TABLE Reparaciones (
    ReparacionID INT IDENTITY(1,1) PRIMARY KEY,
    EquipoID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(50),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

-- Tabla de Detalles de Reparación
CREATE TABLE DetallesReparacion (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    ReparacionID INT,
    Descripcion TEXT,
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);

-- Tabla de Asignaciones
CREATE TABLE Asignaciones (
    AsignacionID INT IDENTITY(1,1) PRIMARY KEY,
    ReparacionID INT,
    TecnicoID INT,
    FechaAsignacion DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);


-- Insertar usuario
CREATE PROCEDURE InsertarUsuario
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END
GO

-- Consultar usuarios
CREATE PROCEDURE ConsultarUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END
GO

-- Modificar usuario
CREATE PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END
GO

-- Eliminar usuario
CREATE PROCEDURE EliminarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END
GO

-- Insertar equipo
CREATE PROCEDURE InsertarEquipo
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (@TipoEquipo, @Modelo, @UsuarioID);
END
GO

-- Consultar equipos
CREATE PROCEDURE ConsultarEquipos
AS
BEGIN
    SELECT * FROM Equipos;
END
GO

-- Modificar equipo
CREATE PROCEDURE ModificarEquipo
    @EquipoID INT,
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    UPDATE Equipos
    SET TipoEquipo = @TipoEquipo,
        Modelo = @Modelo,
        UsuarioID = @UsuarioID
    WHERE EquipoID = @EquipoID;
END
GO

-- Eliminar equipo
CREATE PROCEDURE EliminarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID;
END
GO

-- Insertar técnico
CREATE PROCEDURE InsertarTecnico
    @Nombre VARCHAR(100),
    @Especialidad VARCHAR(100)
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END
GO

-- Consultar técnicos
CREATE PROCEDURE ConsultarTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos;
END
GO

-- Modificar técnico
CREATE PROCEDURE ModificarTecnico
    @TecnicoID INT,
    @Nombre VARCHAR(100),
    @Especialidad VARCHAR(100)
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = @Nombre,
        Especialidad = @Especialidad
    WHERE TecnicoID = @TecnicoID;
END
GO

-- Eliminar técnico
CREATE PROCEDURE EliminarTecnico
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID;
END
GO

SELECT * FROM sys.procedures;






EXEC InsertarUsuario 'Carlos Méndez', 'carlos@email.com', '8888-0000';


SELECT name FROM sys.procedures WHERE name = 'InsertarUsuario';

EXEC InsertarUsuario 'Carlos Méndez', 'carlos@email.com', '8888-0000';


USE ReparacionesDB;
GO

EXEC InsertarUsuario 
    @Nombre = 'Carlos Méndez', 
    @CorreoElectronico = 'carlos@email.com', 
    @Telefono = '8888-0000';

	EXEC InsertarUsuario 'Carlos Méndez', 'carlos@email.com', '8888-0000';

	SELECT * FROM Usuarios;



-- Consultar Usuarios
CREATE PROCEDURE ConsultarUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END
GO



IF OBJECT_ID('ModificarUsuario', 'P') IS NOT NULL
    DROP PROCEDURE ModificarUsuario;
GO
-- Insertar Usuario
IF OBJECT_ID('InsertarUsuario', 'P') IS NOT NULL DROP PROCEDURE InsertarUsuario;
GO
CREATE PROCEDURE InsertarUsuario
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END
GO

-- Consultar Usuarios
IF OBJECT_ID('ConsultarUsuarios', 'P') IS NOT NULL DROP PROCEDURE ConsultarUsuarios;
GO
CREATE PROCEDURE ConsultarUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END
GO

-- Modificar Usuario
IF OBJECT_ID('ModificarUsuario', 'P') IS NOT NULL DROP PROCEDURE ModificarUsuario;
GO
CREATE PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END
GO

-- Eliminar Usuario
IF OBJECT_ID('EliminarUsuario', 'P') IS NOT NULL DROP PROCEDURE EliminarUsuario;
GO
CREATE PROCEDURE EliminarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END
GO

-- ==============================================
-- CRUD: USUARIOS
-- ==============================================
IF OBJECT_ID('InsertarUsuario', 'P') IS NOT NULL DROP PROCEDURE InsertarUsuario;
GO
CREATE PROCEDURE InsertarUsuario
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END
GO

IF OBJECT_ID('ConsultarUsuarios', 'P') IS NOT NULL DROP PROCEDURE ConsultarUsuarios;
GO
CREATE PROCEDURE ConsultarUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END
GO

IF OBJECT_ID('ModificarUsuario', 'P') IS NOT NULL DROP PROCEDURE ModificarUsuario;
GO
CREATE PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END
GO

IF OBJECT_ID('EliminarUsuario', 'P') IS NOT NULL DROP PROCEDURE EliminarUsuario;
GO
CREATE PROCEDURE EliminarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END
GO

-- ==============================================
-- CRUD: EQUIPOS
-- ==============================================
IF OBJECT_ID('InsertarEquipo', 'P') IS NOT NULL DROP PROCEDURE InsertarEquipo;
GO
CREATE PROCEDURE InsertarEquipo
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (@TipoEquipo, @Modelo, @UsuarioID);
END
GO

IF OBJECT_ID('ConsultarEquipos', 'P') IS NOT NULL DROP PROCEDURE ConsultarEquipos;
GO
CREATE PROCEDURE ConsultarEquipos
AS
BEGIN
    SELECT * FROM Equipos;
END
GO

IF OBJECT_ID('ModificarEquipo', 'P') IS NOT NULL DROP PROCEDURE ModificarEquipo;
GO
CREATE PROCEDURE ModificarEquipo
    @EquipoID INT,
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    UPDATE Equipos
    SET TipoEquipo = @TipoEquipo,
        Modelo = @Modelo,
        UsuarioID = @UsuarioID
    WHERE EquipoID = @EquipoID;
END
GO

IF OBJECT_ID('EliminarEquipo', 'P') IS NOT NULL DROP PROCEDURE EliminarEquipo;
GO
CREATE PROCEDURE EliminarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID;
END
GO

-- ==============================================
-- CRUD: TECNICOS
-- ==============================================
IF OBJECT_ID('InsertarTecnico', 'P') IS NOT NULL DROP PROCEDURE InsertarTecnico;
GO
CREATE PROCEDURE InsertarTecnico
    @Nombre VARCHAR(100),
    @Especialidad VARCHAR(100)
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END
GO

IF OBJECT_ID('ConsultarTecnicos', 'P') IS NOT NULL DROP PROCEDURE ConsultarTecnicos;
GO
CREATE PROCEDURE ConsultarTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos;
END
GO

IF OBJECT_ID('ModificarTecnico', 'P') IS NOT NULL DROP PROCEDURE ModificarTecnico;
GO
CREATE PROCEDURE ModificarTecnico
    @TecnicoID INT,
    @Nombre VARCHAR(100),
    @Especialidad VARCHAR(100)
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = @Nombre,
        Especialidad = @Especialidad
    WHERE TecnicoID = @TecnicoID;
END
GO

IF OBJECT_ID('EliminarTecnico', 'P') IS NOT NULL DROP PROCEDURE EliminarTecnico;
GO
CREATE PROCEDURE EliminarTecnico
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID;
END
GO

-- ==============================================
-- CRUD: REPARACIONES
-- ==============================================
IF OBJECT_ID('InsertarReparacion', 'P') IS NOT NULL DROP PROCEDURE InsertarReparacion;
GO
CREATE PROCEDURE InsertarReparacion
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(50)
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, @Estado);
END
GO

IF OBJECT_ID('ConsultarReparaciones', 'P') IS NOT NULL DROP PROCEDURE ConsultarReparaciones;
GO
CREATE PROCEDURE ConsultarReparaciones
AS
BEGIN
    SELECT * FROM Reparaciones;
END
GO

IF OBJECT_ID('ModificarReparacion', 'P') IS NOT NULL DROP PROCEDURE ModificarReparacion;
GO
CREATE PROCEDURE ModificarReparacion
    @ReparacionID INT,
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(50)
AS
BEGIN
    UPDATE Reparaciones
    SET EquipoID = @EquipoID,
        FechaSolicitud = @FechaSolicitud,
        Estado = @Estado
    WHERE ReparacionID = @ReparacionID;
END
GO

IF OBJECT_ID('EliminarReparacion', 'P') IS NOT NULL DROP PROCEDURE EliminarReparacion;
GO
CREATE PROCEDURE EliminarReparacion
    @ReparacionID INT
AS
BEGIN
    DELETE FROM Reparaciones WHERE ReparacionID = @ReparacionID;
END
GO

-- ==============================================
-- CRUD: DETALLES REPARACIÓN
-- ==============================================
IF OBJECT_ID('InsertarDetalle', 'P') IS NOT NULL DROP PROCEDURE InsertarDetalle;
GO
CREATE PROCEDURE InsertarDetalle
    @ReparacionID INT,
    @Descripcion TEXT,
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, @Descripcion, @FechaInicio, @FechaFin);
END
GO

IF OBJECT_ID('ConsultarDetalles', 'P') IS NOT NULL DROP PROCEDURE ConsultarDetalles;
GO
CREATE PROCEDURE ConsultarDetalles
AS
BEGIN
    SELECT * FROM DetallesReparacion;
END
GO

IF OBJECT_ID('ModificarDetalle', 'P') IS NOT NULL DROP PROCEDURE ModificarDetalle;
GO
CREATE PROCEDURE ModificarDetalle
    @DetalleID INT,
    @Descripcion TEXT,
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    UPDATE DetallesReparacion
    SET Descripcion = @Descripcion,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin
    WHERE DetalleID = @DetalleID;
END
GO

IF OBJECT_ID('EliminarDetalle', 'P') IS NOT NULL DROP PROCEDURE EliminarDetalle;
GO
CREATE PROCEDURE EliminarDetalle
    @DetalleID INT
AS
BEGIN
    DELETE FROM DetallesReparacion WHERE DetalleID = @DetalleID;
END
GO

-- ==============================================
-- CRUD: ASIGNACIONES
-- ==============================================
IF OBJECT_ID('InsertarAsignacion', 'P') IS NOT NULL DROP PROCEDURE InsertarAsignacion;
GO
CREATE PROCEDURE InsertarAsignacion
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion);
END
GO

IF OBJECT_ID('ConsultarAsignaciones', 'P') IS NOT NULL DROP PROCEDURE ConsultarAsignaciones;
GO
CREATE PROCEDURE ConsultarAsignaciones
AS
BEGIN
    SELECT * FROM Asignaciones;
END
GO

IF OBJECT_ID('ModificarAsignacion', 'P') IS NOT NULL DROP PROCEDURE ModificarAsignacion;
GO
CREATE PROCEDURE ModificarAsignacion
    @AsignacionID INT,
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    UPDATE Asignaciones
    SET ReparacionID = @ReparacionID,
        TecnicoID = @TecnicoID,
        FechaAsignacion = @FechaAsignacion
    WHERE AsignacionID = @AsignacionID;
END
GO

IF OBJECT_ID('EliminarAsignacion', 'P') IS NOT NULL DROP PROCEDURE EliminarAsignacion;
GO
CREATE PROCEDURE EliminarAsignacion
    @AsignacionID INT
AS
BEGIN
    DELETE FROM Asignaciones WHERE AsignacionID = @AsignacionID;
END
GO
-- Insertar datos
EXEC InsertarUsuario 'Luis Mora', 'luis@email.com', '8888-1234';
EXEC InsertarTecnico 'Karen Alfaro', 'Electrónica';
EXEC InsertarEquipo 'Laptop', 'HP Pavilion', 1;
EXEC InsertarReparacion 1, '2025-03-21', 'Pendiente';
EXEC InsertarDetalle 1, 'Cambio de batería', '2025-03-21', NULL;
EXEC InsertarAsignacion 1, 1, '2025-03-21';

-- Consultar todo
EXEC ConsultarUsuarios;
EXEC ConsultarTecnicos;
EXEC ConsultarEquipos;
EXEC ConsultarReparaciones;
EXEC ConsultarDetalles;
EXEC ConsultarAsignaciones;

SELECT * FROM sys.procedures WHERE name = 'ConsultarUsuarios';



USE master;
GO
ALTER LOGIN [DESKTOP-JJES9PC\silvi] WITH DEFAULT_DATABASE = Alejandrozone;
GO
USE Alejandrozone;
GO
-- 2. Darle acceso a la base Alejandrozone
USE Alejandrozone;
GO

-- 3. Crear el usuario dentro de la base si no existe
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'DESKTOP-JJES9PC\silvi')
BEGIN
    CREATE USER [DESKTOP-JJES9PC\silvi] FOR LOGIN [DESKTOP-JJES9PC\silvi];
END
GO

-- 4. Darle permisos de propietario (control total)
ALTER ROLE db_owner ADD MEMBER [DESKTOP-JJES9PC\silvi];
GO

USE Alejandrozone;
GO
SELECT name, type_desc
FROM sys.database_principals
WHERE name LIKE '%silvi%';



USE Alejandrozone;
GO
DROP USER [silvi];  -- O el nombre que te haya dado el paso anterior
GO
CREATE USER [DESKTOP-JJES9PC\silvi] FOR LOGIN [DESKTOP-JJES9PC\silvi];
ALTER ROLE db_owner ADD MEMBER [DESKTOP-JJES9PC\silvi];


USE Alejandrozone;
GO
SELECT name, type_desc
FROM sys.database_principals
WHERE sid IN (
    SELECT sid FROM sys.server_principals WHERE name = 'DESKTOP-JJES9PC\silvi'
);


USE Alejandrozone;
GO
SELECT name FROM sys.procedures WHERE name = 'ConsultarUsuarios';


USE Alejandrozone;
GO

CREATE PROCEDURE ConsultarUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END
GO

SELECT DB_NAME() AS BaseEnUso;

USE Alejandrozone;
GO
SELECT * FROM Usuarios;
USE Alejandrozone;
GO

CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(20)
);

INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
VALUES ('Silvia Rodríguez', 'silvi@email.com', '8888-0000');

EXEC ConsultarUsuarios;

USE Alejandrozone;
GO
SELECT name FROM sys.procedures WHERE name = 'InsertarUsuario';
USE Alejandrozone;
GO

IF OBJECT_ID('InsertarUsuario', 'P') IS NOT NULL
    DROP PROCEDURE InsertarUsuario;
GO

CREATE PROCEDURE InsertarUsuario
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(20)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END
GO
SELECT name FROM sys.procedures WHERE name = 'InsertarUsuario';

USE Alejandrozone;
GO

IF OBJECT_ID('dbo.EliminarUsuario', 'P') IS NOT NULL
    DROP PROCEDURE dbo.EliminarUsuario;
GO

CREATE PROCEDURE dbo.EliminarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END
GO

SELECT * FROM sys.procedures WHERE name = 'EliminarUsuario';


EXEC InsertarUsuario 'Nombre Prueba', 'correo@email.com', '12345678';
EXEC EliminarUsuario @UsuarioID = 1



USE Alejandrozone;
GO

-- Crea el procedimiento para modificar un usuario
CREATE PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre NVARCHAR(100),
    @CorreoElectronico NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    UPDATE Usuarios
    SET
        Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END;
GO


-- 2 segundo segundo 
-- CREAR PROCEDIMIENTO InsertarEquipo
CREATE PROCEDURE InsertarEquipo
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Tipo NVARCHAR(100)
AS
BEGIN
    INSERT INTO Equipos (Nombre, Marca, Tipo)
    VALUES (@Nombre, @Marca, @Tipo)
END
GO

-- CREAR PROCEDIMIENTO ConsultarEquipos
CREATE PROCEDURE ConsultarEquipos
AS
BEGIN
    SELECT * FROM Equipos
END
GO

-- CREAR PROCEDIMIENTO ModificarEquipo
CREATE PROCEDURE ModificarEquipo
    @EquipoID INT,
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Tipo NVARCHAR(100)
AS
BEGIN
    UPDATE Equipos
    SET Nombre = @Nombre,
        Marca = @Marca,
        Tipo = @Tipo
    WHERE EquipoID = @EquipoID
END
GO

-- CREAR PROCEDIMIENTO EliminarEquipo
CREATE PROCEDURE EliminarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID
END
GO


-- tres 3 tres 

-- Crear tabla Equipos
CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Marca NVARCHAR(100),
    Serie NVARCHAR(100)
);
GO

-- Insertar
CREATE PROCEDURE InsertarEquipo
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Serie NVARCHAR(100)
AS
BEGIN
    INSERT INTO Equipos (Nombre, Marca, Serie)
    VALUES (@Nombre, @Marca, @Serie)
END
GO

-- Consultar
CREATE PROCEDURE ConsultarEquipos
AS
BEGIN
    SELECT * FROM Equipos
END
GO

-- Modificar
CREATE PROCEDURE ModificarEquipo
    @EquipoID INT,
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Serie NVARCHAR(100)
AS
BEGIN
    UPDATE Equipos
    SET Nombre = @Nombre, Marca = @Marca, Serie = @Serie
    WHERE EquipoID = @EquipoID
END
GO

-- Eliminar
CREATE PROCEDURE EliminarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID
END
GO

SELECT * FROM sys.procedures WHERE name LIKE '%Equipo%';
SELECT * FROM sys.tables WHERE name = 'Equipos';


SELECT name FROM sys.procedures WHERE name LIKE '%Equipo%'

ALTER TABLE Equipos DROP COLUMN Tipo;

ALTER PROCEDURE InsertarEquipo
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Serie NVARCHAR(100)
AS
BEGIN
    INSERT INTO Equipos (Nombre, Marca, Serie)
    VALUES (@Nombre, @Marca, @Serie)
END

ALTER PROCEDURE ModificarEquipo
    @EquipoID INT,
    @Nombre NVARCHAR(100),
    @Marca NVARCHAR(100),
    @Serie NVARCHAR(100)
AS
BEGIN
    UPDATE Equipos
    SET Nombre = @Nombre,
        Marca = @Marca,
        Serie = @Serie
    WHERE EquipoID = @EquipoID
END


-- Insertar
CREATE PROCEDURE InsertarTecnico
    @Nombre NVARCHAR(100),
    @Especialidad NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad, Telefono)
    VALUES (@Nombre, @Especialidad, @Telefono)
END
GO

-- Consultar
CREATE PROCEDURE ConsultarTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos
END
GO

-- Modificar
CREATE PROCEDURE ModificarTecnico
    @TecnicoID INT,
    @Nombre NVARCHAR(100),
    @Especialidad NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = @Nombre,
        Especialidad = @Especialidad,
        Telefono = @Telefono
    WHERE TecnicoID = @TecnicoID
END
GO

-- Eliminar
CREATE PROCEDURE EliminarTecnico
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID
END
GO

SELECT * FROM sys.tables WHERE name = 'Tecnicos';

CREATE PROCEDURE ConsultarTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos
END


CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Especialidad NVARCHAR(100)
);

CREATE PROCEDURE ConsultarTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos;
END
ALTER TABLE Tecnicos ADD Telefono NVARCHAR(100);

ALTER PROCEDURE InsertarTecnico
    @Nombre NVARCHAR(100),
    @Especialidad NVARCHAR(100),
    @Telefono NVARCHAR(100)
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad, Telefono)
    VALUES (@Nombre, @Especialidad, @Telefono);
END
ALTER PROCEDURE ModificarTecnico
    @TecnicoID INT,
    @Nombre NVARCHAR(100),
    @Especialidad NVARCHAR(100),
    @Telefono NVARCHAR(100)
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = @Nombre,
        Especialidad = @Especialidad,
        Telefono = @Telefono
    WHERE TecnicoID = @TecnicoID;
END


SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Tecnicos');


CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    EquipoID INT,
    FechaRecepcion DATE,
    Descripcion NVARCHAR(250),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);


-- CREAR LA TABLA (si aún no existe)
CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    EquipoID INT,
    FechaIngreso DATE,
    Estado NVARCHAR(50),
    Observaciones NVARCHAR(255)
);

CREATE PROCEDURE InsertarReparacion
    @UsuarioID INT,
    @EquipoID INT,
    @FechaIngreso DATE
AS
BEGIN
    INSERT INTO Reparaciones (UsuarioID, EquipoID, FechaIngreso)
    VALUES (@UsuarioID, @EquipoID, @FechaIngreso);
END;

ALTER TABLE Reparaciones
ADD Estado NVARCHAR(50);


ALTER TABLE Reparaciones
ADD FechaSolicitud DATE;

CREATE PROCEDURE InsertarReparacion
    @UsuarioID INT,
    @EquipoID INT,
    @FechaIngreso DATE,  -- usa el nombre correcto de la columna
    @Estado NVARCHAR(50)
AS
BEGIN
    INSERT INTO Reparaciones (UsuarioID, EquipoID, FechaIngreso, Estado)
    VALUES (@UsuarioID, @EquipoID, @FechaIngreso, @Estado)
END
GO

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Reparaciones';


CREATE PROCEDURE InsertarReparacion
    @UsuarioID INT,
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado NVARCHAR(50)
AS
BEGIN
    INSERT INTO Reparaciones (UsuarioID, EquipoID, FechaSolicitud, Estado)
    VALUES (@UsuarioID, @EquipoID, @FechaSolicitud, @Estado)
END
GO


SELECT UsuarioID, Nombre FROM Usuarios;

CREATE PROCEDURE InsertarAsignacion
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion);
END
GO

SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Asignaciones';

CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY IDENTITY(1,1),
    ReparacionID INT FOREIGN KEY REFERENCES Reparaciones(ReparacionID),
    TecnicoID INT FOREIGN KEY REFERENCES Tecnicos(TecnicoID),
    FechaAsignacion DATE
);

CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100)
);

SELECT 
    R.ReparacionID,
    R.UsuarioID,
    R.EquipoID,
    R.FechaSolicitud,
    R.Estado,
    T.Nombre AS TecnicoNombre
FROM Reparaciones R
LEFT JOIN Asignaciones A ON R.ReparacionID = A.ReparacionID
LEFT JOIN Tecnicos T ON A.TecnicoID = T.TecnicoID;



ALTER PROCEDURE ConsultarReparaciones
AS
BEGIN
    SELECT 
        R.ReparacionID,
        R.UsuarioID,
        R.EquipoID,
        R.FechaSolicitud,
        R.Estado,
        T.Nombre AS TecnicoNombre
    FROM Reparaciones R
    LEFT JOIN Asignaciones A ON R.ReparacionID = A.ReparacionID
    LEFT JOIN Tecnicos T ON A.TecnicoID = T.TecnicoID
END


EXEC ConsultarReparaciones


EXEC sp_helptext 'InsertarReparacion';

SELECT ROUTINE_NAME, ROUTINE_DEFINITION
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_NAME = 'InsertarReparacion';


ALTER PROCEDURE InsertarReparacion
    @UsuarioID INT,
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(50)
AS
BEGIN
    INSERT INTO Reparaciones (UsuarioID, EquipoID, FechaSolicitud, Estado)
    VALUES (@UsuarioID, @EquipoID, @FechaSolicitud, @Estado)
END


ALTER PROCEDURE ModificarReparacion
    @ReparacionID INT,
    @UsuarioID INT,
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(50)
AS
BEGIN
    UPDATE Reparaciones
    SET UsuarioID = @UsuarioID,
        EquipoID = @EquipoID,
        FechaSolicitud = @FechaSolicitud,
        Estado = @Estado
    WHERE ReparacionID = @ReparacionID
END


CREATE PROCEDURE ConsultarReparacionesPorEstado
    @Estado VARCHAR(50)
AS
BEGIN
    SELECT 
        R.ReparacionID, 
        R.UsuarioID,
        R.EquipoID,
        R.FechaSolicitud,
        R.Estado,
        T.Nombre AS TecnicoNombre
    FROM Reparaciones R
    LEFT JOIN Asignaciones A ON R.ReparacionID = A.ReparacionID
    LEFT JOIN Tecnicos T ON A.TecnicoID = T.TecnicoID
    WHERE R.Estado = @Estado;
END


CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Correo NVARCHAR(100) UNIQUE NOT NULL,
    Clave NVARCHAR(100) NOT NULL
);

SELECT * FROM Usuarios;

ALTER TABLE Usuarios
ADD Correo NVARCHAR(100),
    Clave NVARCHAR(100);
