use sucus_venda;	

#Seleceionando as tabelas desejadas e o ano
select TP.SABOR, INF.QUANTIDADE,
date_format(NF.DATA_VENDA, '%2016') as DATA_VENDA
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
group by TP.SABOR, INF.QUANTIDADE, DATA_VENDA;

#Quantidade total vendida no ano
select year(NF.DATA_VENDA) as ano, 
sum(INF.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by year(NF.DATA_VENDA)
order by QUANTIDADE desc;

#Mostra todos os sabores e ordena a quantidade em ordem decrescente
select TP.SABOR, year(NF.DATA_VENDA) as ano, 
sum(INF.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)
order by QUANTIDADE DESC;


select TP.SABOR, year(NF.DATA_VENDA) as ano, 
sum(INF.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by (SUM(QUANTIDADE) / ())) * 100
order by QUANTIDADE DESC;


SELECT 
    TP.SABOR,
    YEAR(NF.DATA_VENDA),
    SUM(INF.QUANTIDADE),
    SUM(INF.QUANTIDADE) * 100.0 /
        (SELECT SUM(INF.QUANTIDADE)
         FROM itens_notas_fiscais INF
         INNER JOIN notas_fiscais NF 
            ON NF.NUMERO = INF.NUMERO
         WHERE YEAR(NF.DATA_VENDA) = 2016
        )
FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF 
    ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;
