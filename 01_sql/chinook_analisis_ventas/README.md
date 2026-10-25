# Análisis de ventas con SQL

## Descripción

Este proyecto analiza la base de datos Chinook, que representa una tienda digital de música.

El objetivo es practicar SQL mediante preguntas relacionadas con clientes, facturación y géneros musicales, aplicando conceptos básicos e intermedios en SQLite.

## Preguntas de análisis

- ¿cuántos clientes hay en cada país?
- ¿cuánto ha gastado cada cliente?
- ¿qué países generan mayor facturación?
- ¿qué géneros musicales generan más ingresos?

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
    ├── 4_venta_por_clientes.csv
    ├── 5_ventas_por_pais.csv
    └── 6_ventas_por_genero.csv
```

## Hallazgos

- El cliente con mayor facturación fue **Helena Holý**, con un total de **$ 49.62**.
- El país con mayor facturación fue **USA**, con un total de **$ 523.06**.
- El género musical con mayores ingresos fue **Rock**, con un total de **$ 826.65**.

## Conclusiones

El análisis permitió identificar la distribución de las ventas por cliente, país y género musical.
Los resultados se validaron comparando la facturación agrupada con el total general de las líneas de factura.
Los resultados muestran una mayor concentración de ingresos en el género Rock y en las ventas realizadas en USA.
Estos hallazgos podrían utilizarse como punto de partida para analizar la demanda musical y orientar acciones comerciales por mercado y género.

## Limitaciones

- Chinook es una base de datos de ejemplo.
- La facturación no representa necesariamente rentabilidad.
- No se dispone de costes, márgenes ni devoluciones.

## Estado

Proyecto finalizado.
