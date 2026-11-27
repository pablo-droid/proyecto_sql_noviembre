--alumnos que an suspendido
select nombre_alumno, nombre_proyecto, resultado
from Notas
join Proyectos on Proyectos.id_proyecto = Notas.id_proyecto
join Alumnos on Alumnos.id_alumno = Notas.id_alumno
where resultado = 'No Apto';

--alumnos the fullstack
select nombre_alumno, nombre_curso
from Alumnos, Promociones, Verticales
where nombre_curso = 'Full Stack';

--cuantos alumnos en data science
select Verticales.nombre_curso, count(id_alumno)
from Alumnos, Promociones, Verticales
where nombre_curso = 'Data Science'
group by Verticales.nombre_curso;

--que profesores tiene cada alumno
select nombre_alumno, nombre_profesor
from Alumnos, Promociones, Asignaciones_Claustro, Profesores;

--descomenta para probar si quieres
--crear una nueva vertical (esto parece broma pero va a pasar...)
--insert into Verticales (id_vertical, nombre_curso)
--values (3, 'Fontaneria');

--registrar a un nuevo alumno
--insert into Alumnos (id_alumno, nombre_alumno, email, id_promocion)
--values (53, 'Pepe Manzana', 'pepe_manzana@gmail.com', 1);