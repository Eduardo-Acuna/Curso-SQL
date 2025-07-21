-- ------------------------------------------------------------
-- SELECCIÓN DE BASE DE DATOS
-- ------------------------------------------------------------
-- Seleccionamos la base de datos que vamos a utilizar
-- Esta sentencia se usa para indicar sobre qué base de datos trabajaremos en la sesión actual.
-- IMPORTANTE: Si no seleccionás una base de datos, podrías obtener errores al intentar ejecutar sentencias.
USE consultas_sql.sql;

-- ------------------------------------------------------------
-- CREACIÓN DE TABLA
-- ------------------------------------------------------------
-- Crear una tabla llamada productos con sus columnas
-- Esta sentencia se usa para definir una nueva tabla, indicando el nombre y los campos que contendrá.
-- Es importante definir correctamente los tipos de datos y restricciones para asegurar integridad.
-- Observación: Cada tabla debería tener una clave primaria (PRIMARY KEY) para identificar de forma única cada fila.
CREATE TABLE productos(
    id INT AUTO_INCREMENT PRIMARY KEY,     -- identificador único
    nombre VARCHAR(55) NOT NULL,           -- nombre del producto, no permite valores nulos
    precio DOUBLE,                         -- precio del producto (número decimal)
    stock INT DEFAULT 0                    -- cantidad en stock, por defecto 0
);

-- ------------------------------------------------------------
-- INSERCIÓN DE DATOS
-- ------------------------------------------------------------
-- Agregar valores a los campos de forma individual
-- IMPORTANTE: El orden de los valores debe coincidir con el orden de las columnas si no se las especifica.
-- Si una columna tiene AUTO_INCREMENT, puede usarse NULL para que se genere automáticamente.
INSERT INTO `productos` (`id`,`nombre`,`precio`,`stock`) VALUES (NULL, 'Arroz', '900', '35');
INSERT INTO `productos` (`id`,`nombre`,`precio`,`stock`) VALUES (NULL, 'fideos', 4000, 23);
INSERT INTO productos (nombre, precio, stock ) VALUES('pororto',3000,45);
INSERT INTO productos (nombre, precio, stock) VALUES ('yerba mate', 6000,30);

-- Agregar múltiples registros con un solo INSERT
-- Esta forma es más eficiente cuando queremos insertar varios datos a la vez
-- Evita repetir la sentencia INSERT y ahorra procesamiento
INSERT INTO productos(nombre, precio, stock) 
VALUES
('Azucar', 4500,125),
('Aceite', 8000,89),
('Jabon', 2500,60);

-- ------------------------------------------------------------
-- CONSULTA DE DATOS
-- ------------------------------------------------------------
-- Trae todos los registros
SELECT * FROM productos;

-- Trae registros filtrados con condiciones
SELECT nombre, precio, stock FROM productos WHERE precio >= 1000;
SELECT nombre, precio, stock FROM productos WHERE precio >= 1000 AND stock>30;
SELECT nombre, precio, stock FROM productos WHERE precio >= 1000 OR stock>30;

-- Uso de IN (comparar con una lista de valores)
SELECT * FROM productos WHERE precio IN (900, 3000, 8000);

-- Uso de LIKE (búsqueda por patrón)
SELECT * FROM productos WHERE nombre LIKE 'a%';   -- nombres que comienzan con 'a'

-- IS NULL / IS NOT NULL (verificar nulos)
SELECT * FROM productos WHERE stock IS NOT NULL;

-- ------------------------------------------------------------
-- MODIFICACIÓN DE DATOS
-- ------------------------------------------------------------
-- Modificar registros existentes
UPDATE productos SET precio = 1100 WHERE nombre = 'Arroz';

-- Error común: UPDATE sin WHERE → modifica todos los registros
-- UPDATE productos SET precio = 1500;

-- ------------------------------------------------------------
-- ELIMINACIÓN DE DATOS
-- ------------------------------------------------------------
-- Borrar registros específicos
DELETE FROM productos WHERE nombre = 'poroto';

-- ------------------------------------------------------------
-- ORDENAMIENTO DE RESULTADOS
-- ------------------------------------------------------------
-- Ordenar por columnas
SELECT * FROM productos ORDER BY nombre ASC;        -- A-Z
SELECT * FROM productos ORDER BY nombre DESC;       -- Z-A
SELECT * FROM productos ORDER BY precio ASC;        -- menor a mayor
SELECT * FROM productos ORDER BY precio DESC;       -- mayor a menor

-- ------------------------------------------------------------
-- CLASE X: FUNCIONES DE AGREGACIÓN EN MYSQL
-- ------------------------------------------------------------
-- Introducción a las funciones de agregación más comunes utilizadas en consultas SQL

------------------------------------------------------------
-- 1. ¿Qué son las funciones de agregación?
------------------------------------------------------------
-- Son funciones que operan sobre un conjunto de valores y devuelven un único resultado.
-- Se utilizan normalmente con GROUP BY para agrupar datos por categorías o condiciones.

------------------------------------------------------------
-- 2. Funciones principales de agregación en MySQL
------------------------------------------------------------

-- COUNT(): Cuenta la cantidad de filas o valores no nulos
-- Ejemplo: contar cuántos productos hay en la tabla
SELECT COUNT(*) AS total_productos FROM productos;

