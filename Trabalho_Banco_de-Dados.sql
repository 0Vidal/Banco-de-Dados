use sucos_vendas;

select TP.SABOR, INF.QUANTIDADE,
date_format(NF.DATA_VENDA, '%2016') as DATA_VENDA
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
group by TP.SABOR, INF.QUANTIDADE, DATA_VENDA;


use sucos_vendas;

select TP.SABOR, year(NF.DATA_VENDA) as ano, 
sum(INF.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)
order by QUANTIDADE desc;

SELECT 
    TP.SABOR, 
    SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL,
    CONCAT(ROUND((SUM(INF.QUANTIDADE) / (SELECT SUM(QUANTIDADE) 
                                         FROM itens_notas_fiscais INF2
                                         INNER JOIN notas_fiscais NF2 ON INF2.NUMERO = NF2.NUMERO
                                         WHERE YEAR(NF2.DATA_VENDA) = 2016)) * 100, 2), '%') AS PERCENTUAL
FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR
ORDER BY QUANTIDADE_TOTAL DESC;
