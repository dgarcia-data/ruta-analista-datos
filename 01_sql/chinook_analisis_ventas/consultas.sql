/*
Proyecto: Análisis de ventas de Chinook
Motor: SQLite
Objetivo: analizar clientes, facturación y géneros musicales
Autor: Diego García
*/

-- =========================================================
-- 1. EXPLORACIÓN INICIAL
-- Pregunta: ¿qué clientes están registrados?
-- =========================================================

SELECT 
	customerId,
	FirstName,
	LastName,
	Country
from Customer
ORDER by FirstName;

-- =========================================================
-- 2. FILTRO CON WHERE
-- Pregunta: ¿qué clientes pertenecen a Brasil o USA?
-- =========================================================

SELECT 
	FirstName || ' ' || LastName as nombre_completo,
	Country,
	City
FROM Customer
WHERE Country = 'Brazil' or Country = 'USA'
ORDER by Country ASC;

-- =========================================================
-- 3. AGREGACIÓN CON GROUP BY
-- Pregunta: ¿cuántos clientes hay en cada país?
-- =========================================================

SELECT 
	Country,
	count(CustomerId) as total_por_pais
FROM Customer
GROUP by Country
ORDER by total_por_pais DESC;

-- =========================================================
-- 4. JOIN ENTRE CLIENTES Y FACTURAS
-- Pregunta: ¿cuánto ha gastado cada cliente?
-- =========================================================

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName as nombre_completo,
	round(sum(i.total),2) as venta_total
FROM Customer as c
INNER JOIN Invoice as i
	on i.CustomerId = c.CustomerId
GROUP by
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER by venta_total desc;

-- =========================================================
-- 5. VENTAS POR PAÍS
-- Pregunta: ¿qué países generan mayor facturación?
-- =========================================================

SELECT
	BillingCountry as pais,
	Count(InvoiceId) as numero_facturas,
	round(sum(total),2) as total_pais,
	round(avg(total),2) as promedio_pais
FROM Invoice
GROUP by BillingCountry
ORDER by total_pais desc;

-- =========================================================
-- 6. JOIN DE VARIAS TABLAS
-- Pregunta: ¿qué géneros musicales generan más ingresos?
-- =========================================================

SELECT
	g.name as genero,
	round(sum(il.UnitPrice * il.Quantity),2) as venta_genero
from Genre as g
INNER JOIN Track as t
	on g.GenreId = t.GenreId
INNER JOIN InvoiceLine as il
	on t.TrackId = il.TrackId
GROUP by
	g.GenreId,
	g.name
ORDER by venta_genero DESC;

DROP VIEW IF EXISTS vista_ventas_clientes;

CREATE VIEW vista_ventas_clientes AS
SELECT
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS cliente,
    c.Country AS pais,
    COUNT(DISTINCT i.InvoiceId) AS cantidad_facturas,
    ROUND(SUM(i.Total), 2) AS gasto_total
FROM Customer AS c
LEFT JOIN Invoice AS i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country;

-- Consulta de comprobación: clientes con mayor gasto

SELECT *
FROM vista_ventas_clientes
ORDER BY gasto_total DESC;

-- =========================================================
-- 8. ÍNDICE DE PRÁCTICA
-- Objetivo: facilitar búsquedas por país de facturación
-- =========================================================

CREATE INDEX IF NOT EXISTS idx_invoice_billing_country
ON Invoice (BillingCountry);

-- =========================================================
-- VALIDACIONES FINALES
-- =========================================================

-- Se comparó la facturación general con los totales
-- agrupados por cliente, país y género musical.

-- Se verificó que los JOIN no duplicaran ni excluyeran ventas.

-- Se revisó el funcionamiento de la vista y del índice mediante
-- consultas de comprobación.

-- =========================================================
-- FIN DEL PROYECTO
-- Proyecto: Análisis de ventas de Chinook
-- Estado: finalizado
-- =========================================================
