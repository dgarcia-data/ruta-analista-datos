/*
Proyecto: Análisis comercial de Northwind
Motor: SQLite
Objetivo: analizar clientes, pedidos, productos y ventas
Autor: Diego García
*/

-- =========================================================
-- 1. PRODUCTOS CON MENOR INVENTARIO
-- Pregunta: ¿Qué productos tienen menor inventario?
-- =========================================================

SELECT
	ProductID,
	ProductName,
	UnitsInStock
FROM Products
ORDER BY UnitsInStock ASC
LIMIT 25;

-- =========================================================
-- 2. PRODUCTOS POR CATEGORÍA
-- Pregunta: ¿Cuántos productos existen por categoría?
-- =========================================================

SELECT
	c.CategoryID,
	c.CategoryName,
	count(p.CategoryID) as total_productos
FROM Categories as c
INNER JOIN Products as p
	on c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
ORDER BY total_productos DESC;

-- =========================================================
-- 3. CLIENTES POR PAÍS
-- Pregunta: ¿Qué países tienen más clientes?
-- =========================================================

SELECT
	coalesce(country,'pais_no_registrado') as pais,
	count(*) as total_por_pais
from Customers
GROUP BY pais
ORDER BY
	total_por_pais DESC,
	Country ASC;

-- =========================================================
-- 4. CATEGORÍAS CON MÁS DE 10 PRODUCTOS
-- Pregunta: ¿Qué categorías tienen más de diez productos?
-- =========================================================

SELECT
	c.CategoryID,
	c.CategoryName,
	count(p.CategoryID) as total_productos
FROM Categories as c
INNER JOIN Products as p
	on c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
HAVING total_productos >= 10
ORDER BY total_productos DESC;

-- =========================================================
-- 5. CLIENTES CON MAYOR FACTURACIÓN
-- Pregunta: ¿Qué clientes generan mayor facturación neta?
-- NOTA: en la tabla "order details" y la columna "Discount"
-- no se define si el descuento es en porcentaje o un valor fijo,
-- en este caso y por tratarse de consultas meramente academicas
-- decido calcular el descuento en porcentaje
-- =========================================================

SELECT
	c.CustomerID,
	c.CompanyName,
	round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)),2) as venta_total
FROM Customers as c
INNER JOIN Orders as o
	on c.CustomerID = o.CustomerID
INNER JOIN "Order details" as od
	on o.OrderID = od.OrderID
GROUP BY 
	c.CustomerID,
	c.CompanyName
ORDER BY
	venta_total DESC

-- =========================================================
-- 6. VENTAS POR CATEGORÍA
-- Pregunta: ¿Qué categorías generan mayores ingresos?
-- =========================================================

SELECT
	c.CategoryID,
	c.CategoryName,
	round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)),2) as venta_total
from Categories as c
INNER JOIN Products as p
	on c.CategoryID = p.CategoryID
INNER JOIN "order details" as od
	on p.ProductID = od.ProductID
GROUP BY
	c.CategoryID,
	c.CategoryName
ORDER BY
	venta_total DESC;

-- =========================================================
-- 7. PRODUCTOS MÁS VENDIDOS
-- Pregunta: ¿Cuáles son los productos más vendidos?
-- =========================================================

SELECT
	p.ProductID,
	p.ProductName,
	sum(od.Quantity) as cantidad_vendida
FROM Products as p
INNER JOIN "order details" as od
	on p.ProductID = od.ProductID
GROUP BY
	p.ProductID,
	p.ProductName
ORDER BY cantidad_vendida DESC;

-- =========================================================
-- 8. FACTURACIÓN GESTIONADA POR EMPLEADO
-- Pregunta: ¿Qué empleados gestionan mayor facturación?
-- =========================================================

SELECT
	e.EmployeeID,
	e.FirstName||' '||e.LastName as nombre_completo,
	count(DISTINCT o.OrderID) as cantidad_pedidos,
	round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)),2) as venta_total
FROM Employees as e
INNER JOIN Orders as o
	on e.EmployeeID = o.EmployeeID
INNER JOIN "order details" as od
	on o.OrderID = od.OrderID
GROUP BY
	e.EmployeeID,
	nombre_completo
ORDER BY venta_total DESC;

-- =========================================================
-- 9. SEGMENTACIÓN DE CLIENTES
-- Pregunta: ¿Cómo clasificar a los clientes según su facturación?
-- NOTA: se reutiliza la consulta 5
-- =========================================================

WITH ventas_por_cliente as (
	SELECT
		c.CustomerID,
		c.CompanyName,
		round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)),2) as venta_total
	FROM Customers as c
	INNER JOIN Orders as o
		on c.CustomerID = o.CustomerID
	INNER JOIN "Order details" as od
		on o.OrderID = od.OrderID
	GROUP BY 
		c.CustomerID,
		c.CompanyName
	ORDER BY
		venta_total DESC
)

SELECT 
	CustomerID,
	CompanyName,
	venta_total,
	CASE
		WHEN venta_total = 0 THEN 'sin compras'
		WHEN venta_total < 4000000 THEN 'compras bajas'
		WHEN venta_total >= 4000000 AND venta_total < 5000000 THEN 'compras promedio'
		ELSE 'compras altas'
	END as estado_compras
FROM ventas_por_cliente;

-- =========================================================
-- 10. PRODUCTOS CON VENTAS SUPERIORES AL PROMEDIO
-- Pregunta: ¿Qué productos generan ingresos superiores al promedio?
-- =========================================================


WITH ventas_productos AS (
    SELECT
        p.ProductID,
        p.ProductName,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS venta_total
    FROM Products AS p
    INNER JOIN "Order Details" AS od
        ON p.ProductID = od.ProductID
    GROUP BY
        p.ProductID,
        p.ProductName
)

SELECT
    ProductID,
    ProductName,
    ROUND(venta_total, 2) AS venta_total,
    ROUND((SELECT AVG(venta_total)
            FROM ventas_productos),2) AS promedio_venta
FROM ventas_productos
WHERE venta_total > (SELECT AVG(venta_total)
					 FROM ventas_productos)
ORDER BY
    venta_total DESC;

-- =========================================================
-- 11. VENTAS POR AÑO Y MES
-- Pregunta: ¿Cómo evolucionan las ventas a lo largo del tiempo?
-- =========================================================

    SELECT
    strftime('%Y', o.OrderDate) AS anio,
    strftime('%m', o.OrderDate) AS mes,
    count(DISTINCT o.OrderID) as cantidad_ordenes,
    round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)),2) as venta_total
FROM Orders AS o
INNER JOIN "Order Details" AS od
    ON o.OrderID = od.OrderID
WHERE o.OrderDate IS NOT NULL
GROUP BY
    strftime('%Y', o.OrderDate),
    strftime('%m', o.OrderDate)
ORDER BY
    anio ASC,
    mes ASC;
