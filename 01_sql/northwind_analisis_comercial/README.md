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
```

## Hallazgos

- El cliente con mayor facturación fue **B's Beverages**, con una venta neta acumulada de **$6.154.115,34**.
- La categoría con mayores ingresos fue **Beverages**, con una venta neta de **$92.163.184,18**.
- El producto con mayor cantidad de unidades vendidas fue **Louisiana Hot Spiced Okra**, con **206.213 unidades**.
- El empleado con mayor facturación gestionada fue **Margaret Peacock**, con una venta neta de **$51.488.395,2** y **1.908 pedidos** gestionados.
- El periodo con mayor facturación fue **2021-12**, con una venta neta de **$4.377.795,4**.

## Conclusiones

El análisis permitió examinar el comportamiento comercial de Northwind desde diferentes niveles de detalle: clientes, categorías, productos, empleados y periodos.

Los resultados muestran que **Beverages** concentra la mayor facturación, mientras que **Louisiana Hot Spiced Okra** registra el mayor volumen de unidades vendidas. Esta diferencia demuestra que el producto con más unidades vendidas no necesariamente hace parte de la misma categoría que genera mayores ingresos.

También se identificó que **B's Beverages** es el cliente con mayor facturación acumulada y que **Margaret Peacock** ocupa la primera posición del ranking de ventas gestionadas.

El análisis temporal permitió reconocer **2021-12** como el periodo con mayor facturación. Este resultado puede utilizarse como punto de partida para investigar posibles patrones estacionales, aunque sería necesario contar con más periodos y contexto comercial antes de afirmar que existe una tendencia.

Para calcular la facturación neta se utilizó el precio histórico registrado en `"Order Details"` y se aplicó el descuento de cada línea mediante la fórmula:

`UnitPrice * Quantity * (1 - Discount)`

## Limitaciones

- Northwind es una base de datos de ejemplo y no representa las operaciones actuales de una empresa real.
- Los umbrales utilizados para segmentar clientes son criterios de práctica y no reglas comerciales reales.
- La facturación no equivale a rentabilidad, porque no se dispone de información completa sobre costes, márgenes, impuestos o devoluciones.
- La columna `Discount` se interpretó como una proporción decimal según el modelo utilizado.
- El análisis temporal cubre únicamente el periodo disponible en la base de datos.
- Los resultados dependen de la calidad y completitud de los datos incluidos en Northwind.
- Debido al tamaño reducido de la base, no se puede afirmar una mejora significativa de rendimiento por la creación del índice sin realizar mediciones adicionales.

## Estado

Proyecto finalizado.
