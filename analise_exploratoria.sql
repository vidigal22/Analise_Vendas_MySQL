##Desempenho de vendas
-- Total de Vendas: Calcular o total de receita gerada
select
	round(sum(`Total Revenue`),2)
from
	osd; # R$66092,67

-- Vendas por Produto: Avaliar o desempenho de cada produto 
select
	`Product Name`,
    sum(`Unit Price`) custo_total,
    sum(`Total Revenue`) venda_total,
	sum(`Total Revenue`) - sum(`Unit Price`) lucro
from
	osd
group by
	`Product Name`
order by
	lucro;
    
-- Vendas por Categoria: Analisar as vendas de acordo com cada categoria de produto 
select
	`Product Category`,
    round(sum(`Unit Price`),2) custo_total,
	round(sum(`Total Revenue`),2) venda_total,
	round(sum(`Total Revenue`) - sum(`Unit Price`),2) lucro
from
	osd
group by
	`Product Category`
order by
	lucro;
-- -----------------------------------------------------------------------------------------------------------------
## Análise Temporal
-- Valor Total: Soma total das vendas em um determinado período
# mensal
select
	month(`Date`) as mes,
    round(sum(`Total Revenue`),2) tot_mes
from
	osd
group by
	mes
order by
	tot_mes desc;

# total somado dos 6 meses
select
	round(sum(`Total Revenue`),2)
from
	osd;
-- -----------------------------------------------------------------------------------------------------------------
##Desempenho Regional
-- Vendas por Região: Analisar como as vendas variam entre diferentes regiões
select
	region,
    sum(`Units Sold`) produtos_regio,
    round(sum(`Total Revenue`),2) tot_vendido
from 
	osd
group by
	region
order by
	tot_vendido desc;
-- -----------------------------------------------------------------------------------------------------------------
##Análise de Produtos
-- Produto mais caro
select 
	`Product Category`,
    `Product Name`,
    `Total Revenue` 
from 
	osd 
where
	`Total Revenue` = (select max(`Total Revenue`) from osd);

-- Produto mais barato 
select 
	`Product Category`,
    `Product Name`,
    `Total Revenue`
from 
	osd 
where 
	`Total Revenue` = (select min(`Total Revenue`) from osd);
-- -----------------------------------------------------------------------------------------------------------------
##Unidades Vendidas
-- Volume de Vendas: Analisar o número total de unidades vendidas
# Quantidade total de itens vendidos.
# temos 6 produtos eletronics com 31 itens e o resto com 30
# Electronics = Eletronicos, Home Appliances = Eletrodomésticos, Books = livros, Beauty Products = Produtos de beleza, Sports = esportes
select `Product Category`, count(`Product Name`) from osd
group by `Product Category`
order by count(*) desc;

-- quantidade de cada produto vendido no mes
select 
	`Product Category`,
	`Product Name`,
    MONTH(`Date`) AS mes ,
    sum(`Units Sold`) as quantidade_vendida  
from 
	osd
group by
	`Product Category`,
	`Product Name`,
    mes
order by
	mes;

-- Produto mais vendido 
# nome dos produtos q foram vendidos 5 ou mais vezes    
select 
	`Product Category`,
	`Product Name`,
    MONTH(`Date`) AS mes ,
    sum(`Units Sold`) as quantidade_vendida  
from 
	osd
where 
	`Units Sold` >=5
group by
	`Product Category`,
	`Product Name`,
    mes
order by
	quantidade_vendida;
    
# total de produtos q so foram vendidos 5 ou mais vezes 
select 
    count(`Units Sold`) as quantidade_vendida  
from 
	osd
where 
	`Units Sold` >=5;

-- Produto menos vendido 
# nome dos produtos q so foram vendidos 1 vez    
select 
	`Product Category`,
	`Product Name`,
    MONTH(`Date`) AS mes ,
    sum(`Units Sold`) as quantidade_vendida  
from 
	osd
where 
	`Units Sold` = '1'
group by
	`Product Category`,
	`Product Name`,
    mes
order by
	mes;

# total de produtos vendidos so 1 vez
select
	count(`Units Sold`)
from
	osd
where
	`Units Sold` = '1';

-- Media de preço de cada categoria
select
	`Product Category`,
    round(avg(`Unit Price`),2) as media_custo,
    round(avg(`Total Revenue`),2) as media_venda
from 
	osd
group by
	`Product Category`;
-- -----------------------------------------------------------------------------------------------------------------
##Métodos de Pagamento
-- O metodo de pagamento mais utilizado 
select 
	`Payment Method`,
    count(*)
from 
	osd
group by
	`Payment Method`
order by
	count(*) desc;

-- Valor total pago em cada meio de pagamento
select
	`Payment Method`,
    round(sum(`Total Revenue`),2) valor_total
from
	osd
group by
	`Payment Method`
order by
	valor_total desc;
    
-- -----------------------------------------------------------------------------------------------------------------
##Desempenho Financeiro
-- Media de preço de cada categoria
select
	`Product Category`,
    round(avg(`Unit Price`),2) as media_custo,
    round(avg(`Total Revenue`),2) as media_venda
from 
	osd
group by
	`Product Category`;
    
-- Media total de todas as vendas  	
select
    round(avg(`Total Revenue`),2) as media_venda
from 
	osd;

-- Margem de Lucro total
select 
	round(sum(`Unit Price`),2) as `custo_total`,
    round(sum(`Total Revenue`),2) as `receita_total`,
	round(sum(`Total Revenue`) - sum(`Unit Price`),2) as `lucro`,
    round(100 *(sum(`Total Revenue`) - sum(`Unit Price`)) / sum(`Total Revenue`),2) as margem_lucro
from 
	osd;

-- Megem de lucro de cada produto
select
	`Product Name`,
    round(sum(`Unit Price`),2) custo_total,
    round(sum(`Total Revenue`),2) venda_total,
	round(sum(`Total Revenue`) - sum(`Unit Price`),2) lucro,
    round(100 *(sum(`Total Revenue`) - sum(`Unit Price`)) / sum(`Total Revenue`),2) as margem_lucro
from
	osd
group by
	`Product Name`
order by
	margem_lucro;

-- -----------------------------------------------------------------------------------------------------------------
##Análise de Transações
-- Número de Transações
select
	count(`Transaction ID`)
from
	osd;

-- Quantidade de produtos vendidos nos 6 mes
select 
    sum(`Units Sold`) as quantidade_vendida  
from 
	osd;
