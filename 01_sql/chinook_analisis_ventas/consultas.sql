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
