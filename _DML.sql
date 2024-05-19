INSERT INTO cliente (nombre_cliente, apellido_1_cliente, apellido_2_cliente, limite_credito) VALUES
    ('Isabel', 'Ramirez', 'Gutierrez', 2000),
    ('Ricardo', 'Mendez', 'Guerrero', 1800),
    ('Cecilia', 'Ortiz', 'Luna', 1700),
    ('Roberto', 'Herrera', 'Aguilar', 1600),
    ('Lorena', 'Castillo', 'Romero', 1900),
    ('Rafael', 'Torres', 'Reyes', 1750),
    ('Rosa', 'Guerrero', 'Santos', 1650),
    ('Miguel', 'Aguilar', 'Peña', 1550),
    ('Patricia', 'Romero', 'Castillo', 1850),
    ('Jorge', 'Peña', 'Ramirez', 1950),
    ('Luisa', 'Reyes', 'Mendez', 2100),
    ('Ernesto', 'Santos', 'Ortiz', 2200),
    ('Ana', 'Luna', 'Guerrero', 2250),
    ('Pedro', 'Castillo', 'Torres', 2050),
    ('Eva', 'Ramirez', 'Aguilar', 2400),
    ('Antonio', 'Gutierrez', 'Ortiz', 2300),
    ('Pilar', 'Aguilar', 'Romero', 2150),
    ('Fernando', 'Romero', 'Herrera', 2600),
    ('Alicia', 'Torres', 'Reyes', 2700);

-- INSERT para la tabla pais
INSERT INTO pais (nombre_pais) VALUES
    ('Portugal'),
    ('Bélgica'),
    ('Grecia'),
    ('Irlanda'),
    ('México'),
    ('Brasil'),
    ('Argentina'),
    ('Chile'),
    ('Colombia'),
    ('Perú'),
    ('Australia'),
    ('Nueva Zelanda'),
    ('Indonesia'),
    ('Malasia'),
    ('Singapur'),
    ('Tailandia'),
    ('Vietnam'),
    ('Filipinas'),
    ('Sudáfrica');

-- INSERT para la tabla region
INSERT INTO region (nombre_region, pais_id) VALUES
    ('Extremadura', 1),
    ('Murcia', 1),
    ('La Rioja', 1),
    ('Aragón', 1),
    ('Asturias', 1),
    ('Cantabria', 1),
    ('Islas Baleares', 1),
    ('Islas Canarias', 1),
    ('Navarra', 1),
    ('Castilla-La Mancha', 1),
    ('Castilla y León', 1),
    ('Comunidad Valenciana', 1),
    ('Galicia', 1),
    ('Madrid', 1),
    ('Cataluña', 1),
    ('Andalucía', 1),
    ('País Vasco', 1),
    ('Ceuta', 1),
    ('Melilla', 1),
    ('Comunidad Foral de Navarra', 1);

-- INSERT para la tabla ciudad
INSERT INTO ciudad (nombre_ciudad, region_id) VALUES
    ('Cáceres', 1),
    ('Cartagena', 1),
    ('Logroño', 2),
    ('Zaragoza', 3),
    ('Alicante', 4),
    ('Gijón', 5),
    ('Santander', 6),
    ('Salamanca', 7),
    ('Albacete', 8),
    ('Huesca', 9),
    ('Ibiza', 10),
    ('Tenerife', 11),
    ('Bilbao', 12),
    ('Murcia', 13),
    ('Badajoz', 14),
    ('Pamplona', 15),
    ('Ceuta', 16),
    ('Melilla', 17);

-- INSERT para la tabla oficina
INSERT INTO oficina (nombre_oficina) VALUES
    ('Centro de Operaciones Globales'),
    ('Sede Corporativa'),
    ('Oficina Central de Marketing'),
    ('Centro de Investigación y Desarrollo'),
    ('Oficina de Dirección'),
    ('Sede Regional Sur'),
    ('Centro de Distribución'),
    ('Oficina de Ingeniería'),
    ('Centro de Atención al Cliente'),
    ('Sede de Operaciones');

-- INSERT para la tabla puesto
INSERT INTO puesto (nombre_puesto) VALUES
    ('CEO'),
    ('Gerente de Marketing'),
    ('Analista de Ventas'),
    ('Especialista en Gestión de Talento'),
    ('Ingeniero de Software Senior'),
    ('Analista Financiero'),
    ('Asistente de Operaciones'),
    ('Técnico de Soporte de IT'),-- INSERT para la tabla puesto (continuación)
    ('Consultor Comercial'),
    ('Operario de Logística');

-- INSERT para la tabla gama
INSERT INTO gama (descripcion_texto, descripcion_html, imagen) VALUES
    ('Electrodomésticos Premium', '<p>Productos electrónicos de alta gama para el hogar.</p>', 'electrodomesticos_premium.jpg'),
    ('Electrónica Avanzada', '<p>Dispositivos electrónicos de última generación.</p>', 'electronica_avanzada.jpg'),
    ('Juguetes Educativos', '<p>Productos para el entretenimiento y educación infantil.</p>', 'juguetes_educativos.jpg'),
    ('Equipamiento Deportivo', '<p>Equipos y accesorios para deportes de alto rendimiento.</p>', 'equipamiento_deportivo.jpg'),
    ('Hogar y Exteriores', '<p>Productos para el hogar y actividades de ocio al aire libre.</p>', 'hogar_exteriores.jpg');

