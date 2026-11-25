CREATE TABLE Alumnos (
  id_alumno INT PRIMARY KEY,
  nombre_alumno VARCHAR(100),
  email VARCHAR(150),
  id_promocion INT,
  FOREIGN KEY (id_promocion) REFERENCES Promociones(id_promocion)
  )