-- Bases de datos --
DROP DATABASE IF EXISTS MP12;

CREATE DATABASE MP12;

USE MP12;

-- Tablas --
-- usuarios
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	contraseña VARCHAR(20) NOT NULL,
	email VARCHAR(20) UNIQUE
);

-- recetas
DROP TABLE IF EXISTS recetas;

CREATE TABLE recetas (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(25) NOT NULL UNIQUE,
	descripcion VARCHAR(50) NOT NULL,
	instrucciones VARCHAR(300) NOT NULL,
	autor INT NOT NULL,
	fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	-- likes INT NOT NULL DEFAULT 0,
	CONSTRAINT fk_autor FOREIGN KEY(autor) REFERENCES usuarios(id)
);

-- ingredientes
DROP TABLE IF EXISTS ingredientes;

CREATE TABLE ingredientes (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE
);

-- ingrediente_de_receta
DROP TABLE IF EXISTS ingrediente_de_receta;

CREATE TABLE ingrediente_de_receta (
	receta INT NOT NULL,
	ingrediente INT NOT NULL,
	CONSTRAINT fk_recipe FOREIGN KEY(receta) REFERENCES recetas(id),
	CONSTRAINT fk_ingredient FOREIGN KEY(ingrediente) REFERENCES ingredientes(id)
);