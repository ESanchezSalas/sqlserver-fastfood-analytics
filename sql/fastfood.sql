CREATE DATABASE SistemaPedidos;
GO

USE SistemaPedidos;
GO

--CREAR TABLAS
CREATE TABLE Categoria (
    IdCategoria INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Producto (
    IdProducto INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    IdCategoria INT FOREIGN KEY REFERENCES Categoria(IdCategoria)
);
GO

CREATE TABLE Origen (
    IdOrigen INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE TipoPago (
    IdTipoPago INT PRIMARY KEY IDENTITY,
    Metodo NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Sucursal (
    IdSucursal INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(200)
);
GO

CREATE TABLE Departamento (
    IdDepartamento INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100)
);
GO

CREATE TABLE Puesto (
    IdPuesto INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100)
);
GO

CREATE TABLE Rol (
    IdRol INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100)
);
GO

CREATE TABLE Empleado (
    IdEmpleado INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    IdSucursal INT FOREIGN KEY REFERENCES Sucursal(IdSucursal),
    IdDepartamento INT FOREIGN KEY REFERENCES Departamento(IdDepartamento),
    IdPuesto INT FOREIGN KEY REFERENCES Puesto(IdPuesto),
    IdRol INT FOREIGN KEY REFERENCES Rol(IdRol)
);
GO

CREATE TABLE Mensajero (
    IdMensajero INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    EsEmpleado BIT --1 si es interno, 0 si es externo
);
GO

CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Telefono NVARCHAR(20),
    Direccion NVARCHAR(200)
);
GO

CREATE TABLE Orden (
    IdOrden INT PRIMARY KEY IDENTITY,
    IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente),
    IdSucursal INT FOREIGN KEY REFERENCES Sucursal(IdSucursal),
    IdEmpleado INT FOREIGN KEY REFERENCES Empleado(IdEmpleado),
    IdMensajero INT FOREIGN KEY REFERENCES Mensajero(IdMensajero),
    IdOrigen INT FOREIGN KEY REFERENCES Origen(IdOrigen),
    IdTipoPago INT FOREIGN KEY REFERENCES TipoPago(IdTipoPago),
    HorarioVenta NVARCHAR(20),
    TotalCompra DECIMAL(10,2),
    KilometrosRecorrer DECIMAL(5,2) NULL,
    FechaDespacho DATETIME NULL,
    FechaEntrega DATETIME NULL,
    FechaOrdenTomada DATETIME NULL,
    FechaOrdenLista DATETIME NULL
);
GO

CREATE TABLE OrdenProducto (
    IdOrden INT FOREIGN KEY REFERENCES Orden(IdOrden),
    IdProducto INT FOREIGN KEY REFERENCES Producto(IdProducto),
    Cantidad INT NOT NULL,
    PRIMARY KEY (IdOrden, IdProducto)
);
GO

-- Insertar datos en Categoria
INSERT INTO Categoria (Nombre) VALUES
('Comida Rápida'), 
('Postres'), 
('Bebidas'), 
('Ensaladas'), 
('Desayunos'),
('Cafetería'), 
('Helados'), 
('Comida Vegana'), 
('Carnes'), 
('Pizzas');
GO

Select * from Categoria
GO

