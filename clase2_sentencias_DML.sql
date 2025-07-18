-- CLASE 2: SENTENCIAS DML (Data Manipulation Language)
-- Compatible con PostgreSQL y MySQL

-- DML se utiliza para manipular los datos dentro de las estructuras creadas (como tablas).

------------------------------------------------------------
-- 1. INSERT (Insertar datos)
------------------------------------------------------------
-- Insertar una fila completa
INSERT INTO empleados (id, nombre, puesto, salario, fecha_ingreso)
VALUES (1, 'Carlos Gómez', 'Analista', 4500000.00, '2023-01-15');

-- Insertar múltiples filas
INSERT INTO empleados (id, nombre, puesto, salario, fecha_ingreso) VALUES
(2, 'Ana Ruiz', 'Diseñadora', 4000000.00, '2023-03-10'),
(3, 'Luis Fernández', 'Desarrollador', 5000000.00, '2022-12-01');

-- Insertar solo algunas columnas (las otras serán NULL si no son NOT NULL)
INSERT INTO empleados (id, nombre) VALUES (4, 'Marta López');

------------------------------------------------------------
-- 2. SELECT (Consultar datos)
------------------------------------------------------------
-- Seleccionar todos los datos
SELECT * FROM empleados;

-- Seleccionar columnas específicas
SELECT nombre, salario FROM empleados;

-- Con condiciones (filtro)
SELECT * FROM empleados WHERE salario > 4500000;

-- Ordenar resultados
SELECT * FROM empleados ORDER BY fecha_ingreso DESC;

-- Limitar resultados
-- MySQL:
SELECT * FROM empleados LIMIT 5;
-- PostgreSQL:
SELECT * FROM empleados LIMIT 5;

-- Alias y operaciones
SELECT nombre AS empleado, salario * 1.1 AS salario_actualizado FROM empleados;

------------------------------------------------------------
-- 3. UPDATE (Actualizar datos existentes)
------------------------------------------------------------
-- Actualizar una o varias columnas
UPDATE empleados
SET salario = salario + 500000
WHERE puesto = 'Desarrollador';

-- Cambiar nombre a un empleado
UPDATE empleados SET nombre = 'Carlos G. Gómez' WHERE id = 1;

------------------------------------------------------------
-- 4. DELETE (Eliminar datos)
------------------------------------------------------------
-- Eliminar registros específicos
DELETE FROM empleados WHERE salario < 3000000;

-- Eliminar todos los registros (sin eliminar la tabla)
DELETE FROM empleados;  -- Se puede usar TRUNCATE también

------------------------------------------------------------
-- NOTAS IMPORTANTES:
-- - INSERT agrega datos nuevos.
-- - SELECT es la consulta más usada y permite filtros, ordenamientos, funciones, joins, etc.
-- - UPDATE modifica datos ya existentes (usá WHERE para evitar afectar todos los registros).
-- - DELETE remueve datos, también con cuidado de usar WHERE.
-- - TRUNCATE (visto en DDL) borra todos los datos pero es más rápido que DELETE y no se puede deshacer.

-- FIN DE CLASE 2