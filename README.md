#                                         <u>proyecto de mysql</u>	 

#### Parte 1

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```mysql
   SELECT o.id_oficina, c.nombre AS ciudad
   FROM oficina o
   INNER JOIN direccion_oficina do ON o.id_oficina = do.id_oficina
   INNER JOIN ciudad c ON do.id_ciudad_oficina = c.id_ciudad;
   
   +------------+----------+
   | id_oficina | ciudad   |
   +------------+----------+
   |          1 | Ciudad 1 |
   |          2 | Ciudad 2 |
   |          3 | Ciudad 3 |
   +------------+----------+
   3 rows in set (0.00 sec)
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```mysql
   mysql> SELECT c.nombre AS ciudad
       -> FROM ciudad c
       -> INNER JOIN region r ON c.id_region = r.id_region
       -> INNER JOIN pais p ON r.id_pais = p.id_pais
       -> WHERE p.nombre = 'España';
   +-----------+
   | ciudad    |
   +-----------+
   | Madrid    |
   | Barcelona |
   | Madrid    |
   | Barcelona |
   +-----------+
   4 rows in set (0.00 sec)
   
   
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
    jefe tiene un código de jefe igual a 7.

  ```
  mysql> SELECT e.nombre, e.apeliido1, e.apellido2, ce.email
      -> FROM empleado e
      -> INNER JOIN contacto_empleado ce ON e.id_empleado = ce.id_empleado;
  +------------+------------+------------+-------------------------------+
  | nombre     | apeliido1  | apellido2  | email                         |
  +------------+------------+------------+-------------------------------+
  | Nombre1    | Apellido11 | Apellido12 | contacto@oficinamadrid.com    |
  | Nombre2    | Apellido21 | Apellido22 | contacto@oficinabarcelona.com |
  | Nombre1    | Apellido11 | Apellido12 | contacto@empleado4.com        |
  | Nombre2    | Apellido21 | Apellido22 | contacto@empleado5.com        |
  | Empleado 4 | Apellido4  | Apellido4  | contacto@empleado6.com        |
  +------------+------------+------------+-------------------------------+
  5 rows in set (0.00 sec)
  ```

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
    empresa.

  ```
  
  ```

  

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
    empleados que no sean representantes de ventas.

  ```mysql
  mysql> SELECT e.nombre,
      ->        e.apeliido1,
      ->        e.apellido2,
      ->        p.nombre_puesto AS puesto
      -> FROM empleado e
      -> INNER JOIN puesto p ON e.puesto_id = p.id
      -> WHERE p.nombre_puesto != 'Representante de Ventas';
  +------------+------------+------------+----------+
  | nombre     | apeliido1  | apellido2  | puesto   |
  +------------+------------+------------+----------+
  | Empleado 1 | Apellido7  | Apellido8  | Puesto 1 |
  | Empleado 2 | Apellido9  | Apellido10 | Puesto 2 |
  | Empleado 3 | Apellido11 | Apellido12 | Puesto 3 |
  | Nombre1    | Apellido11 | Apellido12 | Puesto 1 |
  | Nombre2    | Apellido21 | Apellido22 | Puesto 2 |
  | Empleado 4 | Apellido4  | Apellido4  | Puesto 1 |
  | Empleado 5 | Apellido5  | Apellido5  | Puesto 2 |
  | Empleado 6 | Apellido6  | Apellido6  | Puesto 3 |
  +------------+------------+------------+----------+
  8 rows in set (0.01 sec)
  
  ```

  

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```
   
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un
    pedido.

  ```
  SELECT id, estado FROM estado;
  +----+------------+
  | id | estado     |
  +----+------------+
  |  1 | Pendiente  |
  |  2 | En proceso |
  |  3 | Enviado    |
  |  4 | Entregado  |
  |  5 | Rechazado  |
  +----+------------+
  ```

  

8. Devuelve un listado con el código de cliente de aquellos clientes que
    realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
    aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
    • Utilizando la función YEAR de MySQL.
    • Utilizando la función DATE_FORMAT de MySQL.
    • Sin utilizar ninguna de las funciones anteriores.

  ```
  SELECT c.id, c.nombre_cliente
  FROM transaccion AS trans
  INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
  INNER JOIN cliente AS c ON fpc.id_cliente = c.id
  WHERE YEAR(trans.fecha_pago) = 2008;
  
  • Utilizando la función DATE_FORMAT de MySQL.
  
  SELECT c.id, c.nombre_cliente, DATE_FORMAT(trans.fecha_pago, '%d/%m/%Y') AS fecha_pago_formateada
  FROM transaccion AS trans
  INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
  INNER JOIN cliente AS c ON fpc.id_cliente = c.id
  WHERE YEAR(trans.fecha_pago) = 2008;
  
  • Sin utilizar ninguna de las funciones anteriores.
  
  SELECT c.id, c.nombre_cliente
  FROM transaccion AS trans
  INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
  INNER JOIN cliente AS c ON fpc.id_cliente = c.id
  WHERE trans.fecha_pago >= '2008-01-01' AND trans.fecha_pago < '2009-01-01';
  ```

  

9. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos que no han sido entregados a
    tiempo.

  ```
  mysql> SELECT pe.id, pe.id_cliente, pe.fecha_esperada, pe.fecha_entrega
      -> FROM pedido as pe
      -> WHERE pe.estado_id = 3;
  Empty set (0.06 sec)
  
  ```

  

10. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
    menos dos días antes de la fecha esperada.
    • Utilizando la función ADDDATE de MySQL.
    • Utilizando la función DATEDIFF de MySQL.
    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
    resta -?

    ```
    SELECT
        pe.id AS codigo_pedido,
        pe.id_cliente AS codigo_cliente,
        pe.fecha_esperada,
        pe.fecha_entrega,
        pe.comentarios
    FROM
        pedido AS pe
    INNER JOIN estado AS st ON pe.estado_id = st.id
    WHERE
        pe.estado_id = 4
        AND YEAR(pe.fecha_pedido) = 2009
        AND pe.fecha_entrega <= ADDDATE(pe.fecha_esperada, -2);
        +---------------+----------------+----------------+---------------+-----------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | comentarios     |
    +---------------+----------------+----------------+---------------+-----------------+
    |             4 |              4 | 2009-05-18     | 2009-05-16    | Pedido atrasado |
    
    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
    resta -?
    
    SELECT
        pe.id AS codigo_pedido,
        pe.id_cliente AS codigo_cliente,
        pe.fecha_esperada,
        pe.fecha_entrega,
        pe.comentarios
    FROM
        pedido AS pe
    INNER JOIN estado AS st ON pe.estado_id = st.id
    WHERE
        pe.estado_id = 4
        AND YEAR(pe.fecha_pedido) = 2009
        AND DATEDIFF(pe.fecha_esperada,  pe.fecha_entrega) <= 2;
        
    +---------------+----------------+----------------+---------------+-----------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | comentarios     |
    +---------------+----------------+----------------+---------------+-----------------+
    |             4 |              4 | 2009-05-18     | 2009-05-16    | Pedido atrasado |
    +---------------+----------------+----------------+---------------+-----------------+
    
    
    ```

    

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```
    SELECT id , fecha_pedido, fecha_esperada, fecha_entrega, comentarios, id_cliente, estado_id 
    from pedido 
    WHERE id = 5
      +----+--------------+----------------+---------------+-----------------------+------------+-----------+
      | id | fecha_pedido | fecha_esperada | fecha_entrega | comentarios           | id_cliente | estado_id |
      +----+--------------+----------------+---------------+-----------------------+------------+-----------+
      |  5 | 2009-05-05   | 2009-05-20     | NULL          | Pedido de última hora |          5 |         5 |
      +----+--------------+----------------+---------------+-----------------------+------------+-----------+
        
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el
    mes de enero de cualquier año.

    ```
    
      SELECT
          pe.id AS codigo_pedido,
          pe.id_cliente AS codigo_cliente,
          pe.fecha_esperada,
          pe.fecha_entrega,
          pe.comentarios
      FROM
          pedido AS pe
      INNER JOIN estado AS st ON pe.estado_id = st.id
      WHERE
          pe.estado_id = 4
          AND MONTH(pe.fecha_pedido) = 01;
    ```

    

