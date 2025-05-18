CALL FABRICANTE_i("Asus");
CALL FABRICANTE_i("Lenovo");
CALL FABRICANTE_i("Hewlett-Packard");
CALL FABRICANTE_i("Samsung");
CALL FABRICANTE_i("Seagate");
CALL FABRICANTE_i("Crucial");
CALL FABRICANTE_i("Gigabyte");
CALL FABRICANTE_i("Huawei");
CALL FABRICANTE_i("Xiaomi");

CALL PRODUCTO_i("Disco duro SATA3 1TB", 86.99, 5);
CALL PRODUCTO_i("Memoria RAM DDR4 8GB", 120, 6);
CALL PRODUCTO_i("Disco SSD 1 TB", 150.99, 4);
CALL PRODUCTO_i("GeForce GTX 1050Ti", 185, 7);
CALL PRODUCTO_i("GeForce GTX 1080 Xtreme", 755, 6);
CALL PRODUCTO_i("Monitor 24 LED Full HD", 202, 1);
CALL PRODUCTO_i("Monitor 27 LED Full HD", 245.99, 1);
CALL PRODUCTO_i("Portátil Yoga 520", 559, 2);
CALL PRODUCTO_i("Portátil Ideapd 320", 444, 2);
CALL PRODUCTO_i("Impresora HP Deskjet 3720", 59.99, 3);
CALL PRODUCTO_i("Impresora HP Laserjet Pro M26nw", 180, 3);

-- CONSULTA TABLAS

SELECT nombre FROM PRODUCTO; -- 1
SELECT nombre, precio FROM PRODUCTO; -- 2
SELECT * FROM PRODUCTO; -- 3
SELECT nombre, precio, ROUND(precio * 1.12, 2) FROM PRODUCTO; -- 4
SELECT nombre AS "nombre de producto", precio AS euros, ROUND(precio * 1.12, 2) AS dolares FROM PRODUCTO; -- 5
SELECT UPPER(nombre) AS nombre, precio FROM PRODUCTO; -- 6
SELECT LOWER(nombre) AS nombre, precio FROM PRODUCTO; -- 7
SELECT nombre, UPPER(LEFT(nombre, 2)) AS "DOS CARACTERES" FROM FABRICANTE; -- 8
SELECT nombre, ROUND(precio) AS precio FROM PRODUCTO; -- 9
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM PRODUCTO; -- 10
SELECT codigo_fabr FROM PRODUCTO; -- 11
SELECT DISTINCT codigo_fabr FROM PRODUCTO; -- 12
SELECT nombre FROM FABRICANTE ORDER BY nombre ASC; -- 13
SELECT nombre FROM FABRICANTE ORDER BY nombre DESC; -- 14
SELECT nombre FROM PRODUCTO ORDER BY nombre ASC, precio DESC; -- 15
SELECT * FROM FABRICANTE LIMIT 5; -- 16
SELECT * FROM FABRICANTE LIMIT 3,2; -- 17
SELECT nombre, precio FROM PRODUCTO ORDER BY precio ASC LIMIT 1; -- 18
SELECT nombre, precio FROM PRODUCTO ORDER BY precio DESC LIMIT 1; -- 19
SELECT nombre FROM PRODUCTO WHERE codigo_fabr = 2; -- 20
SELECT nombre FROM PRODUCTO WHERE precio <= 120; -- 21
SELECT nombre FROM PRODUCTO WHERE precio >= 400; -- 22
SELECT nombre FROM PRODUCTO WHERE precio < 400; -- 23
SELECT * FROM PRODUCTO WHERE precio > 80 AND precio < 300; -- 24
SELECT * FROM PRODUCTO WHERE precio BETWEEN 60 AND 200; -- 25
SELECT * FROM PRODUCTO WHERE precio > 200 AND codigo_fabr = 6; -- 26
SELECT * FROM PRODUCTO WHERE codigo_fabr = 1 OR codigo_fabr = 3 OR codigo_fabr = 5; -- 27
SELECT * FROM PRODUCTO WHERE codigo_fabr IN (1, 3, 5); -- 28
SELECT nombre, precio * 100 AS centimos FROM PRODUCTO; -- 29
SELECT nombre FROM FABRICANTE WHERE nombre LIKE "S%"; -- 30
SELECT nombre FROM FABRICANTE WHERE nombre LIKE "%e"; -- 31
SELECT nombre FROM FABRICANTE WHERE nombre LIKE "%w%"; -- 32
SELECT nombre FROM FABRICANTE WHERE LENGTH(nombre) = 4; -- 33
SELECT nombre FROM PRODUCTO WHERE nombre LIKE "%Portatil%"; -- 34
SELECT nombre FROM PRODUCTO WHERE nombre LIKE "%monitor%" AND precio < 215; -- 35
SELECT nombre, precio FROM PRODUCTO WHERE precio >= 180 ORDER BY precio DESC, nombre ASC; -- 36

