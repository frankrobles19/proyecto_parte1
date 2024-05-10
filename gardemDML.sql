INSERT INTO cliente VALUES ("2", "Isabel", "Ramirez", "Gutierrez", NULL, 2000);
INSERT INTO cliente VALUES ("3", "Ricardo", "Mendez", "Guerrero", NULL, 1800);
INSERT INTO cliente VALUES ("4", "Cecilia", "Ortiz", "Luna", NULL, 1700);
INSERT INTO cliente VALUES ("5", "Roberto", "Herrera", "Aguilar", NULL, 1600);
INSERT INTO cliente VALUES ("6", "Lorena", "Castillo", "Romero", NULL, 1900);
INSERT INTO cliente VALUES ("7", "Rafael", "Torres", "Reyes", NULL, 1750);
INSERT INTO cliente VALUES ("8", "Rosa", "Guerrero", "Santos", NULL, 1650);
INSERT INTO cliente VALUES ("9", "Miguel", "Aguilar", "Peña", NULL, 1550);
INSERT INTO cliente VALUES ("10", "Patricia", "Romero", "Castillo", NULL, 1850);
INSERT INTO cliente VALUES ("11", "Jorge", "Peña", "Ramirez", NULL, 1950);
INSERT INTO cliente VALUES ("12", "Luisa", "Reyes", "Mendez", NULL, 2100);
INSERT INTO cliente VALUES ("13", "Ernesto", "Santos", "Ortiz", NULL, 2200);
INSERT INTO cliente VALUES ("14", "Ana", "Luna", "Guerrero", NULL, 2250);
INSERT INTO cliente VALUES ("15", "Pedro", "Castillo", "Torres", NULL, 2050);
INSERT INTO cliente VALUES ("16", "Eva", "Ramirez", "Aguilar", NULL, 2400);
INSERT INTO cliente VALUES ("17", "Antonio", "Gutierrez", "Ortiz", NULL, 2300);
INSERT INTO cliente VALUES ("18", "Pilar", "Aguilar", "Romero", NULL, 2150);
INSERT INTO cliente VALUES ("19", "Fernando", "Romero", "Herrera", NULL, 2600);
INSERT INTO cliente VALUES ("20", "Alicia", "Torres", "Reyes", NULL, 2700);

INSERT INTO pais VALUES ("2", "Portugal");
INSERT INTO pais VALUES ("3", "Bélgica");
INSERT INTO pais VALUES ("4", "Grecia");
INSERT INTO pais VALUES ("5", "Irlanda");
INSERT INTO pais VALUES ("6", "México");
INSERT INTO pais VALUES ("7", "Brasil");
INSERT INTO pais VALUES ("8", "Argentina");
INSERT INTO pais VALUES ("9", "Chile");
INSERT INTO pais VALUES ("10", "Colombia");
INSERT INTO pais VALUES ("11", "Perú");
INSERT INTO pais VALUES ("12", "Australia");
INSERT INTO pais VALUES ("13", "Nueva Zelanda");
INSERT INTO pais VALUES ("14", "Indonesia");
INSERT INTO pais VALUES ("15", "Malasia");
INSERT INTO pais VALUES ("16", "Singapur");
INSERT INTO pais VALUES ("17", "Tailandia");
INSERT INTO pais VALUES ("18", "Vietnam");
INSERT INTO pais VALUES ("19", "Filipinas");
INSERT INTO pais VALUES ("20", "Sudáfrica");

INSERT INTO region VALUES ("1", "Extremadura", "1");
INSERT INTO region VALUES ("2", "Murcia", "1");
INSERT INTO region VALUES ("3", "La Rioja", "1");
INSERT INTO region VALUES ("4", "Aragón", "1");
INSERT INTO region VALUES ("5", "Asturias", "1");
INSERT INTO region VALUES ("6", "Cantabria", "1");
INSERT INTO region VALUES ("7", "Islas Baleares", "1");
INSERT INTO region VALUES ("8", "Islas Canarias", "1");
INSERT INTO region VALUES ("9", "Navarra", "1");
INSERT INTO region VALUES ("10", "Castilla-La Mancha", "1");
INSERT INTO region VALUES ("11", "Castilla y León", "1");
INSERT INTO region VALUES ("12", "Comunidad Valenciana", "1");
INSERT INTO region VALUES ("13", "Galicia", "1");
INSERT INTO region VALUES ("14", "Madrid", "1");
INSERT INTO region VALUES ("15", "Cataluña", "1");
INSERT INTO region VALUES ("16", "Andalucía", "1");
INSERT INTO region VALUES ("17", "País Vasco", "1");
INSERT INTO region VALUES ("18", "Ceuta", "1");
INSERT INTO region VALUES ("19", "Melilla", "1");
INSERT INTO region VALUES ("20", "Comunidad Foral de Navarra", "1");

