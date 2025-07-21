-- CLASE X: FUNCIONES DE AGREGACIÓN EN MYSQL
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
SELECT COUNT(*) AS total_productos
FROM productos;

-- SUM(): Suma todos los valores de una columna numérica
-- Ejemplo: sumar el stock total de productos
SELECT SUM(stock) AS stock_total
FROM productos;

-- AVG(): Calcula el promedio de los valores numéricos
-- Ejemplo: obtener el precio promedio de los productos
SELECT AVG(precio) AS precio_promedio
FROM productos;

-- MAX(): Devuelve el valor máximo de una columna
-- Ejemplo: encontrar el precio más alto
SELECT MAX(precio) AS precio_mas_alto
FROM productos;

-- MIN(): Devuelve el valor mínimo de una columna
-- Ejemplo: encontrar el precio más bajo
SELECT MIN(precio) AS precio_mas_bajo
FROM productos;

------------------------------------------------------------
-- 3. Usando GROUP BY con funciones de agregación
------------------------------------------------------------

-- Ejemplo: total de stock agrupado por categoría
-- Supongamos que la tabla productos tiene una columna categoria
SELECT categoria, SUM(stock) AS stock_por_categoria
FROM productos
GROUP BY categoria;

-- Ejemplo: promedio de precio por categoría
SELECT categoria, AVG(precio) AS promedio_precio
FROM productos
GROUP BY categoria;

------------------------------------------------------------
-- 4. Usando HAVING para filtrar los grupos
------------------------------------------------------------

-- Ejemplo: mostrar solo las categorías con más de 100 unidades en total
SELECT categoria, SUM(stock) AS total_stock
FROM productos
GROUP BY categoria
HAVING total_stock > 100;

------------------------------------------------------------
-- 5. Notas importantes
------------------------------------------------------------

-- Las funciones de agregación ignoran los valores NULL.
-- COUNT(*) cuenta todas las filas, incluso si hay NULLs.
-- COUNT(columna) cuenta solo las filas donde columna no es NULL.
-- HAVING se usa después de GROUP BY para filtrar los resultados agregados.
-- WHERE se usa antes de agrupar para filtrar filas individuales.

-- FIN DE CLASE X
counnt, sum,min y max, averge
