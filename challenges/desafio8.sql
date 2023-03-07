SELECT 
	n.nome AS 'artista',
    ab.album AS 'album'
FROM
	artista AS n
		INNER JOIN
	albuns AS ab ON ab.artist_id = n.artista_id
WHERE 
	n.nome = 'Elis Regina'
GROUP BY ab.album
ORDER BY ab.album;