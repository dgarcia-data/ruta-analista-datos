# Análisis de ventas con Excel

## Descripción

Este proyecto analiza los datos de ventas de una tienda utilizando Microsoft Excel.

El objetivo es desarrollar habilidades de limpieza, validación, análisis y visualización de datos mediante fórmulas, tablas de Excel, tablas dinámicas, segmentadores, gráficos y Power Query.

El proyecto conservará una copia de los datos originales y documentará las decisiones tomadas durante la preparación y el análisis de la información.

## Preguntas de análisis

- ¿Cuál es la facturación total de la tienda?
- ¿Qué categorías generan mayores ventas?
- ¿Qué productos registran mayor volumen de unidades vendidas?
- ¿Qué clientes aportan mayor facturación?
- ¿Cómo evolucionan las ventas por mes?
- ¿Qué regiones presentan mejores resultados?
- ¿Existen registros duplicados, vacíos o inconsistentes?
- ¿Qué productos o categorías requieren mayor seguimiento?

## Herramientas utilizadas

- Microsoft Excel
- Tablas de Excel
- Tablas dinámicas
- Segmentadores
- Gráficos
- Power Query
- GitHub

## Conceptos y funciones aplicadas

- Limpieza y validación de datos
- Tipos de datos
- Referencias relativas y absolutas
- `SUM`
- `AVERAGE`
- `MIN`
- `MAX`
- `COUNT`
- `COUNTA`
- `COUNTBLANK`
- `IF`
- `IFERROR`
- `SUMIFS`
- `COUNTIFS`
- `XLOOKUP`
- Formato condicional
- Tablas dinámicas
- Gráficos dinámicos
- Segmentadores
- Power Query

## Estructura del proyecto

```text
analisis_ventas_tienda/
├── README.md
├── analisis_ventas.xlsx
├── datos/
│   └── datos_ventas.csv
└── capturas/
    └── dashboard_ventas.png
```

La estructura puede cambiar durante el desarrollo según los archivos requeridos.

## Estructura del libro de Excel

El archivo `analisis_ventas.xlsx` estará organizado en las siguientes hojas:

| Hoja | Propósito |
|---|---|
| `datos_originales` | Conservar una copia intacta de los datos recibidos |
| `datos_limpios` | Almacenar los datos después del proceso de limpieza |
| `catalogo_productos` | Contener información auxiliar para búsquedas y cruces |
| `analisis` | Incluir fórmulas, controles, indicadores y tablas dinámicas |
| `dashboard` | Presentar visualmente los principales resultados |

## Flujo de trabajo

```text
Datos originales
      ↓
Limpieza y transformación
      ↓
Validación de totales
      ↓
Análisis mediante fórmulas y tablas dinámicas
      ↓
Construcción del dashboard
      ↓
Documentación de hallazgos y recomendaciones
```
