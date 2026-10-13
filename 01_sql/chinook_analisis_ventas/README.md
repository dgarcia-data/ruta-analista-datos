# Análisis de ventas con SQL

## Descripción

Este proyecto analiza la base de datos Chinook, que representa una tienda digital de música.

El objetivo es practicar SQL mediante preguntas relacionadas con clientes, facturación y géneros musicales, aplicando conceptos básicos e intermedios en SQLite.

## Preguntas de análisis

- ¿Cuántos clientes hay registrados en cada país?
- ¿Qué clientes han generado mayor facturación?
- ¿Qué países generan mayores ingresos?
- ¿Qué géneros musicales generan más ingresos?

## Herramientas utilizadas

- SQLite
- DB Browser for SQLite
- Visual Studio Code
- GitHub

## Conceptos aplicados

- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `GROUP BY`
- `COUNT`
- `SUM`
- `AVG`
- `INNER JOIN`
- `LEFT JOIN`
- Vistas
- Índices
- `EXPLAIN QUERY PLAN`

## Estructura del proyecto

```text
chinook_analisis_ventas/
├── README.md
├── consultas.sql
└── resultados/
    ├── ventas_por_pais.csv
    ├── clientes_mayor_facturacion.csv
    └── ingresos_por_genero.csv
