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
select s.customer_id, sum(price) as total_amount_spent from menu m join sales s on m.product_id = s.product_id group by customer_id
order by total_amount_spent desc

--Q2: how many days has each customer visited the restaurent.
select customer_id,count(distinct(order_date)) no_of_days_visited from sales group by customer_id order by no_of_days_visited desc

--Q3: what was the first item from menu purchased by each customer.

with cte as (
select *, row_number() over(partition by customer_id order by order_date)as rnk from sales)
select customer_id, product_name from cte c join menu m on m.product_id = c.product_id where rnk=1 group by 
customer_id,product_name order by customer_id

--Q4: what is the most purchased item from menu and how many times was it purchased by all customers.
select m.product_name, count(m.product_name) as no_of_times_purchased from menu m join sales s on s.product_id=m.product_id
group by m.product_name order by no_of_times_purchased desc

-- Q5: which item was the most popular for each customer

with cte as (
select customer_id, product_name,count(s.product_id) as no_of_times, DENSE_RANK() over(partition by customer_id order by
count(s.product_id) desc) as rnk from menu m join sales s on s.product_id = m.product_id group by customer_id,product_name) 
select customer_id,product_name,no_of_times from cte where rnk=1

 