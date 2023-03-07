SELECT 
	c.cancao AS 'cancao',
	COUNT(h.cancao_id) AS 'reproducoes'
	FROM cancoes as c
		INNER JOIN
    historico AS h on  c.id_cancao = h.cancao_id 
	GROUP BY c.cancao
	ORDER BY reproducoes DESC, c.cancao
	LIMIT 2;