SELECT 
    n.nome AS 'pessoa_usuaria',
    COUNT(h.cancao_id) AS 'musicas_ouvidas',
    ROUND(SUM(c.duracao_cancao) / 60, 2) AS 'total_minutos'
FROM
    user AS n
        INNER JOIN
    historico AS h ON h.pessoas_usuarias_id = n.id
       INNER JOIN
    cancoes AS c ON c.id_cancao = h.cancao_id
GROUP BY n.nome
ORDER BY n.nome;