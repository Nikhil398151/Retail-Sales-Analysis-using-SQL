-- Reatail sales Analysis

use project_with_learning;

create table retail_sales (
	transactions_id	int primary key ,
	sale_date date ,
	sale_time time ,
	customer_id int,
	gender varchar(15),
	age int,
	category varchar(50),
	quantiy int,
	price_per_unit float ,
	cogs float,
	total_sale float 	
);
-- Data cleaning 
select *from retail_sales
limit 10;

select count(*) as total_sales from retail_sales;


select *from retail_sales 
where 
transactions_id is null 
or 
sale_date is null 
or 
sale_time is null 
or
age is null
or 
customer_id is null
or 
gender is null
or 
category is null 
or 
quantiy is null 
or 
price_per_unit is null 
or 
cogs is null 
or 
total_sale is null  ;

delete from retail_sales
where 
transactions_id is null 
or 
sale_date is null 
or 
sale_time is null 
or
age is null
or 
customer_id is null
or 
gender is null
or 
category is null 
or 
quantiy is null 
or 
price_per_unit is null 
or 
cogs is null 
or 
total_sale is null  ;


select count(*) from retail_sales;

-- Data exploration 


--  how many sales we have ?
select count(*) as total_sales from  retail_sales;

-- How many customers we have 
select count( distinct customer_id) as total_sale from retail_sales;

-- How many category we have?
select distinct category from retail_sales;




-- Data analysis & Business key problems & ans's

-- my analysis & finfings 
-- Q1. Write a SQL Query to retrieve the all columns for sales made on '2022-11-05' 
-- Q2. Write a Sql Query to retrive all the transactions where the category is 'Clothing' and quantity sold is more than 10 in the month if nov-2022 
-- Q3. write a SQl query to calculate the total sales (Total_sales) for each category 
-- Q4. Write a SQL Query to find the average age of customer who purchesed items from the 'Beauty' category
-- Q5. wwite a SQl query to find all transaction where the total_Sale is greter than 1000.
-- Q6. Write a SQL query to find the total number of transactions made by each gender in each category 
-- Q7. write a sql query to calculate the average sale for each month. find out best selling month in each year 
-- Q8. write sql query to find the top 5 Scustomer based on the highest total sales 





-- Q1. Write a SQL Query to retrieve the all columns for sales made on '2022-11-05'

select *from retail_sales;

select *
from retail_sales
where sale_date = '2022-11-05';


-- Q2. Write a Sql Query to retrive all the transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month if nov-2022
 

select *
from retail_sales 
where category = 'Clothing';

select *
from retail_sales 
where category  = 'Clothing'
	and quantiy >=4
	and sale_date >= '2022-11-01'
	and sale_date <='2022-11-30';

-- Q3. write a SQl query to calculate the total sales (Total_sales) for each category 

select 
category,
sum(total_sale)as net_sale,
count(*) as total_orders
from retail_sales 
group by 1


-- Q4. Write a SQL Query to find the average age of customer who purchesed items from the 'Beauty' category

select 
round(avg(age),2) as avg_age
from retail_sales
where category = 'Beauty';

-- Q5. wwite a SQl query to find all transaction where the total_Sale is greter than 1000.

select * from retail_sales 
where total_sale > 1000;

-- Q6. Write a SQL query to find the total number of transactions made by each gender in each category 

select 
category ,
gender,
count(*) as total_trans
from retail_sales
group by category,
gender
order by 1

-- Q7. write a sql query to calculate the average sale for each month. find out best selling month in each year.
select * from (
select 
	extract(year from sale_date) as year,
	extract(month from sale_date) as month,
	avg(total_sale) as avg_total_sale,
	rank() over(partition by extract(year from sale_date)order by avg(total_sale) desc ) as a
from retail_sales 
group by 1,2
) as t1
where a = 1 ;
-- order by 1,3 desc


-- Q8. write sql query to find the top 5 customer based on the highest total sales 

select 
customer_id,
sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5


-- Q9 write a sql Quey to find the number of unique customers who purchesed item from each category 

select 
	category,
	count( distinct customer_id) 
	from retail_sales 
	group by category;


-- Q10. write a sql query to create each shift and number of orders (example morning <=12, afternoon between 12 & 17 , EVENING >17)

with hourly_sale
as (
select *,
	case 
		when extract(hour from sale_time) < 12 then 'Morning' 
		when extract(hour from sale_time ) between  12 and 17 then 'Afternoon' 
		else 'Evening'
	end as shift 
from retail_sales
)
select 
shift,
count(*) as total_orders
from hourly_sale
group by shift;


# END OF THE PROJECT 
 

