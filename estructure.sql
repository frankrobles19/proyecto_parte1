CREATE TABLE ciudad
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_ciudad VARCHAR (50) NOT NULL,
    region_id int NOT NULL,
    CONSTRAINT ciudad_pkey PRIMARY KEY (id)
);

CREATE TABLE cliente
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_cliente VARCHAR(50)  NOT NULL,
    apellido_1_cliente VARCHAR(50)  NOT NULL,
    apellido_2_cliente VARCHAR(50)  NOT NULL,
    rep_ventas_id int,
    limite_credito DECIMAL,
    CONSTRAINT cliente_pkey PRIMARY KEY (id)
);

CREATE TABLE contacto
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_contacto VARCHAR(50)  NOT NULL,
    apellido_contacto VARCHAR(30)  NOT NULL,
    emai_contacto VARCHAR(30) ,
    cliente_id int,
    CONSTRAINT contacto_pkey PRIMARY KEY (id)
);

CREATE TABLE detalle_pedido
(
    id INT AUTO_INCREMENT NOT NULL,
    pedido_id int NOT NULL,
    detalle_producto_id int NOT NULL,
    cantidad int NOT NULL,
    precio_unidad DECIMAL NOT NULL,
    numero_linea int NOT NULL,
    transaccion_id int NOT NULL,
    CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id)
);

CREATE TABLE detalle_producto
(
    id INT AUTO_INCREMENT NOT NULL,
    id_producto int NOT NULL,
    id_gama int NOT NULL,
    id_dimension int NOT NULL,
    id_proveedor int,
    descripcion VARCHAR(50) ,
    stock int,
    precio_venta DECIMAL NOT NULL,
    precio_proveedor DECIMAL NOT NULL,
    CONSTRAINT detalle_producto_pkey PRIMARY KEY (id)
);

CREATE TABLE dimension
(
    id INT AUTO_INCREMENT NOT NULL,
    dimension VARCHAR(25) ,
    CONSTRAINT dimension_pkey PRIMARY KEY (id)
);

CREATE TABLE direccion_cliente
(
    id INT AUTO_INCREMENT NOT NULL,
    linea_1 VARCHAR(50)  NOT NULL,
    linea_2 VARCHAR(50) ,
    codigo_postal int,
    ciudad_id int NOT NULL,
    cliente_id int NOT NULL,
    CONSTRAINT direccion_cliente_pkey PRIMARY KEY (id)
);

CREATE TABLE direccion_oficina
(
    id INT AUTO_INCREMENT NOT NULL,
    linea_1 VARCHAR(50)  NOT NULL,
    linea_2 VARCHAR(50) ,
    codigo_postal int,
    ciudad_id int NOT NULL,
    oficina_id int NOT NULL,
    CONSTRAINT direccion_oficina_pkey PRIMARY KEY (id)
);

CREATE TABLE empleado
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_empleado VARCHAR(50)  NOT NULL,
    apellido_1 VARCHAR(50)  NOT NULL,
    apellido_2 VARCHAR(50) ,
    oficina_id int NOT NULL,
    codigo_jefe INT,
    id_puesto int NOT NULL,
    CONSTRAINT empleado_pkey PRIMARY KEY (id)
);

CREATE TABLE estado
(
    id INT AUTO_INCREMENT NOT NULL,
    estado VARCHAR(15)  NOT NULL,
    CONSTRAINT estado_pkey PRIMARY KEY (id)
);

CREATE TABLE forma_pago
(
    id INT AUTO_INCREMENT NOT NULL,
    tipo VARCHAR (50) NOT NULL,
    CONSTRAINT forma_pago_pkey PRIMARY KEY (id)
);

CREATE TABLE forma_pago_cliente
(
    id INT AUTO_INCREMENT NOT NULL,
    id_forma_pago INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id, id_forma_pago, id_cliente)
);

CREATE TABLE gama
(
    id INT AUTO_INCREMENT NOT NULL,
    descripcion_texto text ,
    descripcion_html text ,
    imagen VARCHAR(256) ,
    CONSTRAINT gama_pkey PRIMARY KEY (id)
);

CREATE TABLE oficina
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_oficina VARCHAR(10)  NOT NULL,
    CONSTRAINT oficina_pkey PRIMARY KEY (id)
);

