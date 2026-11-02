-- ============================================================
-- SCRIPT DDL COMPATIBLE CON MICROSOFT SQL SERVER (T-SQL)
-- Proyecto: TechMarket Express (Unidad 3 - Tarea 3.2)
-- ============================================================

-- 0. CREACIÓN Y SELECCIÓN DE LA BASE DE DATOS
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TechMarketExpress')
BEGIN
    CREATE DATABASE TechMarketExpress;
END
GO

USE TechMarketExpress;
GO

-- 1. LIMPIEZA DE TABLAS EXISTENTES (Orden inverso a las dependencias)
IF OBJECT_ID('pago', 'U') IS NOT NULL DROP TABLE pago;
IF OBJECT_ID('envio', 'U') IS NOT NULL DROP TABLE envio;
IF OBJECT_ID('detalle_pedido', 'U') IS NOT NULL DROP TABLE detalle_pedido;
IF OBJECT_ID('pedido', 'U') IS NOT NULL DROP TABLE pedido;
IF OBJECT_ID('producto', 'U') IS NOT NULL DROP TABLE producto;
IF OBJECT_ID('categoria', 'U') IS NOT NULL DROP TABLE categoria;
IF OBJECT_ID('telefono_cliente', 'U') IS NOT NULL DROP TABLE telefono_cliente;
IF OBJECT_ID('cliente_vip', 'U') IS NOT NULL DROP TABLE cliente_vip;
IF OBJECT_ID('cliente', 'U') IS NOT NULL DROP TABLE cliente;
GO

-- 2. TABLA: cliente (Entidad Fuerte Base)
CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    rfc VARCHAR(13) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT chk_rfc_length CHECK (LEN(rfc) >= 12)
);
GO

-- 3. TABLA: cliente_vip (Especialización / Herencia)
CREATE TABLE cliente_vip (
    id_cliente INT PRIMARY KEY,
    nivel_membresia VARCHAR(20) NOT NULL DEFAULT 'Gold',
    descuento_porcentaje DECIMAL(5,2) NOT NULL DEFAULT 10.00,
    CONSTRAINT fk_clientevip_cliente FOREIGN KEY (id_cliente) 
        REFERENCES cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_descuento CHECK (descuento_porcentaje >= 0.00 AND descuento_porcentaje <= 100.00)
);
GO

-- 4. TABLA: telefono_cliente (Multivalorado)
CREATE TABLE telefono_cliente (
    id_telefono INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    numero_telefono VARCHAR(15) NOT NULL,
    tipo_telefono VARCHAR(20) NOT NULL DEFAULT 'Móvil',
    CONSTRAINT fk_telefono_cliente FOREIGN KEY (id_cliente) 
        REFERENCES cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo_tel CHECK (tipo_telefono IN ('Móvil', 'Casa', 'Trabajo'))
);
GO

-- 5. TABLA: categoria
CREATE TABLE categoria (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NULL
);
GO

-- 6. TABLA: producto
CREATE TABLE producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) 
        REFERENCES categoria(id_categoria) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT chk_precio_pos CHECK (precio >= 0),
    CONSTRAINT chk_stock_pos CHECK (stock >= 0)
);
GO

-- 7. TABLA: pedido
CREATE TABLE pedido (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT GETDATE(),
    monto_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado_pedido VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) 
        REFERENCES cliente(id_cliente) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT chk_monto_total CHECK (monto_total >= 0),
    CONSTRAINT chk_estado_pedido CHECK (estado_pedido IN ('Pendiente', 'Pagado', 'Enviado', 'Cancelado'))
);
GO

-- 8. TABLA: detalle_pedido (Relación N:M)
CREATE TABLE detalle_pedido (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_detalle_pedido PRIMARY KEY (id_pedido, id_producto),
    CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) 
        REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) 
        REFERENCES producto(id_producto) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT chk_cantidad_pos CHECK (cantidad > 0),
    CONSTRAINT chk_precio_unitario CHECK (precio_unitario >= 0)
);
GO