INSERT INTO ciudad VALUES ("1", "Cáceres", "1");
INSERT INTO ciudad VALUES ("2", "Cartagena", "1");
INSERT INTO ciudad VALUES ("3", "Logroño", "2");
INSERT INTO ciudad VALUES ("4", "Zaragoza", "3");
INSERT INTO ciudad VALUES ("5", "Alicante", "4");
INSERT INTO ciudad VALUES ("6", "Gijón", "5");
INSERT INTO ciudad VALUES ("7", "Santander", "6");
INSERT INTO ciudad VALUES ("8", "Salamanca", "7");
INSERT INTO ciudad VALUES ("9", "Albacete", "8");
INSERT INTO ciudad VALUES ("10", "Huesca", "9");
INSERT INTO ciudad VALUES ("11", "Ibiza", "10");
INSERT INTO ciudad VALUES ("12", "Tenerife", "11");
INSERT INTO ciudad VALUES ("13", "Gijón", "12");
INSERT INTO ciudad VALUES ("14", "Bilbao", "13");
INSERT INTO ciudad VALUES ("15", "Murcia", "14");
INSERT INTO ciudad VALUES ("16", "Badajoz", "15");
INSERT INTO ciudad VALUES ("17", "Logroño", "16");
INSERT INTO ciudad VALUES ("18", "Pamplona", "17");
INSERT INTO ciudad VALUES ("19", "Ceuta", "18");
INSERT INTO ciudad VALUES ("20", "Melilla", "19");

INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Operaciones Globales');
INSERT INTO oficina(nombre_oficina) VALUES ('Sede Corporativa');
INSERT INTO oficina(nombre_oficina) VALUES ('Oficina Central de Marketing');
INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Investigación y Desarrollo');
INSERT INTO oficina(nombre_oficina) VALUES ('Oficina de Dirección');
INSERT INTO oficina(nombre_oficina) VALUES ('Sede Regional Sur');
INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Distribución');
INSERT INTO oficina(nombre_oficina) VALUES ('Oficina de Ingeniería');
INSERT INTO oficina(nombre_oficina) VALUES ('Centro de Atención al Cliente');
INSERT INTO oficina(nombre_oficina) VALUES ('Sede de Operaciones');

INSERT INTO puesto(nombre_puesto) VALUES ('CEO');
INSERT INTO puesto(nombre_puesto) VALUES ('Gerente de Marketing');
INSERT INTO puesto(nombre_puesto) VALUES ('Analista de Ventas');
INSERT INTO puesto(nombre_puesto) VALUES ('Especialista en Gestión de Talento');
INSERT INTO puesto(nombre_puesto) VALUES ('Ingeniero de Software Senior');
INSERT INTO puesto(nombre_puesto) VALUES ('Analista Financiero');
INSERT INTO puesto(nombre_puesto) VALUES ('Asistente de Operaciones');
INSERT INTO puesto(nombre_puesto) VALUES ('Técnico de Soporte de IT');
INSERT INTO puesto(nombre_puesto) VALUES ('Consultor Comercial');
INSERT INTO puesto(nombre_puesto) VALUES ('Operario de Logística');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Electrodomésticos Premium', '<p>Productos electrónicos de alta gama para el hogar.</p>', 'electrodomesticos_premium.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Electrónica Avanzada', '<p>Dispositivos electrónicos de última generación.</p>', 'electronica_avanzada.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Juguetes Educativos', '<p>Productos para el entretenimiento y educación infantil.</p>', 'juguetes_educativos.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Equipamiento Deportivo', '<p>Equipos y accesorios para deportes de alto rendimiento.</p>', 'equipamiento_deportivo.jpg');

INSERT INTO gama(descripcion_texto, descripcion_html, imagen) 
VALUES ('Hogar y Exteriores', '<p>Productos para el hogar y actividades de ocio al aire libre.</p>', 'hogar_exteriores.jpg');

INSERT INTO proveedor(nombre_proveedor) VALUES ('Distribuidores de Electrodomésticos Premium');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Innovaciones Electrónicas S.A.');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Juguetes Educativos Ltda.');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Equipamiento Deportivo Rápido y Fuerte');
INSERT INTO proveedor(nombre_proveedor) VALUES ('Exteriores Hogar y Jardín Inc.');

INSERT INTO estado(estado) VALUES ('En espera');
INSERT INTO estado(estado) VALUES ('En curso');
INSERT INTO estado(estado) VALUES ('Despachado');
INSERT INTO estado(estado) VALUES ('Recibido');
INSERT INTO estado(estado) VALUES ('Cancelado');

INSERT INTO forma_pago(tipo) VALUES ('Depósito bancario');
INSERT INTO forma_pago(tipo) VALUES ('Tarjeta de débito');
INSERT INTO forma_pago(tipo) VALUES ('Giro postal');
INSERT INTO forma_pago(tipo) VALUES ('Stripe');
INSERT INTO forma_pago(tipo) VALUES ('Pago en tienda');

INSERT INTO tipo_telefono(tipo_telefono) VALUES ('Línea fija');
INSERT INTO tipo_telefono(tipo_telefono) VALUES ('Celular');
INSERT INTO tipo_telefono(tipo_telefono) VALUES ('Videollamada');