-- comence desde el video 32

-- IS NULL Me tra el campo categoria_id cuando esta vacia o cuando dice null
SELECT *
FROM posts
WHERE categoria_id IS NULL;


-- IS NOT NULL me trae los campos que si esten llenos y que no tengan el valor null
SELECT *
FROM posts
WHERE categoria_id IS NOT NULL;


-- Aqui me va filtrando los posts que la columna categoria_id este llena y no vacia y ademas que solo esten activos.
SELECT *
FROM posts
WHERE categoria_id IS NOT NULL
    AND estatus = 'activo'
    AND id < 50
    AND usuarios_id = 2
    AND YEAR(fecha_de_publicacion) = '2025'
;