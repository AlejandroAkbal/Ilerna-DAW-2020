-- Bases de datos --

CREATE DATABASE M07;

USE M07;

-- Tablas --

CREATE TABLE IF NOT EXISTS usuarios (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	contraseña VARCHAR(20) NOT NULL,
	email VARCHAR(20) UNIQUE,
	edad INT(3) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	codigo_postal INT(6) NOT NULL,
	provincia VARCHAR(30) NOT NULL,
	genero VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS noticias (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(60) NOT NULL UNIQUE,
	contenido VARCHAR(300) NOT NULL,
	autor VARCHAR(20) NOT NULL,
	hora_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	likes INT NOT NULL DEFAULT 0
);


-- Datos --

INSERT INTO usuarios(nombre, contraseña, edad, fecha_nacimiento, direccion, codigo_postal, provincia, genero) VALUES (
	'Juan', 'password', 20, '2000-09-12', 'Las gambas, 5, Teruel', 69420, 'Teruel', 'macho'
)

INSERT INTO usuarios(nombre, contraseña, edad, fecha_nacimiento, direccion, codigo_postal, provincia, genero) VALUES (
	'Juan y medio', 'password', 20, '2000-09-10', 'Las gambas, 7, Teruel', 69423, 'Teruel', 'macho'
)

INSERT INTO usuarios(nombre, contraseña, edad, fecha_nacimiento, direccion, codigo_postal, provincia, genero) VALUES (
	'Juan y dos cuartos', 'password', 20, '2000-09-11', 'Las gambas, 15, Teruel', 69421, 'Teruel', 'hembra'
)

INSERT INTO noticias(titulo, contenido, autor, likes) VALUES (
	'Como comer gambas al ajillo', 'Pues muy buena pregunta mi compadre', 'Juan', 5
)

INSERT INTO noticias(titulo, contenido, autor, likes) VALUES (
	'Como comer gambas al ajillo 2: especial navidad', 'Pues muy buena pregunta mi compadre', 'Juan y medio', 7
)

INSERT INTO noticias(titulo, contenido, autor, likes) VALUES (
	'Como comer gambas al ajillo 3: especial halloween', 'Pues muy buena pregunta mi compadre', 'Juan y dos cuartos', 3
)