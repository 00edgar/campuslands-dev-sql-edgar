PRAGMA foreign_keys = ON;

-- 2 Operaciones INSERT adicionales
INSERT INTO productos (categoria_id, nombre_producto, precio, stock, estado) VALUES
(2, 'Mouse Logitech MX Master 3S', 850.00, 15, 'Disponible');

INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, monto_total, fecha_venta, metodo_pago) VALUES
(1, 6, 1, 850.00, 850.00, '2026-08-17 10:00', 'Tarjeta');

-- 2 Operaciones UPDATE validas
UPDATE productos 
SET stock = stock - 1 
WHERE producto_id = 6;

UPDATE clientes 
SET telefono = '+502 5555-9999' 
WHERE cliente_id = 1;

-- 2 Operaciones DELETE controladas
DELETE FROM ventas 
WHERE venta_id = 11;

DELETE FROM productos 
WHERE producto_id = 6;

-- 2 Operaciones comentadas que fallan por restricciones:

-- Fallo 1: Violación de restricción UNIQUE (Correo ya registrado)
-- INSERT INTO clientes (nombre_completo, correo, telefono) 
-- VALUES ('Carlos Duplicado', 'carlos.mendoza@email.com', '+502 5555-0000');

-- Fallo 2: Violación de restricción CHECK (Precio menor o igual a cero)
-- INSERT INTO productos (categoria_id, nombre_producto, precio, stock, estado) 
-- VALUES (1, 'Laptop Ficticia', -500.00, 10, 'Disponible');