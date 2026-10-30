# 📚 Tarea 1.2: Clasificación y arquitecturas de bases de datos

**Asignatura:** Bases de Datos  
**Unidad:** 1. Introducción a las bases de datos  
**Tema:** Clasificación de las bases de datos, arquitectura ANSI/SPARC y arquitectura funcional del SGBD.

---

## 📄 1. Documento PDF

En el siguiente enlace se encuentra el documento completo de la actividad, que incluye el cuadro sinóptico, los diagramas explicados, un ejemplo práctico, la conclusión y las referencias bibliográficas en formato APA 7.

📥 **[Consultar PDF de la Tarea 1.2](./Tarea_1_2_Corregida_Cuadro_Sinoptico.pdf)**

---

## 🗂️ 2. Cuadro sinóptico: clasificación de las bases de datos

El cuadro sinóptico presenta la clasificación de las bases de datos según tres criterios principales:

- **Por variabilidad de los datos:** estáticas (OLAP) y dinámicas (OLTP).
- **Por ubicación del almacenamiento:** centralizadas y distribuidas.
- **Por contenido o naturaleza:** bibliográficas y de texto completo, directorios y espaciales.

### Vista previa

![Cuadro sinóptico de clasificación de las bases de datos](./Diagrama/Cuadro_Sinoptico_Clasificacion_BD.svg)

---

## 🏛️ 3. Arquitectura de tres niveles ANSI/SPARC

La arquitectura ANSI/SPARC organiza una base de datos en tres niveles de abstracción:

1. **Nivel externo:** representa las vistas de los usuarios y las aplicaciones.
2. **Nivel conceptual:** describe la estructura lógica global, las entidades, las relaciones y las restricciones.
3. **Nivel interno o físico:** explica cómo se almacenan los datos, incluidos los archivos, índices y métodos de acceso.

Esta arquitectura permite separar las vistas de los usuarios de los detalles lógicos y físicos del almacenamiento.

### Diagrama

![Arquitectura ANSI/SPARC de tres niveles](./Diagrama/Arquitectura_ANSI_SPARC.svg)

---

## ⚙️ 4. Arquitectura funcional interna del SGBD

Un Sistema de Gestión de Bases de Datos (SGBD) administra la información y procesa las solicitudes de los usuarios.

Sus componentes principales se organizan en dos subsistemas:

### Procesador de consultas

- Compilador DDL.
- Analizador DML o parser.
- Optimizador de consultas.
- Motor de evaluación.

### Gestor de almacenamiento

- Gestor de memoria intermedia.
- Gestor de archivos y espacio en disco.
- Gestor de transacciones y concurrencia.
- Diccionario de datos o catálogo del sistema.

### Diagrama

![Arquitectura funcional del SGBD](./Diagrama/Arquitectura_Funcional_SGBD.svg)

---

## 🔄 5. Ejemplo práctico del flujo de datos

En un punto de venta, un empleado consulta el precio y la existencia de un producto.

1. El empleado realiza la consulta desde la aplicación.
2. El procesador de consultas analiza la instrucción SQL.
3. El optimizador selecciona un plan de ejecución.
4. El gestor de almacenamiento localiza los registros necesarios.
5. El resultado regresa al procesador de consultas.
6. La aplicación muestra la información al empleado mediante su vista externa.

Este proceso permite comprender cómo interactúan los niveles de abstracción y los componentes internos del SGBD.

---

## 🎥 6. Exposición en video

En este apartado se agregará el enlace público de YouTube con la exposición de la actividad.

**Video:** [Ver exposición en YouTube](PEGA_AQUI_EL_ENLACE_PUBLICO_DEL_VIDEO)

La exposición explica el flujo de datos entre los niveles externo, conceptual e interno de ANSI/SPARC, así como las funciones de los módulos del SGBD.

> **Nota:** la grabación debe mostrar la cámara web en la esquina inferior derecha, de acuerdo con las instrucciones de la actividad.

---

## 📚 7. Referencias bibliográficas

- ANSI/X3/SPARC Study Group on Data Base Management Systems. (1975). *Interim report*. FDT (Bulletin of ACM SIGMOD), 7(2), 1–140.
- Date, C. J. (2019). *Introducción a los sistemas de bases de datos* (8.ª ed.). Pearson Educación.
- Elmasri, R., & Navathe, S. B. (2016). *Fundamentals of database systems* (7th ed.). Pearson.
- Silberschatz, A., Korth, H. F., & Sudarshan, S. (2019). *Database system concepts* (7th ed.). McGraw-Hill Education.

---

## ✅ 8. Conclusión

La clasificación de las bases de datos permite identificar diferentes formas de organizar y gestionar la información. La arquitectura ANSI/SPARC explica la separación entre las vistas externas, la estructura conceptual y el almacenamiento físico. Por su parte, la arquitectura funcional del SGBD muestra cómo se procesan las consultas y cómo se administran los datos.

Ambos enfoques son fundamentales para comprender el funcionamiento de los sistemas de bases de datos.