-- CONSULTA MULTITABLA INTERNA

-- 1
SELECT p.nombre, p.precio, f.nombre as nombre_fabricante 
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo;
-- 2
SELECT p.nombre, p.precio, f.nombre as nombre_fabricante 
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo 
ORDER BY f.nombre ASC;
-- 3
SELECT p.codigo as codigo_producto, p.nombre, f.codigo as codigo_fabricante, f.nombre
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo;
-- 4
SELECT p.nombre, p.precio, f.nombre as nombre_fabricante
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
ORDER BY p.precio ASC LIMIT 1;
-- 5
SELECT p.nombre, p.precio, f.nombre as nombre_fabricante
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
ORDER BY p.precio DESC LIMIT 1;
-- 6
SELECT p.* 
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.codigo = 2;
-- 7
SELECT p.*
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.codigo = 6 AND precio > 200;
-- 8
SELECT p.*
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.codigo = 1 OR f.codigo = 3 OR f.codigo = 5;
-- 9
SELECT p.*
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.codigo IN (1, 3, 5);
-- 10
SELECT p.nombre, p.precio
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.nombre LIKE "%e";
-- 11
SELECT p.nombre, p.precio
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.nombre LIKE "%w%";
-- 12
SELECT p.nombre, p.precio, f.nombre 
FROM PRODUCTO as p JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
-- 13 
SELECT DISTINCT f.codigo, f.nombre
FROM PRODUCTO as p LEFT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo;

-- CONSULTA MULTITABLA EXTERNA

-- 1
SELECT f.*, p.*
FROM PRODUCTO as p RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo;
-- 2
SELECT f.nombre
FROM FABRICANTE AS f
LEFT JOIN PRODUCTO AS p ON p.codigo_fabr = f.codigo
WHERE p.codigo_fabr IS NULL;
-- 3 EN WORD

-- CONSULTAS RESUMEN

-- 1
SELECT COUNT(*) FROM PRODUCTO;
-- 2
SELECT COUNT(*) FROM FABRICANTE;
-- 3
SELECT COUNT(DISTINCT codigo_fabr) FROM PRODUCTO;
-- 4
SELECT TRUNCATE(AVG(precio), 1) FROM PRODUCTO;
-- 5
SELECT MIN(precio) FROM PRODUCTO;
-- 6
SELECT MAX(precio) FROM PRODUCTO;
-- 7
SELECT precio, nombre  FROM PRODUCTO 
WHERE precio = (SELECT MIN(precio) FROM PRODUCTO);
-- 8
SELECT precio, nombre FROM PRODUCTO
WHERE precio = (SELECT MAX(precio) FROM PRODUCTO);
-- 9
SELECT SUM(precio) FROM PRODUCTO;
-- 10
SELECT COUNT(*) FROM PRODUCTO
WHERE codigo_fabr = 1;
-- 11
SELECT TRUNCATE(AVG(precio), 1) FROM PRODUCTO
WHERE codigo_fabr = 1;
-- 12
SELECT MIN(precio) FROM PRODUCTO
WHERE codigo_fabr = 1;
-- 13
SELECT MAX(precio) FROM PRODUCTO
WHERE codigo_fabr = 1;
-- 14
SELECT SUM(precio) FROM PRODUCTO
WHERE codigo_fabr = 1;
-- 15
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*) 
FROM PRODUCTO WHERE codigo_fabr = 6;
-- 16
SELECT f.nombre, COUNT(p.codigo) AS cantidad_productos 
FROM PRODUCTO AS p RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre ORDER BY cantidad_productos DESC;
-- 17
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio)
FROM PRODUCTO AS p RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre;
-- 18
SELECT f.codigo, MAX(p.precio), MIN(p.precio), AVG(p.precio) as precio_medio, COUNT(*) as total_productos
FROM PRODUCTO as p RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre HAVING precio_medio *0.90 > 200;
-- 19
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio) as precio_medio, COUNT(*) as total_productos
FROM PRODUCTO as p RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre HAVING precio_medio *0.90 > 200;
-- 20
SELECT COUNT(*) as numero_productos 
FROM PRODUCTO WHERE precio *0.90 >= 180; 
-- 21
SELECT f.nombre, COUNT(*) FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE p.precio *0.90 >= 180 GROUP BY f.nombre;
-- 22
SELECT f.codigo, AVG(p.precio) FROM PRODUCTO as p
RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.codigo;
-- 23
SELECT f.nombre, AVG(p.precio) FROM PRODUCTO as p
RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre;
-- 24
SELECT f.nombre FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre HAVING AVG(p.precio *0.90) >= 150;
-- 25
SELECT f.nombre FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre HAVING COUNT(*) >= 2;
-- 26
SELECT f.nombre, COUNT(*) as total FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE p.precio *0.90 >= 220 GROUP BY f.nombre ORDER BY total DESC;
-- 27
SELECT f.nombre, COUNT(CASE WHEN p.precio *0.90 >= 220 THEN 1 ELSE NULL END) as total FROM PRODUCTO as p
RIGHT JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre ORDER BY total DESC;
-- 28
SELECT f.nombre FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
GROUP BY f.nombre HAVING SUM(p.precio *0.90) > 1000;
-- 29
SELECT p.nombre, p.precio, f.nombre FROM PRODUCTO p
JOIN FABRICANTE f ON p.codigo_fabr = f.codigo
WHERE p.precio = (SELECT MAX(p2.precio) FROM PRODUCTO as p2 WHERE p2.codigo_fabr = p.codigo_fabr) 
ORDER BY f.nombre ASC;

