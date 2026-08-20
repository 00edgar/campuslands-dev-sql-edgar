-- 1. Listar todos los registros principales de la entidad central (ventas)
SELECT 
    venta_id, 
    cliente_id, 
    producto_id, 
    cantidad, 
    precio_unitario, 
    monto_total, 
    fecha_venta, 
    metodo_pago 
FROM ventas;

-- 2. Mostrar solo dos columnas relevantes de esa entidad
SELECT 
    fecha_venta, 
    monto_total 
FROM ventas;

-- 3. Filtrar registros por una condicion numerica o de fecha
SELECT 
    venta_id, 
    monto_total, 
    fecha_venta, 
    metodo_pago 
FROM ventas 
WHERE monto_total >= 2500.00;

-- 4. Ordenar resultados alfabeticamente o por fecha
SELECT 
    producto_id, 
    nombre_producto, 
    precio, 
    stock 
FROM productos 
ORDER BY nombre_producto ASC;

-- 5. Mostrar los 5 registros mas importantes segun una metrica (ventas de mayor monto)
SELECT 
    venta_id, 
    cliente_id, 
    producto_id, 
    monto_total 
FROM ventas 
ORDER BY monto_total DESC 
LIMIT 5;

-- 6. Contar registros totales
SELECT 
    COUNT(*) AS total_ventas_registradas 
FROM ventas;

-- 7. Calcular promedio, minimo o maximo de una columna numerica
SELECT 
    AVG(monto_total) AS ticket_promedio,
    MIN(monto_total) AS venta_minima,
    MAX(monto_total) AS venta_maxima
FROM ventas;

-- 8. Agrupar registros con GROUP BY
SELECT 
    metodo_pago, 
    COUNT(venta_id) AS cantidad_transacciones, 
    SUM(monto_total) AS total_recaudado
FROM ventas
GROUP BY metodo_pago;

-- 9. Relacionar minimo dos tablas con JOIN
SELECT 
    v.venta_id,
    c.nombre_completo AS cliente,
    p.nombre_producto AS producto,
    v.cantidad,
    v.monto_total,
    v.fecha_venta
FROM ventas v
INNER JOIN clientes c ON v.cliente_id = c.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id;

-- 10. Crear una consulta con WHERE, ORDER BY y LIMIT
SELECT 
    v.venta_id,
    v.monto_total,
    v.fecha_venta
FROM ventas v
WHERE v.metodo_pago = 'Tarjeta'
ORDER BY v.monto_total DESC
LIMIT 3;

-- 11. Crear un reporte con alias legibles para las columnas
SELECT 
    v.venta_id AS "Código de Venta",
    c.nombre_completo AS "Nombre del Cliente",
    p.nombre_producto AS "Producto Adquirido",
    v.cantidad AS "Unidades",
    v.precio_unitario AS "Precio Unitario (Q)",
    v.monto_total AS "Monto Total (Q)",
    v.fecha_venta AS "Fecha de Transacción"
FROM ventas v
INNER JOIN clientes c ON v.cliente_id = c.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id;

-- 12. Consulta para toma de decisiones: Rendimiento de ventas por categoría
SELECT 
    cat.nombre_categoria AS categoria,
    COUNT(v.venta_id) AS total_unidades_vendidas,
    COALESCE(SUM(v.monto_total), 0.00) AS ingresos_totales,
    ROUND(AVG(v.monto_total), 2) AS venta_promedio
FROM categorias cat
LEFT JOIN productos p ON cat.categoria_id = p.categoria_id
LEFT JOIN ventas v ON p.producto_id = v.producto_id
GROUP BY cat.categoria_id, cat.nombre_categoria
ORDER BY ingresos_totales DESC;