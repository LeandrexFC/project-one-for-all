SELECT 
	MIN(v.valor_plano) AS 'faturamento_minimo',
    MAX(v.valor_plano) AS 'faturamento_maximo',
    ROUND(AVG(v.valor_plano), 2) AS 'faturamento_medio',
    SUM(v.valor_plano) AS 'faturamento_total'
FROM 
	planos as v
		INNER JOIN
	user as u ON u.plano_assinado = v.plano_id;