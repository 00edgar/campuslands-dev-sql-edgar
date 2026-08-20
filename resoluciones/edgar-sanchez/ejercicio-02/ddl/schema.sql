PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    categoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_categoria VARCHAR(60) NOT NULL UNIQUE,
    descripcion TEXT
);

CREATE TABLE clientes (
    cliente_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro TEXT NOT NULL DEFAULT (DATETIME('now'))
);

CREATE TABLE productos (
    producto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria_id INTEGER NOT NULL,
    nombre_producto VARCHAR(120) NOT NULL,
    precio NUMERIC(8, 2) NOT NULL CHECK (precio > 0.00),
    stock INTEGER NOT NULL CHECK (stock >= 0),
    estado VARCHAR(20) NOT NULL DEFAULT 'Disponible' CHECK (estado IN ('Disponible', 'Agotado', 'Descontinuado')),
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ventas (
    venta_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(8, 2) NOT NULL CHECK (precio_unitario > 0.00),
    monto_total NUMERIC(10, 2) NOT NULL CHECK (monto_total > 0.00),
    fecha_venta TEXT NOT NULL DEFAULT (DATETIME('now')),
    metodo_pago VARCHAR(30) NOT NULL CHECK (metodo_pago IN ('Efectivo', 'Tarjeta', 'Transferencia')),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id) ON DELETE RESTRICT ON UPDATE CASCADE
);