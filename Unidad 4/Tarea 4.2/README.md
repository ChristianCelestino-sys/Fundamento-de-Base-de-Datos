# 📘 Tarea 4.2: Proceso paso a paso de normalización del proyecto aplicado

## 📌 Descripción

En esta actividad se aplica el proceso de normalización al proyecto TechMarket Express, con el propósito de organizar la información de la base de datos, identificar dependencias funcionales y eliminar redundancias que puedan provocar anomalías de inserción, eliminación o modificación.

Se documenta la transformación de una estructura desnormalizada a la Primera Forma Normal (1FN), Segunda Forma Normal (2FN) y Tercera Forma Normal (3FN), además de validar la Forma Normal de Boyce-Codd (FNBC) cuando corresponda.

## 🎯 Objetivo

Aplicar el proceso de normalización al diseño de la base de datos de TechMarket Express para reducir la redundancia, evitar anomalías y garantizar la integridad de la información mediante la descomposición adecuada de tablas y la generación de un script SQL actualizado.

## 📂 Contenido de la actividad

En esta carpeta se encuentran los documentos, diagramas y scripts correspondientes a la Tarea 4.2.

- **Reporte técnico:** Documento PDF con el análisis y desarrollo del proceso de normalización.
- **Diagramas:** Representaciones de la estructura de la base de datos antes y después de la normalización.
- **Script SQL:** Archivo `normalized_schema.sql` con la definición actualizada del esquema normalizado.
- **Evidencias:** Capturas de pantalla que muestran la ejecución del script y la estructura de las tablas, si se incluyen.

## 📚 Etapas del proceso de normalización

### 1. Estado desnormalizado a Primera Forma Normal (1FN)

Se identifican y eliminan los grupos repetitivos, procurando que cada atributo contenga un único valor y que cada registro pueda identificarse correctamente.

### 2. Primera Forma Normal (1FN) a Segunda Forma Normal (2FN)

Se identifican y eliminan las dependencias funcionales parciales, de manera que cada atributo no primo dependa de la clave primaria completa y no solamente de una parte de ella.

### 3. Segunda Forma Normal (2FN) a Tercera Forma Normal (3FN)

Se analizan las dependencias transitivas y se descomponen las tablas cuando es necesario para que los atributos no primos dependan de la clave, de toda la clave y de nada más que la clave, de acuerdo con las condiciones de la forma normal.

### 4. Validación de la Forma Normal de Boyce-Codd (FNBC)

Se revisan las dependencias funcionales para determinar si cada determinante es una superclave. Si se detectan incumplimientos, se evalúa la descomposición correspondiente.

## 🗂️ Archivos del proyecto

- **[Reporte técnico en PDF](./PDF/Reporte_Tecnico_Tarea_4_2.pdf)**
- **[Diagrama del proceso de normalización](./Diagrama/Normalizacion.drawio)**
- **[Diagrama exportado en SVG](./Diagrama/Normalizacion.svg)**
- **[Script SQL normalizado](./SQL/normalized_schema.sql)**

> Nota: Los enlaces anteriores suponen que los archivos tienen esos nombres y están guardados en las carpetas indicadas. Si tus archivos tienen nombres diferentes, actualiza las rutas para que coincidan exactamente con las que aparecen en GitHub.

## 🛠️ Herramientas utilizadas

- **Draw.io:** Elaboración y edición de diagramas de normalización.
- **GitHub:** Almacenamiento y organización de los archivos del proyecto.
- **PDF:** Presentación del reporte técnico y documentación del proceso.
- **SQL:** Definición del esquema normalizado mediante el script `normalized_schema.sql`.
- **Microsoft SQL Server:** Implementación y validación de la estructura de la base de datos, si se utiliza este SGBD.

## 🎥 Video de exposición

En el video se explica el proceso de normalización aplicado al proyecto TechMarket Express, desde la identificación de redundancias hasta la descomposición de las tablas y la generación del esquema SQL actualizado.

- **[Ver exposición de la Tarea 4.2 en YouTube](PEGA_AQUI_EL_ENLACE_DE_YOUTUBE)**

## 👨‍💻 Autor

Christian Iván Celestino Chávez.

## 📄 Licencia

Este repositorio tiene fines académicos y educativos.