CREATE TABLE pais
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_pais VARCHAR (50) NOT NULL,
    CONSTRAINT pais_pkey PRIMARY KEY (id)
);

CREATE TABLE pedido
(
    id INT AUTO_INCREMENT NOT NULL,
    fecha_pedido date NOT NULL,
    fecha_esperada date NOT NULL,
    fecha_entrega date,
    comentarios VARCHAR (50),
    id_cliente int NOT NULL,
    estado_id int NOT NULL,
    CONSTRAINT pedido_pkey PRIMARY KEY (id)
);

CREATE TABLE producto
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_producto VARCHAR(70) ,
    CONSTRAINT producto_pkey PRIMARY KEY (id)
);

CREATE TABLE proveedor
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_proveedor VARCHAR(50)  NOT NULL,
    CONSTRAINT proveedor_pkey PRIMARY KEY (id)
);

CREATE TABLE puesto
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_puesto VARCHAR (50) NOT NULL,
    CONSTRAINT puesto_pkey PRIMARY KEY (id)
);

CREATE TABLE region
(
    id INT AUTO_INCREMENT NOT NULL,
    nombre_region VARCHAR (50) NOT NULL,
    pais_id int NOT NULL,
    CONSTRAINT region_pkey PRIMARY KEY (id)
);

CREATE TABLE telefono_cliente
(
    cliente_id INT NOT NULL,
    tipo_telefono_id INT NOT NULL,
    numero INT NOT NULL,
    fax VARCHAR(20) NOT NULL, 
    id INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (id, cliente_id, tipo_telefono_id)
);


CREATE TABLE telefono_contacto
(
    numero INT NOT NULL,
    tipo_telefono int NOT NULL,
    contacto_id int NOT NULL,
    id INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT telefono_contacto_pkey PRIMARY KEY (id)
);

CREATE TABLE telefono_empleado
(
    tipo_telefono int NOT NULL,
    empleado_id int NOT NULL,
    numero INT NOT NULL,
    extension int NOT NULL,
    id INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT telefono_empleado_pkey PRIMARY KEY (id)
);

CREATE TABLE telefono_oficina
(
    id INT AUTO_INCREMENT NOT NULL,
    tipo_telefono INT NOT NULL,
    oficina_id INT NOT NULL,
    numero INT NOT NULL,
    PRIMARY KEY (id, tipo_telefono, oficina_id)
);


CREATE TABLE tipo_telefono
(
    id INT AUTO_INCREMENT NOT NULL,
    tipo_telefono VARCHAR(20)  NOT NULL,
    CONSTRAINT tipo_telefono_pkey PRIMARY KEY (id)
);

CREATE TABLE transaccion
(
    id INT AUTO_INCREMENT NOT NULL,
    id_forma_pago_cliente int NOT NULL,
    fecha_pago date,
    total DECIMAL NOT NULL,
    CONSTRAINT transaccion_pkey PRIMARY KEY (id)
);

-----------------------------------------------------------------
ALTER TABLE ciudad
    ADD CONSTRAINT FK_region_id FOREIGN KEY (region_id)
    REFERENCES region (id) 
    
    ;
    


ALTER TABLE cliente
    ADD CONSTRAINT cliente_rep_ventas_id_fkey FOREIGN KEY (rep_ventas_id)
    REFERENCES empleado (id) 
    
    ;
    


ALTER TABLE contacto
    ADD CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id)
    REFERENCES cliente (id) 
    
    ;


ALTER TABLE detalle_pedido
    ADD CONSTRAINT FK_detalle_producto_id FOREIGN KEY (detalle_producto_id)
    REFERENCES detalle_producto (id) 
    
    ;


ALTER TABLE detalle_pedido
    ADD CONSTRAINT FK_transaccion_id FOREIGN KEY (transaccion_id)
    REFERENCES transaccion (id) 
    
    ;
    


ALTER TABLE detalle_pedido
    ADD CONSTRAINT fK_pedido_id FOREIGN KEY (pedido_id)
    REFERENCES pedido (id) 
    
    ;


ALTER TABLE detalle_producto
    ADD CONSTRAINT FK_dimension_id FOREIGN KEY (id_dimension)
    REFERENCES dimension (id) 
    
    ;


ALTER TABLE detalle_producto
    ADD CONSTRAINT FK_gama_id FOREIGN KEY (id_gama)
    REFERENCES gama (id) 
    
    ;


