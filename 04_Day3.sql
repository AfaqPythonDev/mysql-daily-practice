use practice_hub;

select e.first_name, e.last_name, d.dept_name from employees e inner join departments d on e.dept_id = d.dept_id;
select o.order_id, o.order_date, c.full_name, c.country from orders o inner join customers c on o.customer_id = c.customer_id;
select c.full_name, o.order_id from customers c left join orders o on c.customer_id = o.customer_id;
select oi.order_id, p.product_name, oi.quantity, oi.unit_price from order_items oi inner join products p on oi.product_id = p.product_id;
select b.first_name as employee_name, a.first_name as manager_name from employees a inner join employees b on a.emp_id = b.manager_id;
