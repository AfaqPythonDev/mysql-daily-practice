use practice_hub;

SELECT COUNT(*) AS total_employees FROM employees;
select max(salary) as highest_salary, min(salary) as lowest_salary, avg(salary) as avg_salary from employees;
select category, count(*) as All_products from products group by category;
select sum(total_amount) as Total_amount from orders where status = 'Delivered';


select dept_id, count(*) as total_employees, avg(salary) as avg_salary from employees group by dept_id order by avg_salary desc;
SELECT category, AVG(price) AS avg_price FROM products GROUP BY category HAVING AVG(price) > 5000;
select status, sum(total_amount) as Total_revenue, count(*) as no_of_orders from orders group by status;
select customer_id, count(*) as no_of_orders from orders group by customer_id order by no_of_orders desc limit 3;


SELECT dept_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary FROM employees GROUP BY dept_id HAVING COUNT(*) > 3 AND AVG(salary) > 75000;
SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id HAVING SUM(total_amount) > 50000 ORDER BY total_spent DESC;