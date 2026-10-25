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
