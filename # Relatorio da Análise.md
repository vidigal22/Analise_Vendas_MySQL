# Análise Online Sales Dataset

## Introdução
Este projeto tem como objetivo analisar os dados de vendas para extrair insights valiosos e identificar padrões de desempenho.

## Descrição dos Dados
A tabela de vendas contém as seguintes colunas:
- **Transaction id:** Identificação única da transação.
- **Date:** Data da transação.
- **Product Category:** Categoria do produto.
- **Product Name:** Nome do produto.
- **Units Sold:** Número de unidades vendidas.
- **Unit Price:** Preço por unidade.
- **Total Revenue:** Receita total da transação.
- **Region:** Região da venda.
- **Payment Method:** Método de pagamento utilizado.

## Análises Realizadas
### Desempenho de Vendas
- **Total de Custo e Vendas**
- **Vendas por Produto:** Avalia o desempenho de cada produto, seu custo total, sua receita total e seu lucro.
- **Vendas por Categoria:** Analisa as vendas de acordo com cada categoria de produto. 

### Análise Temporal
- **Valor Total:** Soma total das vendas em um determinado período.

### Desempenho Regional
- **Vendas por Região:** Analisa como as vendas variam entre diferentes regiões.

### Análise de Produtos
- Produto mais caro
- Produto mais barato

### Unidades Vendidas
- **Volume de Vendas:** Analisa o número total de unidades vendidas
1. Categorias e numero de itens nela.
2. Quantidade de cada produto vendido no mes.
3. Produtos mais vendidos, nome e total vendido.
4. Produtos menos vendidos, nome e total vendido.

### Métodos de Pagamento
- O metodo de pagamento mais utilizado
- Valor total pago em cada meio de pagamento

### Desempenho Financeiro
- Media de preço de cada categoria
- Media total de todas as vendas: R$ 365,15
- Margem de Lucro total: R$ 21.240,71
- Megem de lucro de cada produto

### Análise de Transações
- Número de Transações: 181
- Quantidade de produtos vendidos nos 6 mes: 412 itens

---

## Conclusões e Recomendações
### Conclusões
- **Desempenho Geral:** Custo_total: R$ 44.851,96 / Receita_total: R$66.092,67 / Lucro: R$21.240,71 / Margem_Lucro: 32,14% 
- **Categorias de Destaque:** As categorias 'Eletrônicos' e 'Eletrodomésticos' foram as mais lucrativas.
- **Produtos Mais Vendidos:** Yeti Rambler Tumbler, Spalding NBA Street Basketball, Gap Essential Crewneck T-Shirt, Hanes ComfortSoft T-Shirt

### Recomendações
- **Foco em Promoções:** Intensificar promoções e marketing para os produtos das categorias mais vendidas.
- **Expansão Regional:** Investir em regiões com desempenho inferior, mas com potencial de crescimento.
- **Métodos de Pagamento:** Oferecer incentivos para métodos de pagamento mais utilizados para aumentar a fidelidade do cliente, como mais parcelamento copm menos ou sem juros.

## Apêndices
### Código Fonte
- **Consultas SQL:**
  - Total de Vendas por Categoria:
    ```sql
    select 
        `Product Category`, 
        round(sum(`Unit Price`),2) AS custo_total,
        round(sum(`Total Revenue`),2) AS venda_total, 
        round(sum(`Total Revenue`) - sum(`Unit Price`),2) AS lucro
    from 
        osd
    group by 
        `Product Category`
    order by 
        lucro;
    ```
  - Vendas Mensais:
    ```sql
    select
	    month(`Date`) as mes,
        round(sum(`Total Revenue`),2) tot_mes
    from
	    osd
    group by
	    mes
    order by
	    tot_mes desc;
    ```
  - Produtos Mais Vendidos:
    ```sql
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
    ```

### Referências
- Documentação do __kaggle__: [![Kaggle](https://img.shields.io/badge/Kaggle-20BEFF?style=for-the-badge&logo=Kaggle&logoColor=white)](https://www.kaggle.com/datasets/shreyanshverma27/online-sales-dataset-popular-marketplace-data)
- Ferramenta Utilizada: MySQL

## Contato
Para mais informações, entre em contato através 

e-mail: vinicius.b.vidigal@gmail.com

Whathsapp: (24) 97404-7427