-- SUM(): Suma todos los valores de una columna numérica
-- Ejemplo: sumar el stock total de productos
SELECT SUM(stock) AS stock_total FROM productos;

-- AVG(): Calcula el promedio de los valores numéricos
-- Ejemplo: obtener el precio promedio de los productos
SELECT AVG(precio) AS precio_promedio FROM productos;

-- MAX(): Devuelve el valor máximo de una columna
-- Ejemplo: encontrar el precio más alto
SELECT MAX(precio) AS precio_mas_alto FROM productos;

-- MIN(): Devuelve el valor mínimo de una columna
-- Ejemplo: encontrar el precio más bajo
SELECT MIN(precio) AS precio_mas_bajo FROM productos;

------------------------------------------------------------
-- 3. Usando GROUP BY con funciones de agregación
------------------------------------------------------------

-- Ejemplo: total de stock agrupado por categoría
-- Supongamos que la tabla productos tiene una columna categoria
-- SELECT categoria, SUM(stock) AS stock_por_categoria FROM productos GROUP BY categoria;

-- Ejemplo: promedio de precio por categoría
-- SELECT categoria, AVG(precio) AS promedio_precio FROM productos GROUP BY categoria;

-- Ejemplo: agrupar por nombre y obtener estadísticas
SELECT nombre, COUNT(*) AS cantidad, SUM(precio) AS total_precio, AVG(precio) AS promedio_precio FROM productos GROUP BY nombre;

------------------------------------------------------------
-- 4. Usando HAVING para filtrar los grupos
------------------------------------------------------------

-- Ejemplo: mostrar solo los productos con más de 50 unidades en total
SELECT nombre, SUM(stock) AS total_stock FROM productos GROUP BY nombre HAVING total_stock > 50;

------------------------------------------------------------
-- 5. Notas importantes
------------------------------------------------------------
-- Las funciones de agregación ignoran los valores NULL.
-- COUNT(*) cuenta todas las filas, incluso si hay NULLs.
-- COUNT(columna) cuenta solo las filas donde columna no es NULL.
-- HAVING se usa después de GROUP BY para filtrar los resultados agregados.
-- WHERE se usa antes de agrupar para filtrar filas individuales.
-- Si combinás columnas con funciones de agregación sin GROUP BY, obtendrás un error (modo ONLY_FULL_GROUP_BY activo).

-- ------------------------------------------------------------
-- LIMIT: limitar resultados
-- ------------------------------------------------------------
SELECT * FROM productos ORDER BY precio LIMIT 5;

-- ------------------------------------------------------------
-- REPLACE INTO: insertar o reemplazar si ya existe (por clave primaria)
-- ------------------------------------------------------------
REPLACE INTO productos (id, nombre, precio, stock) VALUES (1, 'Arroz', 950, 40);

-- ------------------------------------------------------------
-- INSERT IGNORE: ignora si hay errores por duplicado
-- ------------------------------------------------------------
INSERT IGNORE INTO productos (id, nombre, precio, stock) VALUES (1, 'Arroz', 950, 40);

-- ------------------------------------------------------------
-- INSERT ON DUPLICATE KEY UPDATE: si ya existe, actualiza el valor
-- ------------------------------------------------------------
INSERT INTO productos (id, nombre, precio, stock) 
VALUES (1, 'Arroz', 950, 40)
ON DUPLICATE KEY UPDATE precio = 950, stock = 40;

-- ------------------------------------------------------------
-- FUNCIONES DE TEXTO Y FECHA (uso básico)
-- ------------------------------------------------------------
SELECT UPPER(nombre) AS nombre_mayus FROM productos;
SELECT LOWER(nombre) AS nombre_minus FROM productos;
SELECT LENGTH(nombre) AS largo_nombre FROM productos;
SELECT NOW() AS fecha_actual;
SELECT CURDATE() AS solo_fecha;
SELECT YEAR(NOW()) AS anho_actual;
SELECT MONTH(NOW()) AS mes_actual;

-- ------------------------------------------------------------
-- CASE WHEN: condiciones en SELECT
-- ------------------------------------------------------------
SELECT nombre, precio,
  CASE 
    WHEN precio < 3000 THEN 'Barato'
    WHEN precio BETWEEN 3000 AND 7000 THEN 'Moderado'
    ELSE 'Caro'
  END AS categoria_precio
FROM productos;

-- ------------------------------------------------------------
-- SUBCONSULTAS: consultas dentro de consultas
-- ------------------------------------------------------------
SELECT * FROM productos WHERE precio > (SELECT AVG(precio) FROM productos);

-- ------------------------------------------------------------
--  OBSERVACIONES GENERALES
-- ------------------------------------------------------------
-- - Siempre revisar que los tipos de datos coincidan.
-- - Usar WHERE en UPDATE y DELETE para evitar errores graves.
-- - Las funciones de agregación requieren GROUP BY si se usan con otras columnas.
-- - Los nombres de columnas o tablas deben coincidir exactamente (sensible a mayúsculas/minúsculas en algunos servidores).
-- - Los textos van entre comillas, los números no.
-- - Cuidado con las comas al separar valores y columnas.
-- - El alias con AS ayuda a dar nombres más claros a las columnas de resultado.
-- - Tener cuidado con el modo ONLY_FULL_GROUP_BY que puede restringir algunas combinaciones si no se usan correctamente los GROUP BY.
