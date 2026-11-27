--alumnos que han suspendido
select nombre_alumno, nombre_proyecto, resultado
from Notas
join Proyectos on Proyectos.id_proyecto = Notas.id_proyecto
join Alumnos on Alumnos.id_alumno = Notas.id_alumno
where resultado = 'No Apto';

--alumnos de full stack
select nombre_alumno, nombre_curso
from Alumnos
join Promociones on Promociones.id_promocion = Alumnos.id_promocion
join Verticales on Verticales.id_vertical = Promociones.id_vertical
where nombre_curso = 'Full Stack';

--cuantos alumnos hay en data science
select Verticales.nombre_curso, count(Alumnos.id_alumno)
from Alumnos
join Promociones on Promociones.id_promocion = Alumnos.id_promocion
join Verticales on Verticales.id_vertical = Promociones.id_vertical
where nombre_curso = 'Data Science'
group by Verticales.nombre_curso;

--que profesores tiene cada alumno
select nombre_alumno, nombre_profesor
from Alumnos
join Asignaciones_Claustro on Asignaciones_Claustro.id_promocion = Alumnos.id_promocion
join Profesores on Profesores.id_profesor = Asignaciones_Claustro.id_profesor
order by nombre_alumno;

--descomenta para probar si quieres
--crear una nueva vertical
--insert into Verticales (nombre_curso)
--values ('Ciberseguridad');

--registrar a un nuevo alumno
--insert into Alumnos (nombre_alumno, email, id_promocion)
--values ('Pepe Manzana', 'pepe_manzana@gmail.com', 1);

--PRUEBAS DE INTEGRIDAD (deben dar error, descomenta y ejecuta una a una)

--prueba 1: clave primaria (id duplicado)
--error esperado: duplicate key value violates unique constraint "alumnos_pkey"
--insert into Alumnos (id_alumno, nombre_alumno, email, id_promocion)
--values (5, 'Pepe Manzana', 'pepe_manzana@gmail.com', 1);

--prueba 2: clave foranea (promocion que no existe)
--error esperado: violates foreign key constraint
--insert into Alumnos (nombre_alumno, email, id_promocion)
--values ('Pepe Manzana', 'pepe_manzana@gmail.com', 99);