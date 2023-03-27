create database casestudy

use casestudy

CREATE TABLE sales (customer_id VARCHAR(1),order_date DATE, product_id int);

INSERT INTO sales values('A', '2021-01-01', 1),('A', '2021-01-01', 2),('A', '2021-01-07', 2),('A', '2021-01-10', 3),
  ('A', '2021-01-11', 3),('A', '2021-01-11', 3),('B', '2021-01-01', 2),('B', '2021-01-02', 2),('B', '2021-01-04', 1),
  ('B', '2021-01-11', 1),('B', '2021-01-16', 3),('B', '2021-02-01', 3),('C', '2021-01-01', 3),('C', '2021-01-01', 3),
  ('C', '2021-01-07', 3);
 
 select * from sales

 drop table sales

 CREATE TABLE menu (product_id int,product_name varchar(15),price int);

 drop table menu

INSERT INTO menu VALUES (1, 'sushi', 10),(2, 'curry', 15),(3, 'ramen', 12);

select * from menu

CREATE TABLE members (customer_id varchar(15), join_date date);

insert into members values ('A', '2021-01-07'),('B', '2021-01-09');

select * from menu
select * from sales
select * from members


--problems and solutions--
--Q1: what is the total amount spent by each customer at restaurent?
select customer_id, sum(price) as total_amount_spent from menu m inner join sales s on m.product_id = s.product_id group by customer_id order by 
total_amount_spent desc 



