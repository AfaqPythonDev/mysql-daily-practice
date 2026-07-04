use practice_hub;
select * from employees where salary > 60000;
select product_name, price from products where price  between 20 and 100 order by price desc;
select full_name, email from customers where country in ('USA', 'Canada');
select order_id, customer_id, order_date from orders order by order_date desc limit 5;
select first_name, last_name, hire_date from employees where hire_date > '2020-01-01' order by hire_date asc;