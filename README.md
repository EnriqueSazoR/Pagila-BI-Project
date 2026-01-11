# Pagila BI Project (PostgreSQL + Power BI)

Proyecto de Business Intelligence construido a partir de la base de datos **Pagila** (PostgreSQL).  
El objetivo es transformar un modelo transaccional (OLTP) en una capa analítica (OLAP) mediante **vistas**, diseñar un **modelo estrella**, y construir dashboards interactivos en **Power BI**.

---

## Objetivo del Proyecto

Este proyecto busca simular un flujo real de BI:

1. Base de datos transaccional (Pagila - PostgreSQL)
2. Capa semántica / analítica con **vistas SQL**
3. Modelo estrella en Power BI (dimensiones + tabla de hechos)
4. Visualización mediante dashboards y documentación ejecutiva (PDF)

> Power BI es utilizado únicamente como herramienta de visualización, mientras que la lógica de integración y modelado analítico se realiza en PostgreSQL.

---

## Alcance del análisis

Se analizan métricas clave como:

- Ventas totales (`amount`)
- Número de rentas (conteo de `payment_id`)
- Clientes únicos
- Películas rentadas por tienda
- Categorías más y menos vistas
- Top películas por ingresos y rentas

---

## Tecnologías utilizadas

- **PostgreSQL** (base de datos y capa analítica)
- **Pagila Sample Database**
- **pgAdmin** (administración y ejecución de scripts)
- **Power BI Desktop** (modelo estrella + dashboards)
- **Git / GitHub** (versionamiento)

---

## Arquitectura BI del proyecto

### 🔹 Fuente de datos (OLTP)
- Pagila Database (relacional, normalizada)
- Tablas base: `payment`, `rental`, `inventory`, `film`, `customer`, `store`, etc.

### 🔹 Capa analítica (OLAP / Semantic Layer)
Se creó una capa de vistas para consumo directo desde Power BI:

**Dimensiones**
- `vw_dim_date`
- `vw_dim_customer`
- `vw_dim_film`
- `vw_dim_store`

**Hechos**
- `vw_fact_sales`  
  *(1 fila = 1 pago / renta)*

---

## ⭐ Modelo Estrella (Power BI)

Relaciones principales:

- `vw_dim_date[date_key]` → `vw_fact_sales[date_key]`
- `vw_dim_customer[customer_id]` → `vw_fact_sales[customer_id]`
- `vw_dim_film[film_id]` → `vw_fact_sales[film_id]`
- `vw_dim_store[store_id]` → `vw_fact_sales[store_id]`

> Todas las dimensiones se conectan al fact. No existen relaciones dimensión-dimensión.

---

## Dashboards construidos

1. **Dashboard 1: Visión General**
   - Ventas, rentas, clientes
   - Ventas en el tiempo
   - Ventas por tienda
   - Top películas por ingresos
<img width="1390" height="770" alt="Vision General" src="https://github.com/user-attachments/assets/47774d0b-8003-43b7-9b74-2a819d3b0047" />

2. **Dashboard 2: Películas**
   - Ranking por ingresos y rentas
   - Categorías más / menos vistas
   - Comparación por rating y duración
<img width="1396" height="779" alt="Películas" src="https://github.com/user-attachments/assets/f9e56195-6142-44b7-bba7-c64669eb7998" />

3. **Dashboard 3: Clientes y Tiendas**
   - Clientes por tienda
   - Clientes activos (estado)
   - Distribución geográfica
<img width="1378" height="780" alt="Clientes" src="https://github.com/user-attachments/assets/de89b32e-f0dc-42da-b707-5a1dca1adbba" />

Cada dashboard cuenta con documentación explicativa en formato PDF.

---

## 📁 Estructura del repositorio

```txt
Proyecto - Pagila/
│
├── scripts/
│   ├── pagila-schema.sql
│   ├── pagila-insert-data.sql
│   ├── Dimensiones(Fecha, Clientes, Peliculas).sql
│   ├── Dimensiones(Tienda, Tabla de hechos).sql
│   
│
├── Documentaciones/
│   ├── Documentacion - Dashboard de clientes.pdf
│   ├── Documentacion - Dashboard de películas.pdf
│   └── Documentacion - Dashboard de visión general.pdf
│
├──
│   └── Dashboard_Películas.pbix
