select first_name, last_name, salary from employees;
select * from products where category = 'Electronics';
select * from customers where city = 'Mumbai';
select * from orders where status = 'Delivered';


select first_name, last_name, salary from employees where salary > 90000 order by salary desc;
select * from products where price between 1000 and 10000 order by price asc;
select full_name, city, joined_date from customers where joined_date >= '2023-01-01';
select product_name, category, price from products order by price desc limit 5;


select first_name, last_name, hire_date, salary from employees where hire_date between '2018-01-01' and '2020-12-31' and salary>80000 order by hire_date;
select * from orders where total_amount>10000 and (status = 'pending' or status = 'shipped') order by total_amount desc;