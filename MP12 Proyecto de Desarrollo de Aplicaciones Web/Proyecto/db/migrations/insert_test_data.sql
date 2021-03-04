-- Bases de datos --
USE MP12;

-- Operaciones usuarios --
INSERT INTO
    usuarios(nombre, contraseña, email)
VALUES
    ('Juan', 'hunter2', 'juan@example.com');

INSERT INTO
    usuarios(nombre, contraseña, email)
VALUES
    ('Rosa', 'hunter2', 'rosa@example.com');

INSERT INTO
    usuarios(nombre, contraseña, email)
VALUES
    (
        'Fernando',
        'hunter2',
        'fernando@example.com'
    );

-- Operaciones recetas --
INSERT INTO
    recetas(nombre, descripcion, instrucciones, autor)
VALUES
    (
        'Setas con tomate',
        'Ricas setas con sabor a tomate.',
        'Lavar y cortar setas, mezclar con tomate.',
        1
    );

INSERT INTO
    recetas(nombre, descripcion, instrucciones, autor)
VALUES
    (
        'Tomate con setas',
        'Rico tomate con sabor a setas.',
        'Lavar y cortar tomate, mezclar con setas.',
        2
    );

INSERT INTO
    recetas(nombre, descripcion, instrucciones, autor)
VALUES
    (
        'Champiñones con tomate',
        'Ricos champiñones con sabor a tomate.',
        'Lavar y cortar champiñones, mezclar con tomate.',
        3
    );

-- Operaciones ingredientes --
INSERT INTO
    ingredientes(nombre)
VALUES
    ('Seta');

INSERT INTO
    ingredientes(nombre)
VALUES
    ('Tomate');

INSERT INTO
    ingredientes(nombre)
VALUES
    ('Champiñon');

-- Operaciones ingrediente_de_receta --
INSERT INTO
    ingrediente_de_receta(receta, ingrediente)
VALUES
    (1, 1);

INSERT INTO
    ingrediente_de_receta(receta, ingrediente)
VALUES
    (1, 2);

INSERT INTO
    ingrediente_de_receta(receta, ingrediente)
VALUES
    (2, 2);

INSERT INTO
    ingrediente_de_receta(receta, ingrediente)
VALUES
    (2, 1);

INSERT INTO
    ingrediente_de_receta(receta, ingrediente)
VALUES
    (3, 3);

INSERT INTO
    ingrediente_de_receta(receta, ingrediente)
VALUES
    (3, 2);