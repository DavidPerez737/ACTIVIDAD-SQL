CALL FABRICANTE_i("Asus");
CALL FABRICANTE_i("Lenovo");
CALL FABRICANTE_i("Hewlett-Packard");
CALL FABRICANTE_i("Samsung");
CALL FABRICANTE_i("Seagate");
CALL FABRICANTE_i("Crucial");
CALL FABRICANTE_i("Gigabyte");
CALL FABRICANTE_i("Huawei"); -- perguntar si aca es con la apostrofe por lo que no tienen productos
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
SELECT nombre FROM PRODUCTO;
SELECT nombre, precio FROM PRODUCTO;
SELECT * FROM PRODUCTO;
SELECT nombre AS `nombre de producto`, precio AS euros, ROUND(precio * 1.12, 2) AS dólares FROM PRODUCTO;
SELECT UPPER(nombre) AS nombre, precio FROM PRODUCTO;
SELECT LOWER(nombre) AS nombre, precio FROM PRODUCTO;
SELECT nombre, UPPER(LEFT(nombre, 2)) AS `DOS CARACTERES` FROM FABRICANTE;
SELECT nombre, ROUND(precio) AS precio FROM PRODUCTO;
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM PRODUCTO;
SELECT codigo_fabr FROM PRODUCTO;
