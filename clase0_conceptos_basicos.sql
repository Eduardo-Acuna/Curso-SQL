-- CLASE 0: CONCEPTOS BÁSICOS DE BASES DE DATOS
-- Introducción teórica a los elementos fundamentales de una base de datos relacional

------------------------------------------------------------
-- 1. ¿Qué es una base de datos?
------------------------------------------------------------
-- Una base de datos es un conjunto organizado de datos que se almacenan y acceden electrónicamente.
-- Se utiliza para almacenar, consultar y administrar información de manera eficiente.

------------------------------------------------------------
-- 2. Conceptos principales
------------------------------------------------------------

-- ENTIDAD:
-- Es un objeto del mundo real que puede tener existencia propia (persona, producto, curso, etc.)
-- Ejemplo: Empleado, Cliente, Producto

-- ATRIBUTOS:
-- Son las propiedades o características de una entidad.
-- Ejemplo: nombre, edad, salario, fecha_nacimiento

-- TIPOS DE ATRIBUTOS:
-- a) Simples o atómicos: no se pueden dividir más (nombre, salario)
-- b) Compuestos: se pueden dividir (dirección = calle + número + ciudad)
-- c) Derivados: calculados a partir de otros (edad a partir de fecha_nacimiento)

-- CLAVE PRIMARIA (PRIMARY KEY):
-- Atributo (o conjunto) que identifica de forma única a cada fila en una tabla.
-- Ejemplo: id_empleado

-- CLAVE FORÁNEA (FOREIGN KEY):
-- Atributo que hace referencia a la clave primaria de otra tabla.
-- Sirve para establecer relaciones entre tablas.

-- DOMINIO:
-- Conjunto de valores válidos para un atributo.
-- Ejemplo: el atributo "edad" puede tener valores del 0 al 120

-- CARDINALIDAD:
-- Define la cantidad de relaciones entre entidades.
-- Tipos:
--  - Uno a Uno (1:1)
--  - Uno a Muchos (1:N)
--  - Muchos a Muchos (N:M)

------------------------------------------------------------
-- 3. Tipos de datos comunes (MySQL y PostgreSQL)
------------------------------------------------------------
-- NUMÉRICOS: INT, BIGINT, DECIMAL, FLOAT
-- TEXTO: VARCHAR(n), TEXT
-- FECHAS: DATE, TIME, DATETIME, TIMESTAMP
-- BOOLEANOS: BOOLEAN (TRUE/FALSE)

------------------------------------------------------------
-- 4. Etapas: creación y manipulación
------------------------------------------------------------
-- a) CREACIÓN: Se usan sentencias DDL (CREATE, ALTER, DROP)
-- b) MANIPULACIÓN: Se usan sentencias DML (INSERT, SELECT, UPDATE, DELETE)

-- Ejemplo de creación:
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    salario DECIMAL(10,2)
);

-- Ejemplo de manipulación:
INSERT INTO empleados (id, nombre, salario) VALUES (1, 'Laura', 3500000.00);
SELECT * FROM empleados;

------------------------------------------------------------
--CREACIÓN DE BASES DE DATOS, USUARIOS, PRIVILEGIOS Y ROLES
------------------------------------------------------------
-- Compatible con MySQL y PostgreSQL

------------------------------------------------------------
-- 1. CREAR UNA BASE DE DATOS
------------------------------------------------------------
-- MySQL y PostgreSQL (idéntico):
CREATE DATABASE empresa_db;

-- Seleccionar la base de datos para trabajar (solo MySQL):
USE empresa_db;


------------------------------------------------------------
-- 2. CREAR USUARIOS
------------------------------------------------------------
-- MySQL:
CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY 'claveSegura123';

-- PostgreSQL:
CREATE USER usuario_admin WITH PASSWORD 'claveSegura123';

------------------------------------------------------------
-- 3. OTORGAR PRIVILEGIOS
------------------------------------------------------------
-- Dar todos los permisos sobre la base de datos:
-- MySQL:
GRANT ALL PRIVILEGES ON empresa_db.* TO 'usuario_admin'@'localhost';

-- PostgreSQL:
GRANT ALL PRIVILEGES ON DATABASE empresa_db TO usuario_admin;

-- Otorgar permisos sobre una tabla específica (ya creada):
GRANT SELECT, INSERT, UPDATE ON empleados TO usuario_admin;

------------------------------------------------------------
-- 4. ¿QUÉ ES UN ROL?
------------------------------------------------------------
-- Un ROL es una colección de privilegios que se puede asignar a uno o más usuarios.
-- Facilita la administración de permisos cuando hay varios usuarios con las mismas funciones.
-- Ejemplo: rol 'editor' con permisos de lectura y escritura.

------------------------------------------------------------
-- 5. CREAR Y USAR ROLES (solo PostgreSQL)
------------------------------------------------------------
-- Crear un rol:
CREATE ROLE editor;

-- Otorgar permisos al rol:
GRANT SELECT, INSERT, UPDATE ON empleados TO editor;

-- Asignar el rol a un usuario:
GRANT editor TO usuario_admin;

-- Activar el rol manualmente en sesión:
SET ROLE editor;

------------------------------------------------------------
-- 6. VER PRIVILEGIOS
------------------------------------------------------------
-- MySQL:
SHOW GRANTS FOR 'usuario_admin'@'localhost';

-- PostgreSQL:
\du  -- En la consola psql, muestra roles y permisos

------------------------------------------------------------
-- 7. REVOCAR PERMISOS O ELIMINAR USUARIOS
------------------------------------------------------------
-- Revocar:
REVOKE INSERT ON empleados FROM usuario_admin;

-- Eliminar usuario:
-- MySQL:
DROP USER 'usuario_admin'@'localhost';
-- PostgreSQL:
DROP USER usuario_admin;

-- Eliminar rol (PostgreSQL):
DROP ROLE editor;



-- FIN DE CLASE 0
