--CREATE DATABASE Pruebaa;
--USE Pruebaa;
--CREATE TABLE productos(
--	id_producto INTEGER IDENTITY(1, 1) NOT NULL,
--	nombres NCHAR(50) NOT NULL,
--	id_categoria INTEGER NOT NULL,
--	precio MONEY,
--	disponible NCHAR(25),
--	detalles NCHAR(25),
--	PRIMARY KEY (id_producto)
--);

--CREATE TABLE Venta(
--	id_producto INTEGER IDENTITY(1, 1) NOT NULL,
--	cantidad INTEGER NOT NULL,
--	PRIMARY KEY(id_producto)
--	);

--creando trigger
CREATE TRIGGER realiza_ventas
ON Venta FOR INSERT
AS
BEGIN
	DECLARE @producto AS INT
	DECLARE @cantidad AS INT

	SET @producto = (SELECT id_producto FROM INSERTED)
	SET @cantidad = (SELECT cantidad FROM INSERTED)

	UPDATE productos
	SET disponible = disponible - @cantidad
	WHERE id_producto LIKE @producto
END