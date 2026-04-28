use sucos_vendas;

select TP.SABOR, INF.QUANTIDADE,
date_format(NF.DATA_VENDA, '%Y') as DATA_VENDA
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO
group by TP.SABOR, INF.QUANTIDADE, DATA_VENDA;