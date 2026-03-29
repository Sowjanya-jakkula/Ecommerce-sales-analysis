create database sales_project;
use sales_project;

select * from cleaned_sales_data;
select count(*) from cleaned_sales_data;

#Total Sales
select sum(sales) as total_sales from cleaned_sales_data;

#Region-wise Sales
select region,sum(sales) as total_sales
from cleaned_sales_data
group by region;

#Category-wise Profit
select category,sum(profit) as total_profit
from cleaned_sales_data
group by category 
order by total_profit desc;

#Top 5 Products
select product_name,sum(sales) as total_sales
from cleaned_sales_data
group by product_name
order by total_sales desc
limit 5;

#Top 5 Products by Profit
select product_name,sum(profit) as total_profit
from cleaned_sales_data
group by product_name
order by total_profit desc
limit 5;

#Monthly Sales Trend
select year,month,sum(sales) as total_sales
from cleaned_sales_data
group by  year,month
order by year,month;

#Top Performing Region
select region,sum(sales) as total_sales
from cleaned_sales_data
group by region 
order by total_sales desc
limit 1;

#Profit Margin
select category,
sum(profit)/sum(sales)*100 as profit_margin
from cleaned_sales_data
group by category ;

#High Profit Orders
select * from cleaned_sales_data
where profit > 500;

select count(*) from cleaned_sales_data
where profit > 500;

#Category Ranking
select category,sum(sales) as total_sales,
rank()over(order by sum(sales) desc) as rank_position
from cleaned_sales_data
group by category;