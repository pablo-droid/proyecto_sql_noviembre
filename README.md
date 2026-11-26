# Proyecto de Creación de Base de Datos Relacional

Base de datos relacional en **PostgreSQL**, alojada en **Render**, creada a partir de los datos sin normalizar de una escuela de bootcamps: alumnos de Data Science y Full Stack, sus notas y el claustro de profesores.

---

## 1. Modelo Entidad-Relación

Diseñamos un modelo con 9 entidades relacionadas mediante relaciones **1:N**: Campus, Verticales, Promociones, Alumnos, Proyectos, Notas, Profesores, Modalidades y Asignaciones_Claustro.

## 2. Modelo lógico

Definimos las tablas con sus claves primarias (en negrita) y foráneas:

| Tabla | Columnas |
|---|---|
| campus | **id_campus**, ciudad |
| verticales | **id_vertical**, nombre_curso |
| promociones | **id_promocion**, nombre_promocion, fecha_inicio, id_campus, id_vertical |
| alumnos | **id_alumno**, nombre_alumno, email, id_promocion |
| proyectos | **id_proyecto**, nombre_proyecto, id_vertical |
| notas | **id_notas**, id_alumno, id_proyecto, resultado |
| profesores | **id_profesor**, nombre_profesor |
| modalidades | **id_modalidad**, tipo_modalidad |
| asignaciones_claustro | **id_asignacion**, id_profesor, id_promocion, id_modalidad, rol |

## 3. Normalización

Con **pandas**:

- Unimos los CSV por vertical, corregimos la errata `Proyecto_FullSatck` y tradujimos las abreviaturas `DS` / `FS` del claustro.
- Creamos tablas propias para campus, verticales, modalidades y profesores.
- Agrupamos promoción, fecha y campus en la tabla promociones.
- Pasamos las notas de una columna por proyecto a una fila por alumno y proyecto.
- Separamos a los profesores de sus asignaciones a cada promoción.
- Dejamos como NULL la promoción de 2 profesores asignados a promociones que no existen en los datos de alumnos.

## 4. Creación de la base de datos

- Creamos la base de datos PostgreSQL en Render y la gestionamos con pgAdmin.
- Creamos las 9 tablas con `proyect_bbdd`.
- Cargamos los datos desde Python con SQLAlchemy.
- Creamos las 9 relaciones (claves foráneas) después de la carga, sin errores.
- Comprobamos los datos cargados: 52 alumnos, 260 notas, 10 proyectos, 10 profesores y 4 promociones.
