CREATE DATABASE dbtriggerpracticauno
USE dbtriggerpracticauno

CREATE TABLE venta(
	id INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	fecha INTEGER,
	total INTEGER
);

CREATE TABLE concepto(
	id INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	idVenta INTEGER,
	descripcion VARCHAR(90),
	precio DECIMAL(4, 2)
);

INSERT INTO venta(fecha, total) VALUES(2020, 100);
INSERT INTO concepto(idVenta, descripcion, precio) VALUES(1, 'papitas', 10.00);
INSERT INTO concepto(idVenta, descripcion, precio) VALUES(1, 'cerveza', 40.00);
INSERT INTO concepto(idVenta, descripcion, precio) VALUES(1, 'leche', 50.00);

CREATE TRIGGER triggeruno
ON concepto
FOR update
AS
	declare @idVenta INTEGER = (SELECT idVenta FROM inserted)
	update venta SET total = (SELECT sum(precio) FROM concepto WHERE idVenta = @idVenta)
	WHERE id = @idVenta;