-- INSERT para la tabla proveedor
INSERT INTO proveedor (nombre_proveedor) VALUES
    ('Distribuidores de Electrodomésticos Premium'),
    ('Innovaciones Electrónicas S.A.'),
    ('Juguetes Educativos Ltda.'),
    ('Equipamiento Deportivo Rápido y Fuerte'),
    ('Exteriores Hogar y Jardín Inc.');

-- INSERT para la tabla estado
INSERT INTO estado (estado) VALUES
    ('En espera'),
    ('En curso'),
    ('Despachado'),
    ('Recibido'),
    ('Cancelado');

-- INSERT para la tabla forma_pago
INSERT INTO forma_pago (tipo) VALUES
    ('Depósito bancario'),
    ('Tarjeta de débito'),
    ('Giro postal'),
    ('Stripe'),
    ('Pago en tienda');

-- INSERT para la tabla tipo_telefono
INSERT INTO tipo_telefono (tipo_telefono) VALUES
    ('Línea fija'),
    ('Celular'),
    ('Videollamada');
-- INSERT para la tabla empleado
INSERT INTO empleado (nombre_empleado, apellido_1, apellido_2, oficina_id, codigo_jefe, id_puesto) VALUES
    ('Juan', 'Pérez', 'Gómez', 1, 1, 1),  -- Jefe ficticio
    ('Ana', 'Martínez', 'López', 1, 1, 2),  -- Ana reporta a Juan
    ('Carlos', 'García', 'Fernández', 2, 1, 3);  -- Carlos reporta a Juan

-- INSERT para la tabla direccion_cliente
INSERT INTO direccion_cliente (linea_1, ciudad_id, cliente_id) VALUES
    ('Calle Principal 123', 1, 1),
    ('Avenida Central 456', 2, 2),
    ('Plaza Mayor 789', 3, 3);

-- INSERT para la tabla direccion_oficina
INSERT INTO direccion_oficina (linea_1, ciudad_id, oficina_id) VALUES
    ('Calle Central 789', 1, 1),
    ('Avenida Norte 456', 2, 2),
    ('Paseo de la Victoria 123', 3, 3);

-- INSERT para la tabla contacto
INSERT INTO contacto (nombre_contacto, apellido_contacto, cliente_id) VALUES
    ('Juan', 'Pérez', 1),
    ('Ana', 'Martínez', 2),
    ('Carlos', 'García', 3);

-- INSERT para la tabla transaccion
INSERT INTO transaccion (id_forma_pago_cliente, fecha_pago, total) VALUES
    (1, '2024-05-20', 250.00),
    (2, '2024-05-21', 300.00),
    (3, '2024-05-22', 400.00);

-- INSERT para la tabla forma_pago_cliente
INSERT INTO forma_pago_cliente (id_forma_pago, id_cliente) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- INSERT para la tabla telefono_contacto
INSERT INTO telefono_contacto (numero, tipo_telefono, contacto_id) VALUES
    ('123456789', 1, 1),
    ('987654321', 2, 2),
    ('456789123', 3, 3);

-- INSERT para la tabla detalle_producto
INSERT INTO detalle_producto (id_producto, id_gama, id_dimension, id_proveedor, descripcion, stock, precio_venta, precio_proveedor) VALUES
    (1, 1, 1, NULL, 'Producto 1', 100, 50.00, 40.00),
    (2, 2, 2, NULL, 'Producto 2', 200, 100.00, 80.00),
    (3, 3, 3, NULL, 'Producto 3', 150, 75.00, 60.00);

-- INSERT para la tabla producto
INSERT INTO producto (nombre_producto) VALUES
    ('Producto 1'),
    ('Producto 2'),
    ('Producto 3');

-- INSERT para la tabla pedido
INSERT INTO pedido (fecha_pedido, fecha_esperada, comentarios, id_cliente, estado_id) VALUES
    ('2024-05-20', '2024-05-25', 'Urgente', 1, 1),
    ('2024-05-21', '2024-05-26', 'Entrega regular', 2, 2),
    ('2024-05-22', '2024-05-27', 'Sin comentarios', 3, 3);

-- INSERT para la tabla detalle_pedido
INSERT INTO detalle_pedido (pedido_id, detalle_producto_id, cantidad, precio_unidad, numero_linea, transaccion_id) VALUES
    (1, 1, 2, 50.00, 1, 1),
    (2, 2, 3, 100.00, 2, 2),
    (3, 3, 1, 75.00, 3, 3);

-- INSERT para la tabla telefono_cliente
INSERT INTO telefono_cliente (cliente_id, tipo_telefono_id, numero, fax) VALUES
    (1, 1, '123456789', NULL),
    (2, 2, '987654321', NULL),
    (3, 3, '456789123', '789456123');

-- INSERT para la tabla telefono_empleado
INSERT INTO telefono_empleado (tipo_telefono, empleado_id, numero, extension) VALUES
    (1, 1, '987654321', 101),
    (2, 2, '123456789', 102),
    (3, 3, '456789123', 103);

-- INSERT para la tabla telefono_oficina
INSERT INTO telefono_oficina (tipo_telefono, oficina_id, numero) VALUES
    (1, 1, '123456789'),
    (2, 2, '987654321'),
    (3, 3, '456789123');
