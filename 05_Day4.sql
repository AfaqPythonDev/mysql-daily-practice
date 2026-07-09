use practice_hub;

select * from customers;
select full_name, country from customers where country = 'India' union select full_name, country from customers where country = 'USA';
select first_name as name_list from employees union all select product_name from products;

select o.order_id, c.full_name, sum(oi.quantity) as total_quantity
from orders o
join customers c on o.customer_id = c.customer_id
join order_items oi on o.order_id = oi.order_id
group by o.order_id, c.full_name;

select e.first_name, d.dept_name, d.location
from employees e
join departments d on e.dept_id = d.dept_id
where d.location = 'Bangalore';

select c.full_name, o.order_id
from customers c
join orders o on c.customer_id = o.customer_id
where o.status = 'Cancelled';