13. Devuelve un listado con todos los pagos que se realizaron en el
    año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```
    
      SELECT trans.id, trans.id_forma_pago_cliente, trans.fecha_pago, trans.total, fp.tipo
      FROM transaccion AS trans
      INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
      INNER JOIN forma_pago AS fp ON fpc.id_forma_pago = fp.id
      WHERE fp.tipo = 'PayPal' AND YEAR(trans.fecha_pago) = 2008;
      /* SE MODIFICO LA FECHA DE LA CONSULTA YA QUE NO HUBIERON RESULTADOS QUE COINCIDIERAN CON LA PRIMERA */
      SELECT trans.id, trans.id_forma_pago_cliente, trans.fecha_pago, trans.total, fp.tipo
      FROM transaccion AS trans
      INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
      INNER JOIN forma_pago AS fp ON fpc.id_forma_pago = fp.id
      WHERE fp.tipo = 'PayPal' AND YEAR(trans.fecha_pago) = 2009;
      +----+-----------------------+------------+-------+--------+
      | id | id_forma_pago_cliente | fecha_pago | total | tipo   |
      +----+-----------------------+------------+-------+--------+
      |  4 |                     4 | 2009-05-04 |  1200 | PayPal |
      |  9 |                     4 | 2009-05-04 |   300 | PayPal |
      +----+-----------------------+------------+-------+--------+ 
    ```

    

14. Devuelve un listado con todas las formas de pago que aparecen en la
    tabla pago. Tenga en cuenta que no deben aparecer formas de pago
    repetidas.

    ```
    
      SELECT trans.id, trans.id_forma_pago_cliente, trans.fecha_pago, trans.total, fp.tipo
      FROM transaccion AS trans
      INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
      INNER JOIN forma_pago AS fp ON fpc.id_forma_pago = fp.id
      WHERE fp.tipo = 'PayPal' AND YEAR(trans.fecha_pago) = 2008;
     
      SELECT trans.id, trans.id_forma_pago_cliente, trans.fecha_pago, trans.total, fp.tipo
      FROM transaccion AS trans
      INNER JOIN forma_pago_cliente AS fpc ON trans.id_forma_pago_cliente = fpc.id
      INNER JOIN forma_pago AS fp ON fpc.id_forma_pago = fp.id
      WHERE fp.tipo = 'PayPal' AND YEAR(trans.fecha_pago) = 2009;
      +----+-----------------------+------------+-------+--------+
      | id | id_forma_pago_cliente | fecha_pago | total | tipo   |
      +----+-----------------------+------------+-------+--------+
      |  4 |                     4 | 2009-05-04 |  1200 | PayPal |
      |  9 |                     4 | 2009-05-04 |   300 | PayPal |
      +----+-----------------------+------------+-------+--------+ 
    ```

    

15. Devuelve un listado con todos los productos que pertenecen a la
    gama Ornamentales y que tienen más de 100 unidades en stock. El listado
    deberá estar ordenado por su precio de venta, mostrando en primer lugar
    los de mayor precio.

    ```
    
      SELECT DISTINCT id, tipo FROM forma_pago;
      +----+------------------------+
      | id | tipo                   |
      +----+------------------------+
      |  1 | Transferencia bancaria |
      |  2 | Tarjeta de crédito     |
      |  3 | Cheque                 |
      |  4 | PayPal                 |
      |  5 | Efectivo               |
      +----+------------------------+
     
    ```

    

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
    cuyo representante de ventas tenga el código de empleado 11 o 30.
    Consultas multitabla (Composición interna)
    Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
    sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

    ```
    
      SELECT p.id, p.nombre_producto, dp.precio_venta, dp.stock
      FROM producto AS p
      INNER JOIN detalle_producto AS dp ON p.id = dp.id_producto
      INNER JOIN gama AS g ON dp.id_gama = g.id
      WHERE g.descripcion_texto = 'Ornamentales' AND dp.stock > 100
      ORDER BY dp.precio_venta DESC;
      
    ```

    

17. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
      representante de ventas.

    ```
    
      SELECT c.nombre_cliente, e.nombre_empleado, e.apellido_1
      FROM cliente as c
      INNER JOIN empleado as e ON c.id = e.id;
      +----------------+-----------------+------------+
      | nombre_cliente | nombre_empleado | apellido_1 |
      +----------------+-----------------+------------+
      | Daniel         | Eduardo         | Hernández  |
      | María          | María           | García     |
      | Juan           | Juan            | Martínez   |
      | Ana            | Laura           | Sánchez    |
      | Carlos         | Carlos          | Rodríguez  |
      | Laura          | Ana             | López      |
      | Pedro          | Pedro           | Fernández  |
      | Sofía          | Sofía           | Ruiz       |
      | Luis           | Luis            | Martínez   |
      | Paula          | Paula           | Gómez      |
      +----------------+-----------------+------------+
    
    ```

    