-- Insertar datos en Producto
INSERT INTO Producto (Nombre, IdCategoria, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), 
('Cheeseburger', 1, 7.99), 
('Pizza Margarita', 10, 11.99), 
('Pizza Pepperoni', 10, 12.99), 
('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), 
('Ensalada César', 4, 5.99), 
('Ensalada Griega', 4, 6.99), 
('Pastel de Zanahoria', 2, 3.99), 
('Brownie', 2, 2.99);
GO

Select * from Producto
GO

-- Insertar datos en Sucursal
INSERT INTO Sucursal (Nombre, Direccion) VALUES
('Sucursal Central', '1234 Main St'), 
('Sucursal Norte', '5678 North St'), 
('Sucursal Este', '9101 East St'), 
('Sucursal Oeste', '1121 West St'), 
('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), 
('Sucursal Montaña', '1718 Mountain St'), 
('Sucursal Valle', '1920 Valley St'), 
('Sucursal Lago', '2122 Lake St'), 
('Sucursal Bosque', '2324 Forest St');
GO

Select * from Sucursal
GO

-- Insertar departamentos
INSERT INTO Departamento (Nombre) VALUES
  ('Administración'),
  ('Ventas'),
  ('Cocina'),
  ('Cafetería'),
  ('Logística'),
  ('Servicio'),
  ('Restaurante'),
  ('Mantenimiento');
GO

--Insertar datos en Puesto
INSERT INTO Puesto (Nombre) VALUES
('Gerente'),
('Subgerente'),
('Cajero'),
('Cocinero'),
('Barista'),
('Repartidor'),
('Atención al Cliente'),
('Encargado de Turno'),
('Mesero'),
('Auxiliar de Limpieza');
GO

--Insertar datos en Rol
INSERT INTO Rol (Nombre) VALUES
('Vendedor'),
('Mensajero');
GO

-- Insertar datos en Empleado
INSERT INTO Empleado (Nombre, Apellido, IdSucursal, IdDepartamento, IdPuesto, IdRol) VALUES
('John',   'Doe',       1, 1, 1, 1),
('Jane',   'Smith',     1, 2, 2, 1),
('Bill',   'Jones',     1, 2, 3, 1),
('Alice',  'Johnson',   1, 3, 4, 1),
('Tom',    'Brown',     1, 4, 5, 1),
('Emma',   'Davis',     1, 5, 6, 2),
('Lucas',  'Miller',    1, 6, 7, 1),
('Olivia','García',     1, 1, 8, 1),
('Ethan',  'Martinez',  1, 7, 9, 1),
('Sophia', 'Rodriguez', 1, 8,10, 1);
GO

Select * from Empleado
GO

-- Insertar datos en Cliente
INSERT INTO Cliente (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), 
('Cliente Dos', '1001 B Street'), 
('Cliente Tres', '1002 C Street'), 
('Cliente Cuatro', '1003 D Street'), 
('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), 
('Cliente Siete', '1006 G Street'), 
('Cliente Ocho', '1007 H Street'), 
('Cliente Nueve', '1008 I Street'), 
('Cliente Diez', '1009 J Street');
GO

Select * from Cliente
GO

-- Insertar datos en Origen
INSERT INTO Origen (Nombre) VALUES
('En línea'), 
('Presencial'), 
('Teléfono'), 
('Drive Thru'), 
('App Móvil'),
('Redes Sociales'), 
('Correo Electrónico'), 
('Publicidad'), 
('Recomendación'), 
('Evento');
GO

Select * from Origen
GO

-- Insertar datos en TipoPago
INSERT INTO TipoPago (Metodo) VALUES
('Efectivo'), 
('Tarjeta de Crédito'), 
('Tarjeta de Débito'), 
('PayPal'), 
('Transferencia Bancaria'),
('Criptomonedas'), 
('Cheque'), 
('Vale de Comida'), 
('Cupón de Descuento'), 
('Pago Móvil');
GO

Select * from TipoPago
GO

-- Insertar datos en Mensajero
INSERT INTO Mensajero (Nombre, EsEmpleado) VALUES
('Mensajero Uno', 0), 
('Mensajero Dos', 1), 
('Mensajero Tres', 0), 
('Mensajero Cuatro', 1), 
('Mensajero Cinco', 0),
('Mensajero Seis', 1), 
('Mensajero Siete', 0), 
('Mensajero Ocho', 1), 
('Mensajero Nueve', 0), 
('Mensajero Diez', 1);
GO

Select * from Mensajero
GO

-- Insertar datos en Orden
INSERT INTO Orden (IdCliente, IdEmpleado, IdSucursal, IdMensajero, IdTipoPago, IdOrigen, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
( 1,  3,  1,  1,  1,  1, 'Mañana', 1053.51,  5.5, '2023-01-10 08:30:00','2023-01-10 09:00:00','2023-01-10 08:00:00','2023-01-10 08:15:00'),
( 2,  4,  2,  2,  2,  2, 'Tarde',  1075.00, 10.0, '2023-02-15 14:30:00','2023-02-15 15:00:00','2023-02-15 13:30:00','2023-02-15 14:00:00'),
( 3,  5,  3,  3,  3,  3, 'Noche',   920.00,  2.0, '2023-03-20 19:30:00','2023-03-20 20:00:00','2023-03-20 19:00:00','2023-03-20 19:15:00'),
( 4,  6,  4,  4,  4,  4, 'Mañana',   930.00,  0.5, '2023-04-25 09:30:00','2023-04-25 10:00:00','2023-04-25 09:00:00','2023-04-25 09:15:00'),
( 5,  7,  5,  5,  5,  5, 'Tarde',    955.00,  8.0, '2023-05-30 15:30:00','2023-05-30 16:00:00','2023-05-30 15:00:00','2023-05-30 15:15:00'),
( 6,  8,  6,  6,  6,  6, 'Noche',    945.00, 12.5, '2023-06-05 20:30:00','2023-06-05 21:00:00','2023-06-05 20:00:00','2023-06-05 20:15:00'),
( 7,  9,  7,  7,  7,  7, 'Mañana',  1065.00,  7.5, '2023-07-10 08:30:00','2023-07-10 09:00:00','2023-07-10 08:00:00','2023-07-10 08:15:00'),
( 8, 10, 8, 8, 8, 8, 'Tarde',   1085.00,  9.5, '2023-08-15 14:30:00','2023-08-15 15:00:00','2023-08-15 14:00:00','2023-08-15 14:15:00'),
( 9, 11, 9, 9, 9,  9, 'Noche',   1095.00,  3.0, '2023-09-20 19:30:00','2023-09-20 20:00:00','2023-09-20 19:00:00','2023-09-20 19:15:00'),
(10, 12, 10, 10, 10, 10, 'Mañana',   900.00, 15.0, '2023-10-25 09:30:00','2023-10-25 10:00:00','2023-10-25 09:00:00','2023-10-25 09:15:00');
GO

Select * from Orden
GO

-- Insertar datos en OrdenProducto
INSERT INTO OrdenProducto (IdOrden, IdProducto, Cantidad) VALUES
(38,  1, 3),
(39,  2, 5),
(40,  3, 4),
(41,  4, 4),
(42,  5, 1),
(43,  6, 4),
(44,  7, 2),
(45,  8, 2),
(46,  9, 4),
(47, 10, 3);
GO

Select * from OrdenProducto
GO


--PREGUNTAS SEGUNDO AVANCE

-- 1. ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?
SELECT 
  COUNT(*) AS TotalOrdenesUnicas
FROM Orden;
GO

-- 2. ¿Cuántos empleados existen en cada departamento?
SELECT
  e.IdDepartamento,
  COUNT(*)       AS TotalEmpleados
FROM Empleado e
GROUP BY
  e.IdDepartamento;
GO

-- 3. ¿Cuántos productos hay por código de categoría?
SELECT 
  p.IdCategoria,
  COUNT(*)       AS TotalProductos
FROM Producto p
GROUP BY p.IdCategoria;
GO

-- 4. ¿Cuántos clientes se han importado a la tabla de clientes?
SELECT 
  COUNT(*) AS TotalClientesImportados
FROM Cliente;
GO

-- 5. ¿Cuáles son las sucursales con un promedio de facturación > 1000 y que minimizan sus costos en base al promedio de kilómetros recorridos?
SELECT 
  s.IdSucursal,
  s.Nombre,
  AVG(o.TotalCompra)        AS PromedioFacturacion,
  AVG(o.KilometrosRecorrer) AS PromedioKmRecorridos
FROM Orden o
JOIN Sucursal s
  ON o.IdSucursal = s.IdSucursal
GROUP BY 
  s.IdSucursal, s.Nombre
HAVING 
  AVG(o.TotalCompra) > 1000
ORDER BY 
  AVG(o.KilometrosRecorrer);
GO

--PREGUNTAS TERCER AVANCE 

-- 6. ¿Cuál es el total de ventas (TotalCompra) a nivel global?
SELECT 
  SUM(TotalCompra) AS TotalVentasGlobales
FROM Orden;
GO

-- 7. ¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT 
  c.IdCategoria,
  c.Nombre         AS Categoria,
  AVG(p.Precio)    AS PrecioPromedio
FROM Producto p
JOIN Categoria c 
  ON p.IdCategoria = c.IdCategoria
GROUP BY 
  c.IdCategoria, c.Nombre;
GO

--8. ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
SELECT 
  s.IdSucursal,
  s.Nombre             AS Sucursal,
  MIN(o.TotalCompra)   AS OrdenMinima,
  MAX(o.TotalCompra)   AS OrdenMaxima
FROM Orden o
JOIN Sucursal s 
  ON o.IdSucursal = s.IdSucursal
GROUP BY 
  s.IdSucursal, s.Nombre;
GO

--9. ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT 
  MAX(KilometrosRecorrer) AS KilometrosMaximos
FROM Orden;
GO

--10. ¿Cuál es la cantidad promedio de productos por orden?
SELECT 
  AVG(CantidadTotal) AS PromedioProductosPorOrden
FROM (
  SELECT 
    op.IdOrden,
    SUM(op.Cantidad) AS CantidadTotal
  FROM OrdenProducto op
  GROUP BY op.IdOrden
) AS sub;
GO

--11. ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
SELECT 
  tp.IdTipoPago,
  tp.Metodo           AS TipoPago,
  SUM(o.TotalCompra)  AS TotalVentas
FROM Orden o
JOIN TipoPago tp 
  ON o.IdTipoPago = tp.IdTipoPago
GROUP BY 
  tp.IdTipoPago, tp.Metodo;
GO

--12. ¿Cuál Sucursal tiene el ingreso promedio más alto?
SELECT TOP 1
  s.IdSucursal,
  s.Nombre            AS Sucursal,
  AVG(o.TotalCompra)  AS PromedioVentas
FROM Orden o
JOIN Sucursal s 
  ON o.IdSucursal = s.IdSucursal
GROUP BY 
  s.IdSucursal, s.Nombre
ORDER BY 
  AVG(o.TotalCompra) DESC;
GO

--13. ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?
SELECT 
  s.IdSucursal,
  s.Nombre           AS Sucursal,
  SUM(o.TotalCompra) AS TotalVentas
FROM Orden o
JOIN Sucursal s 
  ON o.IdSucursal = s.IdSucursal
GROUP BY 
  s.IdSucursal, s.Nombre
HAVING 
  SUM(o.TotalCompra) > 1000;
GO

--14. ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
SELECT 'Antes'   AS Periodo,
       AVG(TotalCompra) AS PromedioVentas
FROM Orden
WHERE FechaOrdenTomada < '2023-07-01'
UNION ALL
SELECT 'Después',
       AVG(TotalCompra)
FROM Orden
WHERE FechaOrdenTomada >= '2023-07-01';
GO

--15. ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?
SELECT 
  HorarioVenta             AS Jornada,
  COUNT(*)                 AS TotalOrdenes,
  AVG(TotalCompra)         AS IngresoPromedio,
  MAX(TotalCompra)         AS IngresoMaximo
FROM Orden
GROUP BY HorarioVenta;
GO

--PREGUNTAS CUARTO AVANCE

--16. ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
SELECT
  p.IdProducto,
  p.Nombre       AS Producto,
  c.IdCategoria,
  c.Nombre       AS Categoria
FROM Producto p
LEFT JOIN Categoria c
  ON p.IdCategoria = c.IdCategoria;
GO

--17. ¿Cómo puedo saber a qué sucursal está asignado cada empleado?
SELECT
  e.IdEmpleado,
  e.Nombre       AS NombreEmpleado,
  e.Apellido     AS ApellidoEmpleado,
  s.IdSucursal,
  s.Nombre       AS Sucursal
FROM Empleado e
INNER JOIN Sucursal s
  ON e.IdSucursal = s.IdSucursal;
GO

--18. ¿Existen productos que no tienen una categoría asignada?
SELECT
  p.IdProducto,
  p.Nombre       AS Producto
FROM Producto p
LEFT JOIN Categoria c
  ON p.IdCategoria = c.IdCategoria
WHERE c.IdCategoria IS NULL;
GO

--19. ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?
SELECT
  o.IdOrden,
  c.Nombre               AS Cliente,
  CONCAT(e.Nombre, ' ', e.Apellido) AS Empleado,
  m.Nombre               AS Mensajero,
  o.TotalCompra,
  o.FechaOrdenTomada
FROM Orden o
INNER JOIN Cliente c
  ON o.IdCliente    = c.IdCliente
INNER JOIN Empleado e
  ON o.IdEmpleado   = e.IdEmpleado
INNER JOIN Mensajero m
  ON o.IdMensajero  = m.IdMensajero;
GO

--20. ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?
SELECT
  s.IdSucursal,
  s.Nombre               AS Sucursal,
  c.IdCategoria,
  c.Nombre               AS Categoria,
  SUM(op.Cantidad)       AS TotalArticulosVendidos
FROM OrdenProducto op
INNER JOIN Orden o
  ON op.IdOrden    = o.IdOrden
INNER JOIN Sucursal s
  ON o.IdSucursal  = s.IdSucursal
INNER JOIN Producto p
  ON op.IdProducto = p.IdProducto
INNER JOIN Categoria c
  ON p.IdCategoria = c.IdCategoria
GROUP BY
  s.IdSucursal, s.Nombre,
  c.IdCategoria, c.Nombre
ORDER BY
  s.IdSucursal, c.IdCategoria;
GO
