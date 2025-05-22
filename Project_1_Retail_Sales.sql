show databases;
use project_1;
create table retail_sales
( 
transactions_id int primary key,	
sale_date date,
sale_time time,
customer_id int,
gender varchar(50),
age int,
category varchar(50),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
)
select*from retail_Sales;
select count(*)from retail_sales;
select count(*)from retail_sales where transactions_id is null;

select count(*)from retail_sales where customer_id is null
or 
age is null
or 
total_Sale is null
or
quantiy is null
or 
cogs is null;

select count(transactions_id) from retail_sales;
select sum(total_sale) from retail_sales;

describe retail_sales;
select sale_date from retail_sales where sale_date is null;
select count(distinct customer_id) from retail_sales;

select distinct category from retail_sales;

select*from retail_Sales;

select*from retail_sales where sale_date = '2022-09-03' and transactions_id>1000;

select*from retail_sales where category = 'Clothing' and (quantiy >3);

select*from retail_sales where sale_Date >= '2022-09-01' and sale_date <= '2022-09-30' and category = 'Clothing' and quantiy >3 and total_sale > 1000;
select category,total_Sale from retail_sales;
select category,total_sale from retail_sales 
group by category and total_sale;
select category, sum(total_Sale) as net_sale, count(quantiy) from retail_sales group by category;


select*from retail_sales where category = 'Beauty';
select avg(age) from retail_Sales where category = 'Beauty';
select*from retail_Sales where total_Sale>1000;

select category, gender, count(transactions_id) from retail_sales
group by gender, category;
select*from retail_Sales;


select* from(
select 
extract(year from sale_Date) as years,
extract(month from sale_date) as months,
avg(total_sale) as averages,
rank() over(order by avg(total_sale) desc) as sale_rank
from retail_sales 
group by 1,2 
) as t1 
where sale_rank <3 order by sale_rank
limit 2; 

select customer_id, sum(total_sale) as ranking from retail_sales 
group by customer_id order by sum(total_sale)  desc 
limit 5;

select* from retail_Sale;
select Customer_id, count(category) from retail_sales
group by 1 order by count(category) desc;

select category, 
 count(distinct customer_id) as unique_customer from retail_sales 
group by 1;

with hourly_sales 
as 
(
select * ,
	case 
		when extract(hour from sale_time) <12  then 'Morning'  
		when extract(hour from sale_time) between 12 and 17 then 'Afternoon' 
		else 'Evening'
	end as Shift 
from retail_sales)
select 
shift, 
count(*) as total_orders
from hourly_sales
group by shift


