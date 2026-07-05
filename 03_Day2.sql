use practice_hub;
select dept_id, count(*) as employee_count from employees group by dept_id;
select customer_id, count(*) as orders_placed, sum(total_amount) as total_amount from orders group by customer_id;
select category, avg(price) as avg_price from products group by category having avg_price > 1000;
select product_id, sum(quantity) as total_sold from order_items group by product_id order by total_sold desc;
select dept_id, count(*) as total_employees from employees group by dept_id having total_employees > 3;
