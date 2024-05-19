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
    PRIMARY KEY (id)
);

CREATE TABLE detalle_pedido (
    id INT NOT NULL AUTO_INCREMENT,
    pedido_id SMALLINT NOT NULL,
    detalle_producto_id SMALLINT NOT NULL,
    cantidad SMALLINT NOT NULL,
    precio_unidad DOUBLE NOT NULL,
    numero_linea SMALLINT NOT NULL,
    transaccion_id SMALLINT NOT NULL,
    PRIMARY KEY (id)
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
    PRIMARY KEY (id)
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
    PRIMARY KEY (id)
);

CREATE TABLE direccion_oficina (
    id INT NOT NULL AUTO_INCREMENT,
    linea_1 VARCHAR(50) NOT NULL,
    linea_2 VARCHAR(50) NOT NULL,
    codigo_postal SMALLINT,
    ciudad_id SMALLINT NOT NULL,
    oficina_id SMALLINT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE empleado (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_empleado VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(50) NOT NULL,
    apellido_2 VARCHAR(50),
    oficina_id SMALLINT NOT NULL,
    codigo_jefe INT NOT NULL,
    id_puesto SMALLINT NOT NULL,
    PRIMARY KEY (id)
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
    PRIMARY KEY (id)
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
    PRIMARY KEY (id)
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
    PRIMARY KEY (id)
);

CREATE TABLE telefono_cliente (
    cliente_id INT NOT NULL,
    tipo_telefono_id INT NOT NULL,
    numero VARCHAR(15) NOT NULL,
    fax VARCHAR(15),
    PRIMARY KEY (cliente_id, tipo_telefono_id)
);

CREATE TABLE telefono_contacto (
    id INT NOT NULL AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    tipo_telefono SMALLINT NOT NULL,
    contacto_id SMALLINT NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE telefono_empleado (
    id INT NOT NULL AUTO_INCREMENT,
    tipo_telefono SMALLINT NOT NULL,
    empleado_id SMALLINT NOT NULL,
    numero VARCHAR(15) NOT NULL,
    extension VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE telefono_oficina (
    id INT NOT NULL AUTO_INCREMENT,
    tipo_telefono SMALLINT NOT NULL,
    oficina_id SMALLINT NOT NULL,
    numero VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tipo_telefono (
    id INT NOT NULL AUTO_INCREMENT,
    tipo_telefono VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE transaccion (
    id INT NOT NULL AUTO_INCREMENT,
    id_forma_pago_cliente SMALLINT NOT NULL,
    fecha_pago DATE,
    total DOUBLE NOT NULL,
    PRIMARY KEY (id)
);
-----------------------------------------------------------------
ALTER TABLE contacto
    ADD CONSTRAINT fk_cliente_contacto FOREIGN KEY (cliente_id) REFERENCES cliente(id);

ALTER TABLE detalle_pedido
    ADD CONSTRAINT fk_pedido_detalle_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    ADD CONSTRAINT fk_detalle_producto_detalle_pedido FOREIGN KEY (detalle_producto_id) REFERENCES detalle_producto(id),
    ADD CONSTRAINT fk_transaccion_detalle_pedido FOREIGN KEY (transaccion_id) REFERENCES transaccion(id);

ALTER TABLE detalle_producto
    ADD CONSTRAINT fk_producto_detalle_producto FOREIGN KEY (id_producto) REFERENCES producto(id),
    ADD CONSTRAINT fk_gama_detalle_producto FOREIGN KEY (id_gama) REFERENCES gama(id),
    ADD CONSTRAINT fk_dimension_detalle_producto FOREIGN KEY (id_dimension) REFERENCES dimension(id),
    ADD CONSTRAINT fk_proveedor_detalle_producto FOREIGN KEY (id_proveedor) REFERENCES proveedor(id);

ALTER TABLE direccion_cliente
    ADD CONSTRAINT fk_ciudad_direccion_cliente FOREIGN KEY (ciudad_id) REFERENCES ciudad(id),
    ADD CONSTRAINT fk_cliente_direccion_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id);

ALTER TABLE direccion_oficina
    ADD CONSTRAINT fk_ciudad_direccion_oficina FOREIGN KEY (ciudad_id) REFERENCES ciudad(id),
    ADD CONSTRAINT fk_oficina_direccion_oficina FOREIGN KEY (oficina_id) REFERENCES oficina(id);

ALTER TABLE empleado
    ADD CONSTRAINT fk_oficina_empleado FOREIGN KEY (oficina_id) REFERENCES oficina(id),
    ADD CONSTRAINT fk_jefe_empleado FOREIGN KEY (codigo_jefe) REFERENCES empleado(id),
    ADD CONSTRAINT fk_puesto_empleado FOREIGN KEY (id_puesto) REFERENCES puesto(id);

ALTER TABLE forma_pago_cliente
    ADD CONSTRAINT fk_forma_pago_forma_pago_cliente FOREIGN KEY (id_forma_pago) REFERENCES forma_pago(id),
    ADD CONSTRAINT fk_cliente_forma_pago_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id);

ALTER TABLE pedido
    ADD CONSTRAINT fk_cliente_pedido FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    ADD CONSTRAINT fk_estado_pedido FOREIGN KEY (estado_id) REFERENCES estado(id);

ALTER TABLE region
    ADD CONSTRAINT fk_pais_region FOREIGN KEY (pais_id) REFERENCES pais(id);

ALTER TABLE telefono_cliente
    ADD CONSTRAINT fk_cliente_telefono_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    ADD CONSTRAINT fk_tipo_telefono_telefono_cliente FOREIGN KEY (tipo_telefono_id) REFERENCES tipo_telefono(id);

ALTER TABLE telefono_contacto
    ADD CONSTRAINT fk_contacto_telefono_contacto FOREIGN KEY (contacto_id) REFERENCES contacto(id),
    ADD CONSTRAINT fk_tipo_telefono_telefono_contacto FOREIGN KEY (tipo_telefono) REFERENCES tipo_telefono(id);

ALTER TABLE telefono_empleado
    ADD CONSTRAINT fk_empleado_telefono_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id),
    ADD CONSTRAINT fk_tipo_telefono_telefono_empleado FOREIGN KEY (tipo_telefono) REFERENCES tipo_telefono(id);

ALTER TABLE telefono_oficina
    ADD CONSTRAINT fk_oficina_telefono_oficina FOREIGN KEY (oficina_id) REFERENCES oficina(id),
    ADD CONSTRAINT fk_tipo_telefono_telefono_oficina FOREIGN KEY (tipo_telefono) REFERENCES tipo_telefono(id);

ALTER TABLE transaccion
    ADD CONSTRAINT fk_forma_pago_cliente_transaccion FOREIGN KEY (id_forma_pago_cliente) REFERENCES forma_pago_cliente(id);