18. Muestra el nombre de los clientes que hayan realizado pagos junto con el
      nombre de sus representantes de ventas.

    ```
      
      
      SELECT c.nombre_cliente as cliente, e.nombre_empleado as empleado
      FROM cliente as c
      INNER JOIN pedido as pe ON pe.id_cliente = c.id
      INNER JOIN empleado as e ON e.id = c.rep_ventas_id;
      +---------+----------+
      | cliente | empleado |
      +---------+----------+
      | Daniel  | Sofía    |
      | María   | Sofía    |
      | Juan    | Ana      |
      | Ana     | Ana      |
      | Carlos  | Paula    |
      +---------+----------+
      ```
    ```

    

19. Muestra el nombre de los clientes que no hayan realizado pagos junto con
      el nombre de sus representantes de ventas.

    ```
      SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado
      FROM cliente AS c
      LEFT JOIN pedido AS pe ON pe.id_cliente = c.id
      INNER JOIN empleado AS e ON e.id = c.rep_ventas_id
      WHERE pe.id_cliente IS NULL;
      
        +-----------+----------+
      | cliente   | empleado |
      +-----------+----------+
      | Laura     | Laura    |
      | Pedro     | Paula    |
      | Sofía     | Carlos   |
      | Luis      | Carlos   |
      | Paula     | Paula    |
      | Javier    | Carlos   |
      | Carmen    | Juan     |
      | Diego     | María    |
      | Marta     | Pedro    |
      | Pablo     | María    |
      | Elena     | Ana      |
      | Andrés    | Carlos   |
      | Patricia  | Carlos   |
      | Francisco | Paula    |
      | Alejandra | Juan     |
      +-----------+----------+
    ```

20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
      representantes junto con la ciudad de la oficina a la que pertenece el
      representante.

    ```
      SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado, o.nombre_oficina AS oficina
      FROM cliente AS c
      INNER JOIN pedido AS pe ON c.id = pe.id_cliente
      INNER JOIN empleado AS e ON c.rep_ventas_id = e.id
      INNER JOIN oficina AS o ON e.oficina_id = o.id
      WHERE pe.id_cliente is NOT NULL;
      +---------+----------+-----------------------+
      | cliente | empleado | oficina               |
      +---------+----------+-----------------------+
      | Daniel  | Sofía    | Oficina de Desarrollo |
      | María   | Sofía    | Oficina de Desarrollo |
      | Juan    | Ana      | Sede Regional Norte   |
      | Ana     | Ana      | Sede Regional Norte   |
      | Carlos  | Paula    | Sede Administrativa   |
      +---------+----------+-----------------------+
    ```

21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre

    ```
     SELECT c.nombre_cliente AS cliente, e.nombre_empleado AS empleado, o.nombre_oficina AS oficina, cd.nombre_ciudad as ciudad
      FROM cliente AS c
      INNER JOIN pedido AS pe ON c.id = pe.id_cliente
      INNER JOIN empleado AS e ON c.rep_ventas_id = e.id
      INNER JOIN oficina AS o ON e.oficina_id = o.id
      INNER JOIN direccion_oficina as d_o ON o.id =  d_o.oficina_id
      INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id
      WHERE pe.id_cliente is NULL;
    ```

    

22.   de sus representantes junto con la ciudad de la oficina a la que pertenece el
      representante

    ```
      ```sql
      SELECT d_o.id as código, d_o.linea_1 as 'Linea 1 ', d_o.linea_2 as 'Linea 2', d_o.codigo_postal as ZIP, d_o.oficina_id as 'código oficina'
      FROM direccion_oficina as d_o
      INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id
      INNER JOIN empleado as e ON d_o.oficina_id = e.oficina_id
      INNER JOIN cliente as c ON e.id = c.rep_ventas_id
      WHERE cd.nombre_ciudad = 'Fuenlabrada';
      /* SE MODIFICO EL NOMBRE DE LA CIUDAD  PARA VER RESULTADOS */
      SELECT d_o.id as código, d_o.linea_1 as 'Linea 1 ', d_o.linea_2 as 'Linea 2', d_o.codigo_postal as ZIP, d_o.oficina_id as 'código oficina'
      FROM direccion_oficina as d_o
      INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id
      INNER JOIN empleado as e ON d_o.oficina_id = e.oficina_id
      INNER JOIN cliente as c ON e.id = c.rep_ventas_id
      WHERE cd.nombre_ciudad = 'Madrid';
      +--------+----------------------------+---------+-------+----------------+
      | código | Linea 1                    | Linea 2 | ZIP   | código oficina |
      +--------+----------------------------+---------+-------+----------------+
      |      4 | Paseo de la Castellana 100 | NULL    | 28003 |              4 |
      +--------+----------------------------+---------+-------+----------------+
      ```
    ```

    

23. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

    ```
     
      SELECT c.nombre_cliente as cliente, e.nombre_empleado as Representante, cd.nombre_ciudad as Ciudad
      FROM cliente as c
      INNER JOIN empleado as e ON c.rep_ventas_id = e.id
      INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
      INNER JOIN ciudad as cd ON d_o.ciudad_id = cd.id;
      +-----------+---------------+------------+
      | cliente   | Representante | Ciudad     |
      +-----------+---------------+------------+
      | Daniel    | Sofía         | Valladolid |
      | María     | Sofía         | Valladolid |
      | Juan      | Ana           | Vigo       |
      | Ana       | Ana           | Vigo       |
      | Carlos    | Paula         | Zaragoza   |
      | Laura     | Laura         | Madrid     |
      | Pedro     | Paula         | Zaragoza   |
      | Sofía     | Carlos        | Valencia   |
      | Luis      | Carlos        | Valencia   |
      | Paula     | Paula         | Zaragoza   |
      | Javier    | Carlos        | Valencia   |
      | Carmen    | Juan          | Barcelona  |
      | Diego     | María         | Málaga     |
      | Marta     | Pedro         | Bilbao     |
      | Pablo     | María         | Málaga     |
      | Elena     | Ana           | Vigo       |
      | Andrés    | Carlos        | Valencia   |
      | Patricia  | Carlos        | Valencia   |
      | Francisco | Paula         | Zaragoza   |
      | Alejandra | Juan          | Barcelona  |
      +-----------+---------------+------------+
      ```
    ```

    

24. Devuelve el nombre de los clientes y el nombre de sus representantes junto
      con la ciudad de la oficina a la que pertenece el representante.

    ```
    
      SELECT e.nombre_empleado AS empleado, j.nombre_empleado AS jefe
      FROM empleado AS e
      inner JOIN empleado AS j ON e.codigo_jefe = j.id;
      
      +----------+---------+
      | empleado | jefe    |
      +----------+---------+
      | Juan     | Eduardo |
      | Laura    | Eduardo |
      | Carlos   | María   |
      | Ana      | María   |
      | Pedro    | Eduardo |
      | Sofía    | Eduardo |
      | Luis     | Eduardo |
      | Paula    | María   |
      +----------+---------+
      ```
    ```

    

25. Devuelve un listado con el nombre de los empleados junto con el nombre
      de sus jefes.

    ```
      ```sql
      SELECT e.nombre_empleado AS empleado, j.nombre_empleado AS jefe
      FROM empleado AS e
      LEFT JOIN empleado AS j ON e.codigo_jefe = j.id;
      +----------+---------+
      | empleado | jefe    |
      +----------+---------+
      | Eduardo  | NULL    |
      | María    | NULL    |
      | Juan     | Eduardo |
      | Laura    | Eduardo |
      | Carlos   | María   |
      | Ana      | María   |
      | Pedro    | Eduardo |
      | Sofía    | Eduardo |
      | Luis     | Eduardo |
      | Paula    | María   |
      +----------+---------+
      ```
    ```

    

26. Devuelve un listado que muestre el nombre de cada empleados, el nombre
      de su jefe y el nombre del jefe de sus jefe.

    ```
      
      SELECT c.nombre_cliente as Cliente, c.id
      FROM cliente as c
      INNER JOIN pedido as p ON c.id = p.id_cliente
      INNER JOIN estado as e ON p.estado_id = e.id
      WHERE p.fecha_entrega > p.fecha_esperada;
      
      
    ```

    Consultas multitabla (Composición externa)
    Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
    LEFT JOIN y NATURAL RIGHT JOIN.

    

27. Devuelve un listado que muestre solamente los clientes que no han
      realizado ningún pago.

    ```
    
    SELECT c.nombre_cliente as cliente
    FROM cliente as c
    INNER JOIN forma_pago_cliente as fpc ON c.id = fpc.id_cliente
    WHERE fpc.id_cliene is null;
    ```

    

28. Devuelve un listado que muestre solamente los clientes que no han
      realizado ningún pedido.

    ```
    SELECT  c.nombre_cliente as  cliente
    FROM cliente as c 
    LEFT JOIN pedido ' at line 1
    mysql> SELECT  c.nombre_cliente as  cliente
        -> FROM cliente as c 
        -> LEFT JOIN pedido as pe ON c.id = pe.id_cliente;
    +----------+
    | cliente  |
    +----------+
    | Isabel   |
    | Ricardo  |
    | Cecilia  |
    | Roberto  |
    | Lorena   |
    | Rafael   |
    | Rosa     |
    | Miguel   |
    | Patricia |
    | Jorge    |
    | Luisa    |
    | Ernesto  |
    | Ana      |
    | Pedro    |
    | Eva      |
    | Antonio  |
    | Pilar    |
    | Fernando |
    | Alicia   |
    +----------+
    ```

    

10. Devuelve un listado que muestre los clientes que no han realizado ningún
      pago y los que no han realizado ningún pedido.

    ```
    mysql> SELECT c.nombre_cliente as cliente
        -> FROM cliente as c
        -> LEFT JOIN forma_pago_cliente as fpc ON c.id = fpc.id_cliente
        -> LEFT JOIN pedido as pe ON c.id = pe.id_cliente;
    +----------+
    | cliente  |
    +----------+
    | Isabel   |
    | Ricardo  |
    | Cecilia  |
    | Roberto  |
    | Lorena   |
    | Rafael   |
    | Rosa     |
    | Miguel   |
    | Patricia |
    | Jorge    |
    | Luisa    |
    | Ernesto  |
    | Ana      |
    | Pedro    |
    | Eva      |
    | Antonio  |
    | Pilar    |
    | Fernando |
    | Alicia   |
    +----------+
    19 rows in set (0.00 sec)
    ```

    

10. Devuelve un listado que muestre solamente los empleados que no tienen
      una oficina asociada.

    ```
    mysql> SELECT e.nombre_empleado
        -> FROM empleado as e
        -> LEFT JOIN oficina as O ON e.oficina_id = o.id
        -> WHERE o.id is NULL; 
    Empty set (0.01 sec)
    
    ```

    

11. Devuelve un listado que muestre solamente los empleados que no tienen un
      cliente asociado.

    ​	

    ```
    ```sql
        `> SELECT  e.nombre_empleado
        `> FROM empleado as e
        `> LEFT JOIN cliente as c ON e.id = c.rep_ventas_id  
        `> WHERE c.rep_ventas_id is NULL;
        `> +-----------------+
        `> | nombre_empleado |
        `> +-----------------+
        `> | Eduardo         |
        `> | Luis            |
        `> +-----------------+
        `> ```
    
    ```

    

12. Devuelve un listado que muestre solamente los empleados que no tienen un
      cliente asociado junto con los datos de la oficina donde trabajan.

    ```
    mysql> SELECT  e.nombre_empleado, o.nombre_oficina, d_o.linea_1, d_o.linea_2, d_o.codigo_postal
        -> FROM empleado as e
        -> LEFT JOIN cliente as c ON e.id = c.rep_ventas_id  
        -> INNER JOIN oficina as o ON e.oficina_id = o.id
        -> INNER JOIN direccion_oficina as d_o ON o.id = d_o.oficina_id
        -> WHERE c.rep_ventas_id is NULL;
    Empty set (0.00 sec)
    ```

    

13. Devuelve un listado que muestre los empleados que no tienen una oficina
      asociada y los que no tienen un cliente asociado.

    ```
    mysql> SELECT  e.nombre_empleado
        -> FROM empleado as e
        -> LEFT JOIN oficina as o ON e.oficina_id = o.id
        -> LEFT JOIN cliente as c ON e.id = c.rep_ventas_id
        -> WHERE o.id is null and c.rep_ventas_id is null;
    Empty set (0.00 sec)
    ```

    

14. Devuelve un listado de los productos que nunca han aparecido en un
      pedido.

    ```
    mysql> SELECT p.nombre_producto
        -> FROM producto as p
        -> INNER JOIN detalle_producto as det ON p.id = det.id_producto
        -> LEFT JOIN detalle_pedido as detp ON det.id = detp.detalle_producto_id
        -> WHERE detp.detalle_producto_id is null;
    Empty set (0.00 sec)
    
    ```

    

15. Devuelve un listado de los productos que nunca han aparecido en un
      pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
      producto.

    ````
    ```sql
    SELECT p.nombre_producto, det.descripcion, g.imagen as imagen
    FROM producto as p
    INNER JOIN detalle_producto as det ON p.id = det.id_producto
    INNER JOIN gama as g ON det.id_gama = g.id
    LEFT JOIN detalle_pedido as detp ON det.id = detp.detalle_producto_id
    WHERE detp.detalle_producto_id is null;
    ```
    ````

    

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
    hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ````
    ```sql
    SELECT o.nombre_oficina
    FROM oficina as o
    INNER JOIN empleado as e ON o.id = e.oficina_id
    INNER JOIN cliente as c ON  e.id = c.rep_ventas_id
    INNER JOIN pedido as pe ON c.id = pe.id_cliente
    INNER JOIN detalle_pedido as dp ON pe.id = dp.pedido_id
    INNER JOIN detalle_producto as de_p ON dp.detalle_producto_id = de_p.id
    INNER JOIN gama as g on de_p.id_gama = g.id
    WHERE g.descripcion_texto = 'Frutales' and c.rep_ventas_id IS NULL;
    ```
    ````

    

17. Devuelve un listado con los clientes que han realizado algún pedido pero no
    han realizado ningún pago.

    ~~~mysql
    ```sql
    SELECT c.nombre_cliente
    FROM cliente c
    INNER JOIN pedido pe ON c.id = pe.id_cliente
    INNER JOIN forma_pago_cliente fpc ON c.id = fpc.id_cliente
    LEFT JOIN transaccion tr ON fpc.id = tr.id_forma_pago_cliente
    WHERE tr.id_forma_pago_cliente IS NULL and pe.id_cliente is not null;
    
    ```
    ~~~

    

18. Devuelve un listado con los datos de los empleados que no tienen clientes
    asociados y el nombre de su jefe asociado.

    ```
    mysql> SELECT e.id, e.nombre_empleado, e.apellido_1, e.apellido_2, e.oficina_id, e.codigo_jefe, e.id_puesto
        -> FROM empleado as e
        -> LEFT JOIN cliente as c ON e.id = c.rep_ventas_id
        -> WHERE c.rep_ventas_id is null;
    Empty set (0.00 sec)
    ```

    Consultas resumen

19. ¿Cuántos empleados hay en la compañía?

    ```
    mysql> SELECT COUNT(id) as 'Cantidad de empleados'
        -> FROM empleado;
    +-----------------------+
    | Cantidad de empleados |
    +-----------------------+
    |                     0 |
    +-----------------------+
    1 row in set (0.01 sec)
    
    
    ```

    

20. ¿Cuántos clientes tiene cada país?

    ```
    SELECT ci.nombre_ciudad, COUNT(c.id) as 'Cantidad de clientes'
    FROM cliente as c
    INNER JOIN direccion_cliente as d_c on c.id = d_c.cliente_id
    INNER JOIN ciudad as ci ON d_c.ciudad_id = ci.id
    GROUP BY ci.nombre_ciudad;
    +----------------------------+----------------------+
    | nombre_ciudad              | Cantidad de clientes |
    +----------------------------+----------------------+
    | Sevilla                    |                    2 |
    | Málaga                     |                    1 |
    | Mérida                     |                    2 |
    | Melilla                    |                    1 |
    | Barcelona                  |                    1 |
    | Madrid                     |                    1 |
    | Valencia                   |                    1 |
    | Vigo                       |                    1 |
    | Bilbao                     |                    1 |
    | Valladolid                 |                    1 |
    | Toledo                     |                    1 |
    | Zaragoza                   |                    1 |
    | Palma de Mallorca          |                    1 |
    | Las Palmas de Gran Canaria |                    1 |
    | Oviedo                     |                    1 |
    | Santander                  |                    1 |
    +----------------------------+----------------------+
    ```

    

21. ¿Cuál fue el pago medio en 2009?

    ```
    mysql> SELECT ci.nombre_ciudad, COUNT(c.id) as 'Cantidad de clientes'
        -> FROM cliente as c
        -> INNER JOIN direccion_cliente as d_c on c.id = d_c.cliente_id
        -> INNER JOIN ciudad as ci ON d_c.ciudad_id = ci.id
        -> GROUP BY ci.nombre_ciudad;
    Empty set (0.00 sec)
    
    mysql>     SELECT AVG(dp.cantidad * dp.precio_unidad) as Cantidad
        ->     FROM detalle_pedido as dp
        ->     INNER JOIN pedido as pe ON dp.pedido_id = pe.id
        ->     WHERE YEAR(fecha_pedido) = '2009';
    +----------+
    | Cantidad |
    +----------+
    |     NULL |
    +----------+
    1 row in set (0.01 sec)
    ```

    

22. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
      descendente por el número de pedidos.

    ````
    ```sql
    SELECT COUNT(p.estado_id) as CANTIDAD
    FROM pedido as p
    GROUP BY p.estado_id;
    +----------+
    | CANTIDAD |
    +----------+
    |        1 |
    |        1 |
    |        1 |
    |        1 |
    |        1 |
    +----------+
    ```
    ````

    

23. Calcula el precio de venta del producto más caro y más barato en una
      misma consulta.

    ```
    SELECT p.nombre_producto, dp.precio_venta
    FROM producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    WHERE dp.precio_venta = (SELECT MIN(precio_venta) FROM detalle_producto)
    UNION ALL
    SELECT p.nombre_producto, dp.precio_venta
    FROM producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    WHERE dp.precio_venta = (SELECT MAX(precio_venta) FROM detalle_producto);
    +-----------------+--------------+
    | nombre_producto | precio_venta |
    +-----------------+--------------+
    | talefono        |           15 |
    | camisas         |           50 |
    +-----------------+--------------+
    ```

    

24. Calcula el número de clientes que tiene la empresa.

    ```
    SELECT COUNT(id) as Cantidad_clientes
    FROM cliente;
    +-------------------+
    | Cantidad_clientes |
    +-------------------+
    |                19 |
    +-------------------+
    ```

    

25. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

    ```
        SELECT COUNT(c.id) as CANTIDAD
        FROM cliente AS  c
        INNER JOIN direccion_cliente as d_o ON c.id = d_o.cliente_id
        INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
        WHERE ci.nombre_ciudad = 'Madrid';
        +----------+
    | CANTIDAD |
    +----------+
    |        8 |
    +----------+
    ```

    

26. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
      por M?

    ```
       SELECT COUNT(c.id) AS CANTIDAD
    FROM cliente as c
    INNER JOIN direccion_cliente as d_o ON c.id = d_o.cliente_id
    INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
    WHERE ci.nombre_ciudad like 'M%';
    +----------+
    | CANTIDAD |
    +----------+
    |        7 |
    +----------+
    ```

    

27. Devuelve el nombre de los representantes de ventas y el número de clientes
      al que atiende cada uno.

    ```
    mysql> select e.nombre_empleado, COUNT(c.id) as clientes 
        -> FROM empleado as e 
        -> INNER JOIN cliente as c ON e.id = c.rep_ventas_id 
        -> GROUP BY e.nombre_empleado;
    Empty set (0.00 sec)
    ```

    

28. Calcula el número de clientes que no tiene asignado representante de
    ventas.

    ```
    select e.nombre_empleado, COUNT(c.id) as clientes
    FROM empleado as e 
    INNER JOIN cliente as c ON e.id = c.rep_ventas_id
    WHERE c.rep_ventas_id IS NULL
    GROUP BY e.nombre_empleado;
    ```

    

29. Calcula la fecha del primer y último pago realizado por cada uno de los
    clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```
    SELECT c.nombre_cliente, c.apellido_1, c.apellido_2
    FROM cliente AS c
    INNER JOIN forma_pago_cliente AS fpc ON c.id = fpc.cliente_id
    INNER JOIN transaccion AS tr ON c.id = tr.id_forma_pago_cliente;
    
    ```

    

30. Calcula el número de productos diferentes que hay en cada uno de los
    pedidos.

    ```
    SELECT dpe.id, COUNT(p.id) as cantidad
    FROM detalle_pedido as dpe
    INNER JOIN detalle_producto as dp ON dpe.detalle_producto_id = dp.id
    INNER JOIN producto as p ON dp.id_producto = p.id
    GROUP BY dpe.id
    ORDER BY dpe.id ASC;
    +----+----------+
    | id | cantidad |
    +----+----------+
    |  1 |        1 |
    |  2 |        1 |
    |  3 |        1 |
    |  4 |        1 |
    |  5 |        1 |
    |  6 |        1 |
    |  7 |        1 |
    |  8 |        1 |
    |  9 |        1 |
    | 10 |        1 |
    +----+----------+
    ```

    

31. Calcula la suma de la cantidad total de todos los productos que aparecen en
    cada uno de los pedidos.

    ```
    SELECT dpe.pedido_id, SUM(dpe.cantidad) AS cantidad_total
    FROM detalle_pedido AS dpe
    GROUP BY dpe.pedido_id;
    
    +-----------+----------------+
    | pedido_id | cantidad_total |
    +-----------+----------------+
    |         1 |              3 |
    |         2 |              4 |
    |         3 |              3 |
    |         4 |              6 |
    |         5 |              4 |
    +-----------+----------------+
    ```

    

32. Devuelve un listado de los 20 productos más vendidos y el número total de
    unidades que se han vendido de cada uno. El listado deberá estar ordenado
    por el número total de unidades vendidas.

    ```
    SELECT p.nombre_producto, SUM(dpe.cantidad) AS total_unidades_vendidas
    FROM producto AS p
    INNER JOIN detalle_producto AS dp ON p.id = dp.id_producto
    INNER JOIN detalle_pedido AS dpe ON dp.id = dpe.detalle_producto_id
    GROUP BY p.nombre_producto
    ORDER BY total_unidades_vendidas DESC
    LIMIT 20;
    +-----------------+-------------------------+
    | nombre_producto | total_unidades_vendidas |
    +-----------------+-------------------------+
    | maletin         |                       5 |
    | Zapatos         |                       5 |
    | Bolso           |                       5 |
    | Camisa          |                       3 |
    | chaqueta        |                       2 |
    +-----------------+-------------------------+
    ```

    

33. La facturación que ha tenido la empresa en toda la historia, indicando la
    base imponible, el IVA y el total facturado. La base imponible se calcula
    sumando el coste del producto por el número de unidades vendidas de la
    tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
    suma de los dos campos anteriores.

    ```
    SELECT 
        SUM(dpe.precio_unidad * dpe.cantidad) AS base_imponible,
        SUM(dpe.precio_unidad * dpe.cantidad) * 0.21 AS iva,
        SUM(dpe.precio_unidad * dpe.cantidad) + (SUM(dpe.precio_unidad * dpe.cantidad) * 0.21) AS total_facturado
    FROM detalle_pedido AS dpe
    INNER JOIN detalle_producto AS dp ON dpe.detalle_producto_id = dp.id;
    
    +----------------+------+-----------------+
    | base_imponible | iva  | total_facturado |
    +----------------+------+-----------------+
    |           NULL | NULL |            NULL |
    +----------------+------+-----------------+
    1 row in set (0.01 sec)
    ```

    

34. La misma información que en la pregunta anterior, pero agrupada por
    código de producto.

    ```
    
    mysql> SELECT 
        ->     SUM(dpe.precio_unidad * dpe.cantidad) AS base_imponible,
        ->     SUM(dpe.precio_unidad * dpe.cantidad) * 0.21 AS iva,
        ->     SUM(dpe.precio_unidad * dpe.cantidad) + (SUM(dpe.precio_unidad * dpe.cantidad) * 0.21) AS total_facturado
        -> FROM detalle_pedido AS dpe
        -> INNER JOIN detalle_producto AS dp ON dpe.detalle_producto_id = dp.id
        -> GROUP BY dp.id_producto;
    Empty set (0.01 sec)
    
    ```

    

35. La misma información que en la pregunta anterior, pero agrupada por
    código de producto filtrada por los códigos que empiecen por OR.

    ```
    
    ```

    

36. Lista las ventas totales de los productos que hayan facturado más de 3000
    euros. Se mostrará el nombre, unidades vendidas, total facturado y total
    facturado con impuestos (21% IVA).

    ```
    
    ```

    

37. Muestre la suma total de todos los pagos que se realizaron para cada uno
    de los años que aparecen en la tabla pagos.

    ```
    SELECT 
        YEAR(fecha_pago) AS año,
        SUM(total) AS total_pagos
    FROM transaccion
    GROUP BY YEAR(fecha_pago);
    
    +------+-------------+
    | año | total_pagos |
    +------+-------------+
    | 2005 |       9900 |
    +------+-------------+
    ```

    Subconsultas
    Con operadores básicos de comparación

    

38. Devuelve el nombre del cliente con mayor límite de crédito.

    ```
    SELECT nombre_cliente, limite_credito
    FROM cliente
    WHERE limite_credito =  (Select MAX(limite_credito) from cliente);
    +----------------+----------------+
    | nombre_cliente | limite_credito |
    +----------------+----------------+
    | Alicia         |           2700 |
    +----------------+----------------+
    1 row in set (0.03 sec)
    ```

    

39. Devuelve el nombre del producto que tenga el precio de venta más caro.

    ```
    SELECT p.nombre_producto
    FROM producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    WHERE precio_venta = (SELECT MAX(precio_venta) from detalle_producto);
    +-----------------+
    | nombre_producto |
    +-----------------+
    | camisa          |
    +-----------------+
    ```

    

40. Devuelve el nombre del producto del que se han vendido más unidades.
      (Tenga en cuenta que tendrá que calcular cuál es el número total de
      unidades que se han vendido de cada producto a partir de los datos de la
      tabla detalle_pedido)

    ```
    SELECT p.nombre_producto, COUNT(dpe.cantidad) as cantidad
    from producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    INNER JOIN detalle_pedido as dpe ON dp.id = dpe.detalle_producto_id
    GROUP BY p.nombre_producto;
    +-----------------+----------+
    | nombre_producto | cantidad |
    +-----------------+----------+
    | Camisa          |        2 |
    +-----------------+----------+
    ```

    

41. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
      realizado. (Sin utilizar INNER JOIN).

    ```
    SELECT c.nombre_cliente
    FROM cliente AS c
    WHERE c.limite_credito > (
        SELECT SUM(cantidad * precio_unidad) AS precio_pagado
        FROM detalle_pedido);
     +-----------+-
      | cliente   |
      +-----------+
      | Laura     |
      | Pedro     | 
      | Sofía     | 
      | Luis      | 
      | Paula     | 
      | Javier    |
      | Carmen    | 
      | Diego     | 
      | Marta     | 
      | Pablo     |
      | Elena     | 
      | Andrés    | 
      | Patricia  | 
      | Francisco | 
      | Alejandra |
      +-----------+
    ```

    

42. Devuelve el producto que más unidades tiene en stock.

    ```
    SELECT p.nombre_producto 
    From producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    WHERE stock = (select max(stock) from detalle_producto);
    +-----------------+
    | nombre_producto |
    +-----------------+
    | Corbata         |
    +-----------------+
    ```

    

43. Devuelve el producto que menos unidades tiene en stock.

    ```
    SELECT p.nombre_producto 
    From producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    WHERE stock = (select min(stock) from detalle_producto);
    +-----------------+
    | nombre_producto |
    +-----------------+
    | Pantalón        |
    +-----------------+
    ```

    

44. Devuelve el nombre, los apellidos y el email de los empleados que están a
      cargo de Alberto Soria.
      Subconsultas con ALL y ANY

    ```
    SELECT e.nombre_empleado, e.apellido_1, e.apellido_2
    from empleado as e
    WHERE codigo_jefe = (SELECT id from empleado WHERE nombre_empleado = 'Alberto' and apellido_1 = ' Soria');	
    
    
    SELECT e.nombre_empleado, e.apellido_1, e.apellido_2
    from empleado as e
    WHERE codigo_jefe = (SELECT id from empleado WHERE nombre_empleado = 'Eduardo' and apellido_1 = 'Hernández');	
    +-----------------+------------+------------+
    | nombre_empleado | apellido_1 | apellido_2 |
    +-----------------+------------+------------+
    | Juan            | Martínez   | Pérez      |
    | Laura           | Sánchez    | Gómez      |
    | Pedro           | Fernández  | Torres     |
    | Sofía           | Ruiz       | Vázquez    |
    | Luis            | Martínez   | González   |
    +-----------------+------------+------------+
    ```

    

45. Devuelve el nombre del cliente con mayor límite de crédito.

    ```
    SELECT nombre_cliente
    FROM cliente
    WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente);
    +----------------+
    | nombre_cliente |
    +----------------+
    | Alicia         |
    +----------------+
    1 row in set (0.02 sec)
    ```

    

46. Devuelve el nombre del producto que tenga el precio de venta más caro.

    ```
    SELECT p.nombre_producto
    FROM producto as p
    INNER JOIN detalle_producto as dp ON p.id = dp.id_producto
    WHERE precio_venta >= ALL (SELECT precio_venta FROM detalle_producto);
    +-----------------+
    | nombre_producto |
    +-----------------+
    | pantalon        |
    +-----------------+
    ```

    

47. Devuelve el producto que menos unidades tiene en stock.
    Subconsultas con IN y NOT IN

    ```
    SELECT p.nombre_producto
    FROM producto as p
    INNER JOIN detalle_producto as dp on p.id = dp.id_producto
    WHERE stock <= ALL (SELECT stock FROM detalle_producto);
    +-----------------+
    | nombre_producto |
    +-----------------+
    | Pantalón        |
    +-----------------+
    ```

    

48. Devuelve el nombre, apellido1 y cargo de los empleados que no
    representen a ningún cliente.

    ```
    SELECT nombre_empleado, apellido_1, id_puesto
    FROM empleado
    WHERE id NOT IN (SELECT rep_ventas_id FROM cliente WHERE rep_ventas_id IS NOT NULL);
    +-----------------+------------+-----------+
    | nombre_empleado | apellido_1 | id_puesto |
    +-----------------+------------+-----------+
    | Eduardo         | Hernández  |         1 |
    | Luis            | Martínez   |         9 |
    +-----------------+------------+-----------+
    ```

    

49. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```
    SELECT c.nombre_cliente
    FROM cliente c
    WHERE c.id NOT IN (
        SELECT fpc.id_cliente
        FROM forma_pago_cliente fpc
        INNER JOIN transaccion tr ON fpc.id = tr.id_forma_pago_cliente
    );
    +----------------+
    | nombre_cliente |
    +----------------+
    | Isabel         |
    | Ricardo        |
    | Cecilia        |
    | Roberto        |
    | Lorena         |
    | Rafael         |
    | Rosa           |
    | Miguel         |
    | Patricia       |
    | Jorge          |
    | Luisa          |
    | Ernesto        |
    | Ana            |
    | Pedro          |
    | Eva            |
    | Antonio        |
    | Pilar          |
    | Fernando       |
    | Alicia         |
    +----------------+
    19 rows in set (0.01 sec)
    ```

    

50. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```
    mysql> SELECT c.nombre_cliente
        -> FROM cliente c
        -> WHERE c.id IN (
        ->     SELECT fpc.id_cliente
        ->     FROM forma_pago_cliente fpc
        ->     INNER JOIN transaccion tr ON fpc.id = tr.id_forma_pago_cliente
        -> );
    Empty set (0.00 sec)
    
    
    ```

    

51. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```
    SELECT nombre_producto
    FROM producto
    WHERE id NOT IN (
        SELECT detalle_producto_id
        FROM detalle_pedido
    );
    
    ```

    

52. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
    empleados que no sean representante de ventas de ningún cliente.

    ```
    SELECT e.nombre_empleado, e.apellido_1, e.apellido_2, p.nombre_puesto, te.numero
    FROM empleado e
    INNER JOIN puesto p ON e.id_puesto = p.id
    LEFT JOIN telefono_empleado te ON e.id = te.empleado_id
    WHERE e.id NOT IN (
        SELECT rep_ventas_id
        FROM cliente
        WHERE rep_ventas_id IS NOT NULL
    );
    +-----------------+------------+------------+------------------+---------+
    | nombre_empleado | apellido_1 | apellido_2 | nombre_puesto    | numero  |
    +-----------------+------------+------------+------------------+---------+
    | Eduardo         | Hernández  | López      | Director General | 5551234 |
    | Luis            | Martínez   | González   | Asesor Comercial | 5558765 |
    +-----------------+------------+------------+------------------+---------+
    ```

    

53. Devuelve las oficinas donde no trabajan ninguno de los empleados que
    hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ```
    mysql> SELECT e.nombre_empleado, e.apellido_1, e.apellido_2, p.nombre_puesto, te.numero
        -> FROM empleado e
        -> INNER JOIN puesto p ON e.id_puesto = p.id
        -> LEFT JOIN telefono_empleado te ON e.id = te.empleado_id
        -> WHERE e.id NOT IN (
        ->     SELECT rep_ventas_id
        ->     FROM cliente
        ->     WHERE rep_ventas_id IS NOT NULL
        -> );
    Empty set (0.00 sec)
    
    
    ```

    

54. Devuelve un listado con los clientes que han realizado algún pedido pero no
    han realizado ningún pago.

    ```
    	select o.nombre_oficina 
    	from oficina as o
    	
    
    ```

    

Subconsultas con EXISTS y NOT EXISTS
18. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```
    SELECT c.nombre_cliente
    FROM cliente c
    INNER JOIN pedido p ON c.id = p.id_cliente
    LEFT JOIN transaccion t ON p.id = t.id_forma_pago_cliente
    WHERE t.id IS NULL;
    
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```
    SELECT nombre_cliente
    FROM cliente 
    WHERE EXISTS (SELECT id_cliente 
          FROM forma_pago_cliente);
    
    +----------------+
    | nombre_cliente |
    +----------------+
    | Isabel         |
    | Ricardo        |
    | Cecilia        |
    | Roberto        |
    | Lorena         |
    | Rafael         |
    | Rosa           |
    | Miguel         |
    | Patricia       |
    | Jorge          |
    | Luisa          |
    | Ernesto        |
    | Ana            |
    | Pedro          |
    | Eva            |
    | Antonio        |
    | Pilar          |
    | Fernando       |
    | Alicia         |
    +----------------+
    ```

    

20. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```
    SELECT nombre_producto
    FROM producto
    WHERE NOT EXISTS (SELECT id_producto 
                    FROM detalle_producto);
    ```

    

21. Devuelve un listado de los productos que han aparecido en un pedido
    alguna vez.

    ```
    SELECT nombre_producto
    FROM producto
    WHERE EXISTS (SELECT id_producto 
                    FROM detalle_producto);
    ```

    Subconsultas correlacionadas
    Consultas variadas

22. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
   pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
   han realizado ningún pedido.

   ```
   SELECT c.nombre_cliente as cliente, COUNT(p.id) as 'Numero de pedidos'
   FROM cliente as c
   LEFT JOIN pedido as p ON c.id = p.id_cliente
   GROUP BY c.nombre_cliente;
   
   +----------+-------------------+
   | cliente  | Numero de pedidos |
   +----------+-------------------+
   | Isabel   |                 0 |
   | Ricardo  |                 0 |
   | Cecilia  |                 0 |
   | Roberto  |                 0 |
   | Lorena   |                 0 |
   | Rafael   |                 0 |
   | Rosa     |                 0 |
   | Miguel   |                 0 |
   | Patricia |                 0 |
   | Jorge    |                 0 |
   | Luisa    |                 0 |
   | Ernesto  |                 0 |
   | Ana      |                 0 |
   | Pedro    |                 0 |
   | Eva      |                 0 |
   | Antonio  |                 0 |
   | Pilar    |                 0 |
   | Fernando |                 0 |
   | Alicia   |                 0 |
   +----------+-------------------+
   19 rows in set (0.02 sec)
   ```

   

23. Devuelve un listado con los nombres de los clientes y el total pagado por
   cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
   realizado ningún pago.

   ```
   SELECT c.nombre_cliente, SUM(dp.cantidad * dp.precio_unidad) as 'Total pagado'
   FROM cliente as c
   LEFT JOIN pedido as pe ON c.id = pe.id_cliente
   INNER JOIN detalle_pedido as dp ON pe.id = dp.pedido_id
   GROUP BY c.nombre_cliente;
   ```

   

24. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
   ordenados alfabéticamente de menor a mayor.

   ```
   SELECT c.nombre_cliente
   FROM cliente as c
   INNER JOIN pedido as p ON c.id = p.id_cliente
   WHERE YEAR(fecha_pedido) = '2008'
   ORDER BY c.nombre_cliente ASC;
   ```

   

25. Devuelve el nombre del cliente, el nombre y primer apellido de su
   representante de ventas y el número de teléfono de la oficina del
   representante de ventas, de aquellos clientes que no hayan realizado ningún
   pago.

   ```
   SELECT c.nombre_cliente as cliente, e.nombre_empleado, e.apellido_1, tel_of.numero as 'Numero oficina'
   FROM cliente as c
   INNER JOIN empleado as e ON c.rep_ventas_id = e.id
   INNER JOIN telefono_oficina as tel_of ON e.oficina_id = tel_of.oficina_id
   LEFT JOIN forma_pago_cliente as fpc ON c.id = fpc.id_cliente
   WHERE fpc.id_cliente is null;
   ```

   

26. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
   nombre y primer apellido de su representante de ventas y la ciudad donde
   está su oficina.

   ```
   SELECT c.nombre_cliente,  e.nombre_empleado, e.apellido_1, ci.nombre_ciudad
   FROM cliente as c
   INNER JOIN empleado as e ON c.rep_ventas_id = e.id
   INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
   INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id;
   ```

   

27. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
   empleados que no sean representante de ventas de ningún cliente.

   ```
   SELECT e.nombre_empleado, e.apellido_1, e.apellido_2, pues.nombre_puesto, tel_of.numero
   FROM empleado as e
   INNER JOIN puesto as pues ON e.id_puesto = pues.id
   INNER JOIN telefono_oficina as tel_of ON e.oficina_id = tel_of.oficina_id
   LEFT JOIN cliente as c on e.id = c.rep_ventas_id
   WHERE c.rep_ventas_id is null;
   ```

   

28. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
   número de empleados que tiene.

   ```
   SELECT ci.nombre_ciudad, COUNT(e.id) as 'Cantidad empleados'
   FROM empleado as e
   INNER JOIN direccion_oficina as d_o ON e.oficina_id = d_o.oficina_id
   INNER JOIN ciudad as ci ON d_o.ciudad_id = ci.id
   GROuP BY ci.nombre_ciudad;
   
   +---------------+--------------------+
   | nombre_ciudad | Cantidad empleados |
   +---------------+--------------------+
   | Sevilla       |                  1 |
   | Málaga        |                  1 |
   | Barcelona     |                  1 |
   | Madrid        |                  1 |
   | Valencia      |                  1 |
   | Vigo          |                  1 |
   | Bilbao        |                  1 |
   | Valladolid    |                  1 |
   | Toledo        |                  1 |
   | Zaragoza      |                  1 |
   +---------------+--------------------+
   ```

   # **procedimientos almacenados**



1. **Agregar un nuevo contacto con su teléfono y dirección:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE agregar_contacto(IN nombre VARCHAR(255), IN email VARCHAR(255), IN telefono INT, IN tipo_telefono INT, IN direccion VARCHAR(255))
BEGIN
    DECLARE nuevo_contacto_id INT;
    
    INSERT INTO contacto (nombre, email, direccion) VALUES (nombre, email, direccion);
    SET nuevo_contacto_id = LAST_INSERT_ID();
    INSERT INTO telefono_contacto (numero, tipo_telefono, contacto_id) VALUES (telefono, tipo_telefono, nuevo_contacto_id);
    
    SELECT nuevo_contacto_id AS 'ID del nuevo contacto';
END //

DELIMITER ;
```

1. **Actualizar la dirección de un contacto:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE actualizar_direccion_contacto(IN contacto_id INT, IN nueva_direccion VARCHAR(255))
BEGIN
    UPDATE contacto SET direccion = nueva_direccion WHERE id = contacto_id;
END //

DELIMITER ;
```

1. **Calcular el total de transacciones para un cliente específico:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE calcular_total_transacciones_cliente(IN cliente_id INT)
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    SELECT SUM(total) INTO total
    FROM transaccion t
    INNER JOIN forma_pago_cliente fpc ON t.id_forma_pago_cliente = fpc.id
    WHERE fpc.cliente_id = cliente_id;
    
    SELECT total AS 'Total de transacciones';
END //

DELIMITER ;
```

1. **Generar un código de descuento aleatorio para un cliente:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE generar_codigo_descuento(IN cliente_id INT)
BEGIN
    DECLARE codigo_descuento VARCHAR(10);
    
    SET codigo_descuento = CONCAT('DESC', cliente_id, RAND());
    
    SELECT codigo_descuento AS 'Código de descuento';
END //

DELIMITER ;
```

1. **Eliminar un contacto y todos sus teléfonos asociados:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE eliminar_contacto_y_telefonos(IN contacto_id INT)
BEGIN
    DELETE FROM telefono_contacto WHERE contacto_id = contacto_id;
    DELETE FROM contacto WHERE id = contacto_id;
END //

DELIMITER ;
```

1. **Agregar un nuevo teléfono de empleado con verificación de existencia de empleado:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE agregar_telefono_empleado(IN empleado_id INT, IN numero INT, IN extension INT, IN tipo_telefono INT)
BEGIN
    DECLARE empleado_existente INT;
    
    SELECT COUNT(*) INTO empleado_existente FROM empleado WHERE id = empleado_id;
    
    IF empleado_existente > 0 THEN
        INSERT INTO telefono_empleado (tipo_telefono, empleado_id, numero, extension) VALUES (tipo_telefono, empleado_id, numero, extension);
        SELECT 'Teléfono de empleado agregado correctamente' AS 'Mensaje';
    ELSE
        SELECT 'Empleado no encontrado' AS 'Mensaje';
    END IF;
END //

DELIMITER ;
```

1. **Marcar una transacción como fraudulenta basada en un criterio específico:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE marcar_transaccion_fraudulenta(IN transaccion_id INT)
BEGIN
    DECLARE total_transaccion DECIMAL(10, 2);
    
    SELECT total INTO total_transaccion FROM transaccion WHERE id = transaccion_id;
    
    IF total_transaccion > 1000 THEN
        UPDATE transaccion SET fraudulenta = 1 WHERE id = transaccion_id;
        SELECT 'Transacción marcada como fraudulenta' AS 'Mensaje';
    ELSE
        SELECT 'La transacción no cumple con el criterio para ser marcada como fraudulenta' AS 'Mensaje';
    END IF;
END //

DELIMITER ;
```

1. **Generar un informe de transacciones mensuales para un cliente:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE generar_informe_transacciones_mensuales(IN cliente_id INT)
BEGIN
    DECLARE fecha_inicio DATE;
    DECLARE fecha_fin DATE;
    
    SET fecha_inicio = DATE_FORMAT(NOW(), '%Y-%m-01');
    SET fecha_fin = LAST_DAY(NOW());
    
    SELECT * FROM transaccion WHERE id_forma_pago_cliente = cliente_id AND fecha_pago BETWEEN fecha_inicio AND fecha_fin;
END //

DELIMITER ;
```

1. **Enviar un correo electrónico de promoción a todos los clientes:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE enviar_correo_promocional()
BEGIN
    DECLARE cliente_email VARCHAR(255);
    
    DECLARE cur CURSOR FOR SELECT email FROM cliente;
    OPEN cur;
    
    cliente_loop: LOOP
        FETCH cur INTO cliente_email;
        IF done THEN
            LEAVE cliente_loop;
        END IF;
        
        -- Aquí va la lógica para enviar el correo promocional a cada cliente
        -- Por ejemplo: CALL enviar_correo(cliente_email, '¡Promoción especial para ti!', '¡No te pierdas nuestra oferta exclusiva!');
    END LOOP cliente_loop;
    
    CLOSE cur;
END //

DELIMITER ;
```

1. **Generar un resumen de ventas mensuales por tipo de pago:**

```
sql
Copy code
DELIMITER //

CREATE PROCEDURE generar_resumen_ventas_mensuales()
BEGIN
    SELECT MONTH(fecha_pago) AS mes, SUM(total) AS total_ventas
    FROM transaccion
    GROUP BY MONTH(fecha_pago);
END //

DELIMITER ;
```