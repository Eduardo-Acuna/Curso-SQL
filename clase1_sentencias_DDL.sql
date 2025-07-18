-- CLASE 1: SENTENCIAS DDL (Data Definition Language)
-- Compatible con PostgreSQL y MySQL

-- DDL se usa para definir, modificar o eliminar estructuras de la base de datos: tablas, vistas, índices, etc.

------------------------------------------------------------
-- 1. CREATE (Crear estructuras)
------------------------------------------------------------
-- Crear una tabla
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_ingreso DATE
);

-- Crear una base de datos
-- En MySQL
CREATE DATABASE mi_empresa;
-- En PostgreSQL (requiere conexión con superusuario)
CREATE DATABASE mi_empresa;

-- Crear una vista
CREATE VIEW empleados_activos AS
SELECT id, nombre FROM empleados WHERE salario > 0;

------------------------------------------------------------
-- 2. ALTER (Modificar estructuras)
------------------------------------------------------------
-- Agregar una columna
ALTER TABLE empleados ADD COLUMN edad INT;

-- Modificar tipo de dato (sintaxis varía entre motores)
-- En MySQL:
ALTER TABLE empleados MODIFY COLUMN nombre VARCHAR(150);
-- En PostgreSQL:
ALTER TABLE empleados ALTER COLUMN nombre TYPE VARCHAR(150);

-- Cambiar nombre de una tabla
ALTER TABLE empleados RENAME TO trabajadores;

-- Cambiar nombre de una columna
-- MySQL:
ALTER TABLE trabajadores CHANGE edad edad_actual INT;
-- PostgreSQL:
ALTER TABLE trabajadores RENAME COLUMN edad TO edad_actual;

------------------------------------------------------------
-- 3. DROP (Eliminar estructuras)
------------------------------------------------------------
-- Eliminar una tabla
DROP TABLE IF EXISTS trabajadores;

-- Eliminar una base de datos
DROP DATABASE IF EXISTS mi_empresa;

-- Eliminar una vista
DROP VIEW IF EXISTS empleados_activos;

------------------------------------------------------------
-- 4. TRUNCATE (Eliminar datos, pero mantiene la estructura)
------------------------------------------------------------
-- Vaciar una tabla rápidamente
TRUNCATE TABLE empleados; -- En ambos motores

------------------------------------------------------------
-- NOTAS IMPORTANTES:
-- - TRUNCATE es más rápido que DELETE, pero no se puede deshacer (no usa WHERE).
-- - DROP elimina completamente el objeto.
-- - ALTER es útil para modificar estructuras sin perder datos.
-- - CREATE define objetos nuevos.

-- FIN DE CLASE 1