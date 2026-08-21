PRAGMA foreign_keys = ON;

-- 2 Operaciones INSERT adicionales
INSERT INTO libros (autor_id, titulo, isbn, anio_publicacion, ejemplares_disponibles) VALUES
(1, 'Clean Architecture', '978-0134494166', 2017, 3);

INSERT INTO prestamos (libro_id, camper_id, fecha_prestamo, fecha_dev_estimada, fecha_dev_real, estado) VALUES
(6, 1, '2026-08-18', '2026-09-01', NULL, 'Prestado');

-- 2 Operaciones UPDATE validas
UPDATE libros 
SET ejemplares_disponibles = ejemplares_disponibles - 1 
WHERE libro_id = 6;

UPDATE campers 
SET telefono = '+502 5555-9090' 
WHERE camper_id = 1;

-- 2 Operaciones DELETE controladas
DELETE FROM prestamos 
WHERE prestamo_id = 11;

DELETE FROM libros 
WHERE libro_id = 6;

-- 2 Operaciones comentadas que fallan por restricciones:

-- Fallo 1: Violación de restricción UNIQUE (ISBN duplicado)
-- INSERT INTO libros (autor_id, titulo, isbn, anio_publicacion, ejemplares_disponibles) 
-- VALUES (1, 'Clean Code Copia', '978-0132350884', 2008, 2);

-- Fallo 2: Violación de restricción CHECK (Año de publicación fuera de rango)
-- INSERT INTO libros (autor_id, titulo, isbn, anio_publicacion, ejemplares_disponibles) 
-- VALUES (2, 'Libro Futurista', '978-0000000000', 2030, 5);