-- 9. TABLA: envio
CREATE TABLE envio (
    id_envio INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    direccion_destino VARCHAR(200) NOT NULL,
    empresa_paqueteria VARCHAR(50) NOT NULL,
    numero_guia VARCHAR(50) NOT NULL UNIQUE,
    estado_envio VARCHAR(20) NOT NULL DEFAULT 'En Preparación',
    CONSTRAINT fk_envio_pedido FOREIGN KEY (id_pedido) 
        REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_estado_envio CHECK (estado_envio IN ('En Preparación', 'En Tránsito', 'Entregado', 'Devuelto'))
);
GO

-- 10. TABLA: pago
CREATE TABLE pago (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT GETDATE(),
    metodo_pago VARCHAR(30) NOT NULL,
    estado_pago VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    CONSTRAINT fk_pago_pedido FOREIGN KEY (id_pedido) 
        REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_monto_pago CHECK (monto > 0),
    CONSTRAINT chk_metodo_pago CHECK (metodo_pago IN ('Tarjeta de Crédito', 'Tarjeta de Débito', 'Transferencia', 'Efectivo')),
    CONSTRAINT chk_estado_pago CHECK (estado_pago IN ('Pendiente', 'Completado', 'Rechazado', 'Reembolsado'))
);
GO

-- 11. INSERCIÓN DE DATOS DE PRUEBA
INSERT INTO cliente (rfc, nombre, apellidos, email, fecha_nacimiento) VALUES
('CELC010101XXX', 'Christian', 'Celestino Chavez', 'christian.celestino@ejemplo.com', '2001-01-01');

INSERT INTO cliente_vip (id_cliente, nivel_membresia, descuento_porcentaje) VALUES
(1, 'Platinum', 15.00);

INSERT INTO telefono_cliente (id_cliente, numero_telefono, tipo_telefono) VALUES
(1, '8661234567', 'Móvil');

INSERT INTO categoria (nombre_categoria, descripcion) VALUES
('Electrónica', 'Dispositivos y accesorios electrónicos');

INSERT INTO producto (id_categoria, nombre_producto, precio, stock) VALUES
(1, 'Laptop Gaming 15"', 18500.00, 10);

INSERT INTO pedido (id_cliente, monto_total, estado_pedido) VALUES
(1, 18500.00, 'Pagado');

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 18500.00);

INSERT INTO envio (id_pedido, direccion_destino, empresa_paqueteria, numero_guia) VALUES
(1, 'Av. Tecnológico #123, Monclova, Coahuila', 'DHL Express', 'DHL-9876543210');

INSERT INTO pago (id_pedido, monto, metodo_pago, estado_pago) VALUES
(1, 18500.00, 'Tarjeta de Crédito', 'Completado');
GO

-- ============================================================
-- 12. MOSTRAR LAS TABLAS Y SUS DATOS
-- ============================================================

-- Mostrar los clientes
SELECT * FROM cliente;

-- Mostrar los clientes VIP
SELECT * FROM cliente_vip;

-- Mostrar los teléfonos de los clientes
SELECT * FROM telefono_cliente;

-- Mostrar las categorías
SELECT * FROM categoria;

-- Mostrar los productos
SELECT * FROM producto;

-- Mostrar los pedidos
SELECT * FROM pedido;

-- Mostrar los detalles de los pedidos
SELECT * FROM detalle_pedido;

-- Mostrar los envíos
SELECT * FROM envio;

-- Mostrar los pagos
SELECT * FROM pago;
GO

-- ============================================================
-- 13. MOSTRAR TODAS LAS TABLAS CREADAS EN LA BASE DE DATOS
-- ============================================================

SELECT 
    TABLE_SCHEMA AS Esquema,
    TABLE_NAME AS NombreTabla
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO