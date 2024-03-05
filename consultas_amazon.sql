-- Consultas simples

-- Tabla vendedor
-- Obtener el nombre y correo electrónico de todos los vendedores que no son empresas
SELECT nombre, correo FROM vendedor WHERE es_empresa = false;

-- Mostrar los nombres y DNI/CIF de los vendedores cuyo nombre comienza con la letra 'M'
SELECT nombre, dni_cif FROM vendedor WHERE nombre LIKE 'M%';

-- Encontrar los vendedores que tienen más de 100 ventas
SELECT * FROM vendedor WHERE id_vendedor IN (SELECT id_vendedor FROM producto WHERE ventas > 100) ORDER BY nombre ASC;

-- Tabla producto
-- Mostrar los nombres y categorías de productos que tienen una calificación superior a 4.5
SELECT nombre, categoria FROM producto WHERE calificacion > 4.5;

-- Obtener la cantidad total de ventas de todos los productos de la categoría 'Deporte'.
SELECT SUM(ventas) AS total_ventas FROM producto WHERE categoria = 'Deporte';

-- Encontrar los productos introducidos antes del 2024-04-01 con un precio mayor a $50.00.
SELECT * FROM producto WHERE fecha_introduccion < '2024-04-01' AND precio > 50.00;

-- Tabla cliente

-- Obtener los nombres y direcciones de los clientes nacidos después del año 1990.
SELECT nombre, direccion FROM cliente WHERE YEAR(fecha_nacimiento) > 1990;

-- Mostrar los correos electrónicos de los clientes cuyo nombre contiene la letra 'o'.
SELECT correo FROM cliente WHERE nombre LIKE '%o%';

-- Obtener los nombres y números de tarjeta de los clientes que tienen una dirección en 'Ciudad A'.
SELECT nombre, numero_tarjeta FROM cliente WHERE direccion LIKE '%Ciudad A%';

-- Tabla compra
-- Mostrar la cantidad total de productos comprados por cada cliente.
SELECT id_cliente, SUM(cantidad_comprada) AS total_productos_comprados FROM compra GROUP BY id_cliente;

-- Tabla empleado
-- Obtener los nombres y salarios de los empleados cuyo salario es superior a $1300
SELECT nombre, salario FROM empleado WHERE salario > 1300;

-- Obtener los nombres y edades de los empleados ordenados de mayor a menor edad.
SELECT nombre, YEAR(CURDATE()) - YEAR(fecha_nacimiento) AS edad FROM empleado ORDER BY edad DESC;

-- Obtener los nombres y apellidos de los empleados cuyos apellidos comienzan con la letra 'G'.
SELECT nombre, apellidos FROM empleado WHERE apellidos LIKE 'G%';

-- Tabla ayuda
-- Encontrar las solicitudes de ayuda que aún no han sido resueltas y mostrar la descripción y la fecha de ayuda
SELECT descipcion, fecha_ayuda FROM ayuda WHERE es_resuelta = false;

-- Consultas complejas

-- Obtener los nombres de los vendedores que han realizado ventas de productos con una calificación mayor a 4.5.
SELECT v.nombre
FROM vendedor v
JOIN producto p ON v.id_vendedor = p.id_vendedor
WHERE p.calificacion > 4.5;

-- Mostrar la cantidad total de compras realizadas por cada cliente, ordenadas de mayor a menor cantidad.
SELECT c.id_cliente, COUNT(co.id_compra) AS total_compras
FROM cliente c
LEFT JOIN compra co ON c.id_cliente = co.id_cliente
GROUP BY c.id_cliente
ORDER BY total_compras DESC;

-- Encontrar los productos comprados por clientes nacidos después de 1990 y mostrar sus nombres y fechas de compra.
SELECT p.nombre
FROM producto p
JOIN compra co ON p.id_producto = co.id_producto
JOIN cliente c ON co.id_cliente = c.id_cliente
WHERE YEAR(c.fecha_nacimiento) > 1990;

-- Mostrar los empleados cuyo salario sea mayor que el salario promedio de la empresa.
SELECT nombre, salario
FROM empleado
WHERE salario > (SELECT MAX(salario) FROM empleado);

-- Obtener el nombre y correo electrónico de los vendedores que no tienen productos en la categoría 'Electronica'.
SELECT v.nombre, v.correo
FROM vendedor v
LEFT JOIN producto p ON v.id_vendedor = p.id_vendedor AND p.categoria = 'Electronica'
WHERE p.id_producto IS NULL;

-- Mostrar los nombres de los clientes que han realizado compras de productos en la categoría 'Deporte' y 'Cocina'.
SELECT c.nombre
FROM cliente c
JOIN compra co ON c.id_cliente = co.id_cliente
JOIN producto p ON co.id_producto = p.id_producto
WHERE p.categoria IN ('Deporte', 'Cocina');

-- Encontrar los productos con más ventas y mostrar sus nombres y la cantidad total de ventas.
SELECT p.nombre, SUM(p.ventas) AS total_ventas
FROM producto p
GROUP BY p.id_producto
ORDER BY total_ventas DESC
LIMIT 5;

-- Obtener el nombre de los clientes que han realizado compras en la misma fecha que el cliente con ID 3.
SELECT DISTINCT c1.nombre
FROM cliente c1
JOIN compra co1 ON c1.id_cliente = co1.id_cliente
JOIN compra co2 ON co1.fecha_compra = co2.fecha_compra AND co2.id_cliente = 3;

-- Calcular el total de ingresos obtenidos por la venta de productos de la categoría 'Electronica'.
SELECT SUM(precio * cantidad_comprada) AS total_ingresos
FROM producto p
JOIN compra co ON p.id_producto = co.id_producto
WHERE p.categoria = 'Electronica';

-- Obtener el nombre y fecha de ayuda de los clientes que han solicitado ayuda sin resolver y cuyo empleado asignado tiene un salario superior a $1300.
SELECT c.nombre, a.fecha_ayuda
FROM cliente c
JOIN ayuda a ON c.id_cliente = a.id_cliente
JOIN empleado e ON a.id_empleado = e.id_empleado
WHERE a.es_resuelta = false AND e.salario > 1300;
