SELECT 
	n.nome AS 'pessoa_usuaria',
	IF(YEAR(MAX(h.data_reproducao)) >= 2021,
        'Ativa',
        'Inativa') AS 'status_pessoa_usuaria'
	FROM user AS n
		INNER JOIN
        historico AS h on h.pessoas_usuarias_id = n.id
        GROUP BY n.nome
		ORDER BY n.nome;