ALTER TABLE detalle_producto
    ADD CONSTRAINT FK_producto_id FOREIGN KEY (id_producto)
    REFERENCES producto (id) 
    
    ;


ALTER TABLE detalle_producto
    ADD CONSTRAINT FK_proveedor_id FOREIGN KEY (id_proveedor)
    REFERENCES proveedor (id) 
    
    ;


ALTER TABLE direccion_cliente
    ADD CONSTRAINT FK_ciudad_id FOREIGN KEY (ciudad_id)
    REFERENCES ciudad (id) 
    
    ;


ALTER TABLE direccion_cliente
    ADD CONSTRAINT FK_cliente_idd FOREIGN KEY (cliente_id)
    REFERENCES cliente (id) 
    
    ;
    


ALTER TABLE direccion_oficina
    ADD CONSTRAINT FK_ciudad_idd FOREIGN KEY (ciudad_id)
    REFERENCES ciudad (id) 
    
    ;


ALTER TABLE direccion_oficina
    ADD CONSTRAINT FK_oficina_id FOREIGN KEY (oficina_id)
    REFERENCES oficina (id) 
    
    ;


ALTER TABLE empleado
    ADD CONSTRAINT FK_jefe_id FOREIGN KEY (codigo_jefe)
    REFERENCES empleado (id) 
    
    ;
    

ALTER TABLE empleado
    ADD CONSTRAINT FK_oficina_id_empleado FOREIGN KEY (oficina_id)
    REFERENCES oficina (id) 
    
    ;


ALTER TABLE empleado
    ADD CONSTRAINT FK_puesto_id FOREIGN KEY (id_puesto)
    REFERENCES puesto (id) 
    
    ;
    

ALTER TABLE forma_pago_cliente
    ADD CONSTRAINT FK_cliente FOREIGN KEY (id_cliente)
    REFERENCES cliente (id) 
    
    ;
    

ALTER TABLE forma_pago_cliente
    ADD CONSTRAINT FK_forma_pago FOREIGN KEY (id_forma_pago)
    REFERENCES forma_pago (id) 
    
    ;
    

ALTER TABLE pedido
    ADD CONSTRAINT FK_cliente_id_pedido FOREIGN KEY (id_cliente)
    REFERENCES cliente (id) 
    
    ;


ALTER TABLE pedido
    ADD CONSTRAINT FK_estado_id FOREIGN KEY (estado_id)
    REFERENCES estado (id) 
    
    ;
    

ALTER TABLE region
    ADD CONSTRAINT FK_pais_id FOREIGN KEY (pais_id)
    REFERENCES pais (id) 
    
    ;
    


ALTER TABLE telefono_cliente
    ADD CONSTRAINT FK_cliente_id_tel FOREIGN KEY (cliente_id)
    REFERENCES cliente (id) 
    
    ;


ALTER TABLE telefono_cliente
    ADD CONSTRAINT FK_tipo_telefono FOREIGN KEY (tipo_telefono_id)
    REFERENCES tipo_telefono (id) 
    
    ;
    

ALTER TABLE telefono_contacto
    ADD CONSTRAINT FK_contacto_id FOREIGN KEY (contacto_id)
    REFERENCES contacto (id) 
    
    ;
    

ALTER TABLE telefono_contacto
    ADD CONSTRAINT FK_tipo_telefono_id FOREIGN KEY (tipo_telefono)
    REFERENCES tipo_telefono (id) 
    
    ;
    


ALTER TABLE telefono_empleado
    ADD CONSTRAINT FK_empleado_id FOREIGN KEY (empleado_id)
    REFERENCES empleado (id) 
    
    ;


ALTER TABLE telefono_empleado
    ADD CONSTRAINT FK_tipo_telefono_empleado FOREIGN KEY (tipo_telefono)
    REFERENCES tipo_telefono (id) 
    
    ;


ALTER TABLE telefono_oficina
    ADD CONSTRAINT FK_oficina_idd FOREIGN KEY (oficina_id)
    REFERENCES oficina (id) 
    
    ;
    

ALTER TABLE transaccion
    ADD CONSTRAINT FK_forma_pago_cliente_id FOREIGN KEY (id_forma_pago_cliente)
    REFERENCES forma_pago_cliente (id) 
    
    ;
