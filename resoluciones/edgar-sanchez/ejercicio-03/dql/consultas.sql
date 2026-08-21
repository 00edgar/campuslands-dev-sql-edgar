-- 1. Listar todos los registros principales de la entidad central (prestamos)
SELECT 
    prestamo_id, 
    libro_id, 
    camper_id, 
    fecha_prestamo, 
    fecha_dev_estimada, 
    fecha_dev_real, 
    estado 
FROM prestamos;

-- 2. Mostrar solo dos columnas relevantes de esa entidad
SELECT 
    fecha_prestamo, 
    estado 
FROM prestamos;

-- 3. Filtrar registros por una condicion numerica o de fecha
SELECT 
    prestamo_id, 
    libro_id, 
    camper_id, 
    fecha_prestamo, 
    estado 
FROM prestamos 
WHERE fecha_prestamo >= '2026-08-10';

-- 4. Ordenar resultados alfabeticamente o por fecha
SELECT 
    libro_id, 
    titulo, 
    isbn, 
    anio_publicacion, 
    ejemplares_disponibles 
FROM libros 
ORDER BY titulo ASC;

-- 5. Mostrar los 5 registros mas importantes segun una metrica (libros con mas ejemplares)
SELECT 
    libro_id, 
    titulo, 
    ejemplares_disponibles 
FROM libros 
ORDER BY ejemplares_disponibles DESC 
LIMIT 5;

-- 6. Contar registros totales
SELECT 
    COUNT(*) AS total_prestamos_registrados 
FROM prestamos;

-- 7. Calcular promedio, minimo o maximo de una columna numerica
SELECT 
    AVG(ejemplares_disponibles) AS promedio_ejemplares,
    MIN(ejemplares_disponibles) AS minimo_ejemplares,
    MAX(ejemplares_disponibles) AS maximo_ejemplares
FROM libros;

-- 8. Agrupar registros con GROUP BY
SELECT 
    estado, 
    COUNT(prestamo_id) AS total_prestamos
FROM prestamos
GROUP BY estado;

-- 9. Relacionar minimo dos tablas con JOIN
SELECT 
    p.prestamo_id,
    l.titulo AS libro,
    c.nombre_completo AS camper,
    p.fecha_prestamo,
    p.estado
FROM prestamos p
INNER JOIN libros l ON p.libro_id = l.libro_id
INNER JOIN campers c ON p.camper_id = c.camper_id;

-- 10. Crear una consulta con WHERE, ORDER BY y LIMIT
SELECT 
    p.prestamo_id,
    p.fecha_prestamo,
    p.estado
FROM prestamos p
WHERE p.estado = 'Devuelto'
ORDER BY p.fecha_prestamo DESC
LIMIT 3;

-- 11. Crear un reporte con alias legibles para las columnas
SELECT 
    p.prestamo_id AS "Código de Préstamo",
    l.titulo AS "Título del Libro",
    c.nombre_completo AS "Nombre del Camper",
    p.fecha_prestamo AS "Fecha de Entrega",
    p.fecha_dev_estimada AS "Fecha Límite",
    p.estado AS "Estado Actual"
FROM prestamos p
INNER JOIN libros l ON p.libro_id = l.libro_id
INNER JOIN campers c ON p.camper_id = c.camper_id;

-- 12. Consulta para toma de decisiones: Demanda de Libros y Tasa de Atrasos
SELECT 
    l.titulo AS libro,
    COUNT(p.prestamo_id) AS total_solicitudes,
    SUM(CASE WHEN p.estado = 'Atrasado' THEN 1 ELSE 0 END) AS total_atrasos,
    l.ejemplares_disponibles AS stock_actual
FROM libros l
LEFT JOIN prestamos p ON l.libro_id = p.libro_id
GROUP BY l.libro_id, l.titulo
ORDER BY total_solicitudes DESC;