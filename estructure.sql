CREATE TABLE ciudad (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_ciudad VARCHAR(255) NOT NULL,
    region_id SMALLINT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_1_cliente VARCHAR(50) NOT NULL,
    apellido_2_cliente VARCHAR(50) NOT NULL,
    rep_ventas_id SMALLINT,
    limite_credito DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE contacto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_contacto VARCHAR(50) NOT NULL,
    apellido_contacto VARCHAR(30) NOT NULL,
    emai_contacto VARCHAR(30),
    cliente_id SMALLINT,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE detalle_pedido (
    id INT NOT NULL AUTO_INCREMENT,
    pedido_id SMALLINT NOT NULL,
    detalle_producto_id SMALLINT NOT NULL,
    cantidad SMALLINT NOT NULL,
    precio_unidad DOUBLE NOT NULL,
    numero_linea SMALLINT NOT NULL,
    transaccion_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (detalle_producto_id) REFERENCES detalle_producto(id),
    FOREIGN KEY (transaccion_id) REFERENCES transaccion(id)
);

CREATE TABLE detalle_producto (
    id INT NOT NULL AUTO_INCREMENT,
    id_producto SMALLINT NOT NULL,
    id_gama SMALLINT NOT NULL,
    id_dimension SMALLINT NOT NULL,
    id_proveedor SMALLINT,
    descripcion VARCHAR(50),
    stock SMALLINT,
    precio_venta DOUBLE NOT NULL,
    precio_proveedor DOUBLE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_producto) REFERENCES producto(id),
    FOREIGN KEY (id_gama) REFERENCES gama(id),
    FOREIGN KEY (id_dimension) REFERENCES dimension(id),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id)
);

CREATE TABLE dimension (
    id INT NOT NULL AUTO_INCREMENT,
    dimension VARCHAR(25),
    PRIMARY KEY (id)
);

CREATE TABLE direccion_cliente (
    id INT NOT NULL AUTO_INCREMENT,
    linea_1 VARCHAR(50) NOT NULL,
    linea_2 VARCHAR(50),
    codigo_postal SMALLINT,
    ciudad_id SMALLINT NOT NULL,
    cliente_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ciudad_id) REFERENCES ciudad(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE direccion_oficina (
    id INT NOT NULL AUTO_INCREMENT,
    linea_1 VARCHAR(50) NOT NULL,
    linea_2 VARCHAR(50) NOT NULL,
    codigo_postal SMALLINT,
    ciudad_id SMALLINT NOT NULL,
    oficina_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ciudad_id) REFERENCES ciudad(id),
    FOREIGN KEY (oficina_id) REFERENCES oficina(id)
);

CREATE TABLE empleado (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_empledo VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(50) NOT NULL,
    apellido_2 VARCHAR(50),
    oficina_id SMALLINT NOT NULL,
    codigo_jefe INT NOT NULL,
    id_puesto SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (oficina_id) REFERENCES oficina(id),
    FOREIGN KEY (codigo_jefe) REFERENCES empleado(id),
    FOREIGN KEY (id_puesto) REFERENCES puesto(id)
);

CREATE TABLE estado (
    id INT NOT NULL AUTO_INCREMENT,
    estado VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE forma_pago (
    id INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE forma_pago_cliente (
    id INT NOT NULL AUTO_INCREMENT,
    id_forma_pago SMALLINT NOT NULL,
    id_cliente SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_forma_pago) REFERENCES forma_pago(id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE gama (
    id INT NOT NULL AUTO_INCREMENT,
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),
    PRIMARY KEY (id)
);

CREATE TABLE oficina (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nombre_oficina VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pais (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_pais VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pedido (
    id INT NOT NULL AUTO_INCREMENT,
    fecha_pedido DATE NOT NULL,
    fecha_esperada DATE NOT NULL,
    fecha_entrega DATE,
    comentarios VARCHAR(255),
    id_cliente SMALLINT NOT NULL,
    estado_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);

CREATE TABLE producto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(70),
    PRIMARY KEY (id)
);

CREATE TABLE proveedor (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_proveedor VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE puesto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_puesto VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE region (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nombre_region VARCHAR(255) NOT NULL,
    pais_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE telefono_cliente (
    cliente_id SMALLINT NOT NULL,
    tipo_telefono_id SMALLINT NOT NULL,
    numero SMALLINT NOT NULL,
    id VARCHAR(255) NOT NULL,
    fax SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (tipo_telefono_id) REFERENCES tipo_telefono(id)
);

CREATE TABLE telefono_contacto (
    id VARCHAR(255) NOT NULL,
    numero SMALLINT NOT NULL,
    tipo_telefono SMALLINT NOT NULL,
    contacto_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tipo_telefono) REFERENCES tipo_telefono(id),
    FOREIGN KEY (contacto_id) REFERENCES contacto(id)
);

CREATE TABLE telefono_empleado (
    id INT NOT NULL AUTO_INCREMENT,
    tipo_telefono SMALLINT NOT NULL,
    empleado_id SMALLINT NOT NULL,
    numero SMALLINT NOT NULL,
    extension SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tipo_telefono) REFERENCES tipo_telefono(id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id)
);

CREATE TABLE telefono_oficina (
    id INT NOT NULL AUTO_INCREMENT,
    tipo_telefono SMALLINT NOT NULL,
    oficina_id SMALLINT NOT NULL,
    numero SMALLINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tipo_telefono) REFERENCES tipo_telefono(id),
    FOREIGN KEY (oficina_id) REFERENCES oficina(id)
);

CREATE TABLE tipo_telefono (
    id INT NOT NULL AUTO_INCREMENT,
    tipo_telefono VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE transaccion (
    id INTEGER NOT NULL,
    id_forma_pago_cliente SMALLINT NOT NULL,
    fecha_pago DATE,
    total DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_forma_pago_cliente) REFERENCES forma_pago_cliente(id)
);
