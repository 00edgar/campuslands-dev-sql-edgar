PRAGMA foreign_keys = ON;

INSERT INTO autores (nombre_completo, nacionalidad, correo) VALUES
('Robert C. Martin', 'Estadounidense', 'unclebob@cleancoder.com'),
('Martin Fowler', 'Británico', 'fowler@martinfowler.com'),
('Andrew Hunt', 'Estadounidense', 'andy@pragprog.com'),
('Erich Gamma', 'Suizo', 'erich.gamma@designpatterns.org'),
('Kyle Simpson', 'Estadounidense', 'getify@gmail.com');

INSERT INTO campers (nombre_completo, correo, telefono, estado) VALUES
('Edgar Polanco', 'edgar.polanco@campus.gt', '+502 5555-0101', 'Activo'),
('Sofía Ramírez', 'sofia.ramirez@campus.gt', '+502 5555-0102', 'Activo'),
('Mateo Castillo', 'mateo.castillo@campus.gt', '+502 5555-0103', 'Activo'),
('Valeria Hernández', 'valeria.hernandez@campus.gt', '+502 5555-0104', 'Activo'),
('Gabriel Morales', 'gabriel.morales@campus.gt', '+502 5555-0105', 'Suspendido');

INSERT INTO libros (autor_id, titulo, isbn, anio_publicacion, ejemplares_disponibles) VALUES
(1, 'Clean Code', '978-0132350884', 2008, 5),
(2, 'Refactoring', '978-0201485677', 1999, 3),
(3, 'The Pragmatic Programmer', '978-0135957059', 2019, 4),
(4, 'Design Patterns', '978-0201633610', 1994, 2),
(5, 'You Dont Know JS Yet', '978-1491904244', 2020, 6);

INSERT INTO prestamos (libro_id, camper_id, fecha_prestamo, fecha_dev_estimada, fecha_dev_real, estado) VALUES
(1, 1, '2026-08-01', '2026-08-15', '2026-08-14', 'Devuelto'),
(2, 2, '2026-08-03', '2026-08-17', '2026-08-16', 'Devuelto'),
(3, 3, '2026-08-05', '2026-08-19', NULL, 'Atrasado'),
(4, 4, '2026-08-08', '2026-08-22', NULL, 'Prestado'),
(5, 1, '2026-08-10', '2026-08-24', '2026-08-20', 'Devuelto'),
(1, 2, '2026-08-11', '2026-08-25', NULL, 'Prestado'),
(2, 3, '2026-08-12', '2026-08-26', NULL, 'Prestado'),
(3, 4, '2026-08-13', '2026-08-27', NULL, 'Prestado'),
(1, 5, '2026-08-02', '2026-08-16', NULL, 'Atrasado'),
(5, 2, '2026-08-15', '2026-08-29', NULL, 'Prestado');