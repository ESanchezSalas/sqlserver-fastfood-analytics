# SQL Server – Fast Food Analytics (M2)

**Stack:** SQL Server (script único: DDL + DML + consultas KPI) · SSMS / Azure Data Studio  
**Dataset:** Cadena de fast food (demo educativa)

## 🎯 Objetivo
Ejecutar **un solo script** que:
- crea el esquema y relaciones,
- carga datos de prueba,
- y expone **consultas de negocio (KPIs)**: ingresos por canal, productividad por empleado, tiempos de entrega, demanda por horario y tendencia mensual.

---

## ▶️ Cómo ejecutar
1. Abre **SSMS** o **Azure Data Studio**.  
2. ```sql
   CREATE DATABASE SistemaPedidos;
   GO
   USE SistemaPedidos;

	3.	Ejecuta todo el archivo sql/fastfood.sql.
Si el script ya incluye CREATE DATABASE / USE, puedes correrlo tal cual.

⸻

📊 KPIs (qué responde)
	•	Ingresos por canal (delivery, salón, app, etc.).
	•	Productividad por empleado (ventas asociadas).
	•	Tiempos de entrega (de despacho a entrega).
	•	Demanda por franja horaria y ticket promedio.
	•	Tendencia mensual de ingresos/pedidos.

Las consultas exactas están al final del script sql/DA_Sanchez_Eric.sql.

⸻

🗂️ Estructura del repo

sqlserver-fastfood-analytics/
├─ sql/
│  └─ fasfood.sql        # único script (schema + seed + queries KPI)
├─ docs/
│  └─ fastfood.pdf               # informe/presentación
├─ img/
│  └─ mer.png                    # MER / diagrama entidad–relación (opcional)
└─ README.md


⸻

### 🧩 Modelo MER

<p align="center">
  <img src="img/mersql.jpeg" alt="Modelo entidad–relación (ER) - Fast Food" width="900">
</p>

⸻

📄 Informe

Revisa el documento: docs/fastfood.pdf con el detalle del modelo y hallazgos.

⸻

✅ Checklist rápido
	•	BD creada/seleccionada.
	•	Ejecutado sql/DA_Sanchez_Eric.sql.
	•	Validado que las consultas KPI devuelven resultados.
	•	(Opcional) Subido img/mer.png o docs/mer.pdf.

⸻

Autor: Eric Sanchez — Data Analyst (Admin & Finance) 
