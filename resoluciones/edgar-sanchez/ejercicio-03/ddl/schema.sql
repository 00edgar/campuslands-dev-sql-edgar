PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS campers;
DROP TABLE IF EXISTS autores;

CREATE TABLE autores (
    autor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE campers (
    camper_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activo' CHECK (estado IN ('Activo', 'Suspendido', 'Inactivo'))
);

CREATE TABLE libros (
    libro_id INTEGER PRIMARY KEY AUTOINCREMENT,
    autor_id INTEGER NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    anio_publicacion INTEGER NOT NULL CHECK (anio_publicacion BETWEEN 1900 AND 2026),
    ejemplares_disponibles INTEGER NOT NULL CHECK (ejemplares_disponibles >= 0),
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE prestamos (
    prestamo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    libro_id INTEGER NOT NULL,
    camper_id INTEGER NOT NULL,
    fecha_prestamo TEXT NOT NULL DEFAULT (DATE('now')),
    fecha_dev_estimada TEXT NOT NULL,
    fecha_dev_real TEXT,
    estado VARCHAR(20) NOT NULL DEFAULT 'Prestado' CHECK (estado IN ('Prestado', 'Devuelto', 'Atrasado')),
    FOREIGN KEY (libro_id) REFERENCES libros(libro_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (camper_id) REFERENCES campers(camper_id) ON DELETE RESTRICT ON UPDATE CASCADE
);