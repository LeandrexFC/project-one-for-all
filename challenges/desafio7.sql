SELECT 
	a.nome AS 'artista',
    ab.album AS 'album',
    COUNT(ar.artista_id) AS 'pessoas_seguidoras'
FROM artista AS a
	INNER JOIN
    albuns AS ab ON a.artista_id = ab.artist_id
	INNER JOIN
    seguindo_artistas AS ar on ar.artista_id = a.artista_id
    GROUP BY a.nome , ab.album
	ORDER BY pessoas_seguidoras DESC , a.nome , ab.album;