PRAGMA foreign_keys = ON;

INSERT INTO categorias (nombre_categoria, descripcion) VALUES
('Laptops y Computadores', 'Equipos portátiles, de escritorio y estaciones de trabajo'),
('Periféricos', 'Teclados, mouses, audífonos y accesorios de entrada/salida'),
('Monitores', 'Pantallas de alta resolución, gaming y portátiles'),
('Almacenamiento', 'Discos duros SSD, NVMe y unidades flash externas'),
('Componentes Hardware', 'Tarjetas de video, procesadores y memorias RAM');

INSERT INTO clientes (nombre_completo, correo, telefono, fecha_registro) VALUES
('Carlos Mendoza', 'carlos.mendoza@email.com', '+502 5555-0101', '2026-08-01 09:30'),
('Ana Sofía Gómez', 'ana.gomez@email.com', '+502 5555-0102', '2026-08-02 11:15'),
('Luis Fernando Torres', 'luis.torres@email.com', '+502 5555-0103', '2026-08-03 14:20'),
('María Jimena Morales', 'maria.morales@email.com', '+502 5555-0104', '2026-08-04 16:45'),
('Diego Alejandro Ruiz', 'diego.ruiz@email.com', '+502 5555-0105', '2026-08-05 10:00');

INSERT INTO productos (categoria_id, nombre_producto, precio, stock, estado) VALUES
(1, 'Laptop Asus ROG Strix 16', 12500.00, 8, 'Disponible'),
(2, 'Teclado Mecánico Logitech G Pro', 950.00, 25, 'Disponible'),
(3, 'Monitor LG UltraGear 27" 165Hz', 2800.00, 12, 'Disponible'),
(4, 'SSD Samsung 980 Pro 1TB NVMe', 1100.00, 30, 'Disponible'),
(5, 'Tarjeta de Video RTX 4070 12GB', 6200.00, 5, 'Disponible');

INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, monto_total, fecha_venta, metodo_pago) VALUES
(1, 1, 1, 12500.00, 12500.00, '2026-08-10 10:15', 'Tarjeta'),
(2, 2, 2, 950.00, 1900.00, '2026-08-10 11:30', 'Efectivo'),
(3, 4, 1, 1100.00, 1100.00, '2026-08-11 14:00', 'Transferencia'),
(4, 3, 1, 2800.00, 2800.00, '2026-08-11 15:45', 'Tarjeta'),
(5, 5, 1, 6200.00, 6200.00, '2026-08-12 09:20', 'Transferencia'),
(1, 2, 1, 950.00, 950.00, '2026-08-12 16:10', 'Tarjeta'),
(2, 4, 2, 1100.00, 2200.00, '2026-08-13 11:00', 'Efectivo'),
(3, 3, 2, 2800.00, 5600.00, '2026-08-14 13:25', 'Tarjeta'),
(4, 1, 1, 12500.00, 12500.00, '2026-08-15 17:30', 'Transferencia'),
(5, 2, 3, 950.00, 2850.00, '2026-08-16 12:00', 'Efectivo');