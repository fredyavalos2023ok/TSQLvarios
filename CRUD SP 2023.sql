CREATE DATABASE spuno;
USE spuno;
CREATE TABLE Producto(
	codigo INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50),
	precio DECIMAL(4),
	color VARCHAR(20)
	);

CREATE PROCEDURE pr_insertarProducto(@nom VARCHAR(50), @precio SMALLMONEY, @color VARCHAR(20))
AS
BEGIN
	INSERT INTO Producto (nombre, precio, color) 
	VALUES (@nom, @precio, @color);
END
GO

EXEC pr_insertarProducto 'automovil', 2300, 'Rojo'

CREATE PROCEDURE prbuscarProducto(@nombre VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM Producto
	WHERE nombre LIKE '%' + @nombre + '%'
END
GO

EXEC prbuscarProducto 'auto'

CREATE PROCEDURE calcularPromedio(@n1 DECIMAL(4,2), @n2 DECIMAL(4,2), @resu DECIMAL(4,2) OUTPUT)
AS
BEGIN
	SELECT @resu = (@n1+@n2)/2;
END
GO

DECLARE @variableResultado DECIMAL (4,2)
EXECUTE calcularPromedio 5, 6, @variableResultado OUTPUT
SELECT @variableResultado