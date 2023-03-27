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

drop table members
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

 --Q6: which item was purchased first by a customer after they became a member.

with cte as(
select m.product_name,s.order_date,s.customer_id,v.join_date,dense_rank() over(partition by s.customer_id order by order_date) as rn 
from menu m join sales s on s.product_id = m.product_id join members v on v.customer_id=s.customer_id 
where order_date>=join_date )
select customer_id,product_name from cte where rn=1

--Q7: which item was purchased just before customer became a member.
with cte as(
select m.product_name,s.order_date,s.customer_id,v.join_date,dense_rank() over(partition by s.customer_id order by order_date desc) as rn 
from menu m join sales s on s.product_id = m.product_id join members v on v.customer_id=s.customer_id 
where order_date<join_date )
select customer_id,product_name from cte where rn=1

--Q8: what is the total items and amount spent by a customer before he became a member.

select s.customer_id, count(s.product_id)as no_of_items_purchased_after_became_member, sum(m.price) as total_amount_spent from menu m 
join 
sales s on s.product_id = m.product_id 
join 
members v on v.customer_id=s.customer_id where order_date<join_date group by s.customer_id

--Q9: if each $1 spent equates 10 points and shushi has a 2x points multipler. how many points would each customer have?
select s.customer_id,
sum(case 
	when product_name='shushi' then 20*price 
	else 10*price end) as points from sales s
join menu m on m.product_id = s.product_id group by customer_id 

--Q10: in a first week after customer joins the program(including their join date) they earn 2x points on all items,
-- not just sushi, how many points do custome A and B have at the end of january?

 
---join all tables and observing the result and from which we can understand easily.
with cte as (select customer_id,product_name,order_date,price
 from menu join 
sales on sales.product_id = menu.product_id) 
select * from cte where customer_id in (select customer_id from members)order by order_date,customer_id,product_name

select * from sales 
select * from menu
select * from members