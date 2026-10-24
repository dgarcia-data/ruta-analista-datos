# Análisis comercial de Northwind con SQL

## Descripción

Este proyecto analiza la base de datos Northwind, que representa las
operaciones comerciales de una empresa con clientes, pedidos, productos,
categorías, proveedores, empleados y transportistas.

El objetivo es profundizar en SQL mediante preguntas relacionadas con
ventas, inventario, clientes, productos y rendimiento comercial.

## Preguntas de análisis

- ¿Qué productos tienen menor inventario?
- ¿Qué categorías contienen más productos?
- ¿Qué clientes generan mayor facturación?
- ¿Qué categorías y productos producen mayores ingresos?
- ¿Qué empleados gestionan mayor facturación?
- ¿Cómo evolucionan las ventas por periodo?
- ¿Qué productos destacan dentro de cada categoría?

## Herramientas

- SQLite
- DB Browser for SQLite
- Visual Studio Code
- GitHub

## Conceptos aplicados

- `SELECT`, `WHERE`, `ORDER BY` y `LIMIT`
- `COUNT`, `SUM`, `AVG`, `MIN` y `MAX`
- `GROUP BY` y `HAVING`
- `INNER JOIN` y `LEFT JOIN`
- `CASE WHEN`
- Fechas y valores `NULL`
- Subconsultas
- CTE
- Funciones de ventana
- Vistas
- Índices
- `EXPLAIN QUERY PLAN`

## Fuente de datos

Se utiliza una adaptación para SQLite de la base de datos de ejemplo
Northwind.

Repositorio de origen:

https://github.com/jpwhite3/northwind-SQLite3

## Estructura

```text
northwind_analisis_comercial/
├── README.md
├── consultas.sql
└── resultados/
    ├── ventas_por_categoria.csv
    ├── clientes_mayor_facturacion.csv
    ├── productos_mas_vendidos.csv
    └── ranking_empleados.csv
