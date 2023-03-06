SELECT 
    COUNT(DISTINCT c.cancao) AS cancoes,
    COUNT(DISTINCT a.artista_id) AS artistas,
    COUNT(DISTINCT al.album_id) AS albuns
FROM
    cancoes AS c
        INNER JOIN
    artista AS a
        INNER JOIN
    albuns AS al;
