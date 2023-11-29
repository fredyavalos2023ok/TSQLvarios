CREATE DATABASE dbinnerjoinuno
USE dbinnerjoinuno
CREATE TABLE Pedidos(
	id_pedido INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	fecha INTEGER, 
	id_cliente INTEGER CONSTRAINT FK_dbinnerjoinuno_id_cliente FOREIGN KEY(id_cliente) REFERENCES Clientess(id_cliente)
);

CREATE TABLE Clientess(
	id_cliente INTEGER IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	nombre_cliente VARCHAR(90),
	dirección VARCHAR(90)
);

SELECT * FROM Clientess

SELECT * 
FROM Clientess AS cl
INNER JOIN Pedidos AS Pd
ON cl.id_cliente = Pd.id_cliente