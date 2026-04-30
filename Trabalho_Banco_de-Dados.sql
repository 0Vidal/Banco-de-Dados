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