-- SUBCONSULTAS WHERE

-- 1
SELECT * FROM PRODUCTO as p
WHERE p.codigo_fabr = (SELECT f.codigo FROM FABRICANTE as f WHERE f.codigo = 2);
-- 2
SELECT * FROM PRODUCTO as p
WHERE p.precio = (SELECT MAX(p2.precio) FROM PRODUCTO as p2 
WHERE p2.codigo_fabr = (SELECT f.codigo FROM FABRICANTE as f WHERE f.nombre = 'Lenovo'));
-- 3
SELECT p.nombre FROM PRODUCTO as p
WHERE p.precio = (SELECT MAX(p2.precio) FROM PRODUCTO as p2
WHERE p2.codigo_fabr = (SELECT f.codigo FROM FABRICANTE as f WHERE f.nombre = 'Lenovo'));
-- 4
SELECT p.nombre FROM PRODUCTO as p
WHERE p.precio = (SELECT MIN(p2.precio) FROM PRODUCTO as p2
WHERE p2.codigo_fabr = (SELECT f.codigo FROM FABRICANTE as f WHERE f.nombre = 'Hewlett-Packard'));
-- 5
SELECT * FROM PRODUCTO as p
WHERE p.precio >= (SELECT MAX(p2.precio) FROM PRODUCTO as p2
WHERE p2.codigo_fabr = (SELECT f.codigo FROM FABRICANTE as f WHERE f.nombre = 'Lenovo'));
-- 6
SELECT p.* FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p2.precio) FROM PRODUCTO as p2
JOIN FABRICANTE as f2 ON p2.codigo_fabr = f2.codigo WHERE f2.nombre = 'Asus');
-- 7
SELECT * FROM PRODUCTO as p
WHERE p.precio >= ALL (SELECT p2.precio FROM PRODUCTO as p2);
-- 8
SELECT * FROM PRODUCTO as p
WHERE p.precio <= ALL (SELECT p2.precio FROM PRODUCTO as p2);
-- 9
SELECT f.nombre FROM FABRICANTE as f
WHERE f.codigo = ANY (SELECT DISTINCT p.codigo_fabr FROM PRODUCTO as p);
-- 10
SELECT f.nombre FROM FABRICANTE as f
WHERE f.codigo <> ALL (SELECT DISTINCT p.codigo_fabr FROM PRODUCTO as p);
-- 11
SELECT f.nombre FROM FABRICANTE as f
WHERE f.codigo IN (SELECT DISTINCT p.codigo_fabr FROM PRODUCTO as p);
-- 12
SELECT f.nombre FROM FABRICANTE as f
WHERE f.codigo NOT IN (SELECT DISTINCT p.codigo_fabr FROM PRODUCTO as p);
-- 13
SELECT f.nombre FROM FABRICANTE as f
WHERE EXISTS (SELECT 1 FROM PRODUCTO as p WHERE p.codigo_fabr = f.codigo);
-- 14
SELECT f.nombre FROM FABRICANTE as f
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTO as p WHERE p.codigo_fabr = f.codigo);
-- 15
SELECT f.nombre, p.nombre, p.precio FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE p.precio = (SELECT MAX(p2.precio) FROM PRODUCTO as p2
WHERE p2.codigo_fabr = f.codigo);
-- 16
SELECT * FROM PRODUCTO as p
WHERE p.precio >= (SELECT AVG(p2.precio) FROM PRODUCTO as p2 
WHERE p2.codigo_fabr = p.codigo_fabr);
-- 17
SELECT p.nombre FROM PRODUCTO as p
JOIN FABRICANTE as f ON p.codigo_fabr = f.codigo
WHERE f.nombre = 'Lenovo' AND p.precio = (SELECT MAX(p2.precio) FROM PRODUCTO as p2
WHERE p2.codigo_fabr = f.codigo);
-- 18 
SELECT f.nombre FROM FABRICANTE as f
JOIN PRODUCTO as p ON p.codigo_fabr = f.codigo
GROUP BY f.nombre HAVING COUNT(*) = (SELECT COUNT(*) FROM PRODUCTO as p2
JOIN FABRICANTE as f2 ON p2.codigo_fabr = f2.codigo
WHERE f2.nombre = 'Lenovo');