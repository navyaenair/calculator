CREATE DATABASE PRACTICE_NAVYA;
USE PRACTICE_NAVYA;

CREATE TABLE customers(cust_id int primary key,
cust_name varchar(20),city varchar(30),
join_date DATE);

SELECT * FROM customers;


create table products(prod_id int primary key,
prod_name varchar(30),category varchar (30),
price decimal(10,2));

create table orders(
order_id int primary key,
cust_id int,
prod_id int,
order_date date,
quantity int check(quantity>0),
foreign key (cust_id) references customers(cust_id),
foreign key (prod_id) references products (prod_id));

select * from orders;



-- Insert Customers
INSERT INTO customers (cust_id,cust_name, city, join_date) VALUES
(1,'Alice', 'New York', '2022-01-15'),
(2,'Bob', 'London', '2022-02-10'),
(3,'Charlie', 'Paris', '2022-03-05'),
(4,'Diana', 'Berlin', '2022-03-20'),
(5,'Ethan', 'Rome', '2022-04-01');

select * from customers;

-- Insert Products
INSERT INTO products (prod_id,prod_name, category, price) VALUES
(1,'Laptop', 'Electronics', 900.00),
(2,'Phone', 'Electronics', 600.00),
(3,'Book', 'Stationery', 20.00),
(4,'Table', 'Furniture', 150.00),
(5,'Chair', 'Furniture', 80.00);
select * from products;

-- Insert Orders
INSERT INTO orders (order_id,cust_id, prod_id, order_date, quantity) VALUES
(1,1, 1, '2022-05-01', 1),
(2,1, 3, '2022-05-02', 2),
(3,2, 2, '2022-05-03', 1),
(4,3, 4, '2022-05-04', 1),
(5,3, 5, '2022-05-05', 4),
(6,4, 2, '2022-05-06', 2),
(7,5, 1, '2022-05-07', 1),
(8,5, 3, '2022-05-08', 5);


Update products set price = price * 1.10 where prod_id=1;
delete price from products where prod_id=1;
Update products set price=900.00 where prod_id=1;
delete o from customers c left join orders o on c.cust_id=o.cust_id where order_date is null;
select * from orders;
select * from customers;
select * from products;



-- LIKE

select cust_name from customers where cust_name like "a%";
select category from products where category like  "%tron%";
select city from customers where city like "%n";


-- between

select prod_name from products where price between 100 and 700;

select  order_date from orders where order_date between '2022-05-01' and '2022-05-05';

select cust_name , join_date from customers where join_date between '2022-02-01' and '2022-03-31';

select price from products  order by price desc limit 3;
select order_id,order_date from orders order by order_date desc limit 2;
select cust_name from customers order by cust_name asc limit 2;


-- aggregate

select count(order_id) as total_number_orders from orders;
select prod_name ,avg(price) from products;
select max(quantity) as maximum_quantity,min(quantity) as min_quant from orders;
select  prod_name,count(category) from  products group by category;


select count(order_id)from orders group by cust_id;
select c.cust_name ,sum(o.quantity) from customers c join orders o on c.cust_id=o.cust_id group by c.cust_name;

select p.prod_name ,sum(o.quantity) from products p join orders o on p.prod_id = o.prod_id group by prod_name;
select p.prod_name,avg(p.price) from products p join orders o on p.prod_id =o.prod_id group by p.category;
select p.category,sum(o.quantity*p.price) from products p  join orders o on  p.prod_id = o.prod_id group by p.category;

SELECT c.cust_name, COUNT(o.order_id)
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id 
GROUP BY c.cust_name
HAVING COUNT(o.order_id) > 2;


select category,prod_name,avg(price) from products
group by category
having avg(price)>100;
