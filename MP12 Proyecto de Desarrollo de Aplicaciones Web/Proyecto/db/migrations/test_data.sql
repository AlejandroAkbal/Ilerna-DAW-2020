-- Bases de datos --
USE MP12;

-- Operaciones usuarios --
SELECT
    *
FROM
    usuarios;

-- Operaciones recetas --
SELECT
    *
FROM
    recetas;

SELECT
    *
FROM
    recetas
WHERE
    autor = 1;

-- Operaciones ingredientes --
SELECT
    *
FROM
    ingredientes;

-- Operaciones ingrediente_de_receta --
SELECT
    *
FROM
    ingrediente_de_receta;

-- Todas las recetas y sus ingredientes
SELECT
    -- recetas.id as R_ID,
    recetas.nombre as R_Nombre,
    -- ingrediente_de_receta.receta as IDR_Receta,
    -- ingrediente_de_receta.ingrediente as IDR_Ingrediente,
    ingredientes.nombre as I_Nombre
FROM
    recetas
    INNER JOIN ingrediente_de_receta ON recetas.id = ingrediente_de_receta.receta
    INNER JOIN ingredientes ON ingrediente_de_receta.ingrediente = ingredientes.id;

-- Ingredientes de receta especifica
SELECT
    recetas.nombre as Receta,
    ingredientes.nombre as Ingrediente
FROM
    recetas
    INNER JOIN ingrediente_de_receta ON recetas.id = ingrediente_de_receta.receta
    INNER JOIN ingredientes ON ingrediente_de_receta.ingrediente = ingredientes.id
WHERE
    recetas.nombre = "Setas con tomate";