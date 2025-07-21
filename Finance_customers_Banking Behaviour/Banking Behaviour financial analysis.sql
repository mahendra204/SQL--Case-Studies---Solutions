create database bank_Ind
use bank_Ind

-- Create the Customers table
create table customers ( cust_id int primary key, first_name varchar(10) not null, 
last_name varchar(10) not null, city varchar(20) not null, state varchar(5) not null)

drop table customers 

-- insert values into customers table
insert into customers values(1, 'John', 'Doe', 'New York', 'NY'),
(2, 'Jane', 'Doe', 'New York', 'NY'),
(3, 'Bob', 'Smith', 'San Francisco', 'CA'),
(4, 'Alice', 'Johnson', 'San Francisco', 'CA'),
(5, 'Michael', 'Lee', 'Los Angeles', 'CA'),
(6, 'Jennifer', 'Wang', 'Los Angeles', 'CA')

select * from customers

-- Create Branches table
create table Branches (
branch_id int primary key,
branch_name varchar(20) not null,
city varchar(20) not null, 
state varchar(20) not null)

-- insert values into Branches table
insert into Branches values(1, 'Main', 'New York', 'NY'),
(2, 'Downtown', 'San Francisco', 'CA'),
(3, 'West LA', 'Los Angeles', 'CA'),
(4, 'East LA', 'Los Angeles', 'CA'),
(5, 'Uptown', 'New York', 'NY'),
(6, 'Financial District', 'San Francisco', 'CA'),
(7, 'Midtown', 'New York', 'NY'),
(8, 'South Bay', 'San Francisco', 'CA'),
(9, 'Downtown', 'Los Angeles', 'CA'),
(10, 'Chinatown', 'New York', 'NY'),
(11, 'Marina', 'San Francisco', 'CA'),
(12, 'Beverly Hills', 'Los Angeles', 'CA'),
(13, 'Brooklyn', 'New York', 'NY'),
(14, 'North Beach', 'San Francisco', 'CA'),
(15, 'Pasadena', 'Los Angeles', 'CA');

select * from Branches
drop table Branches

-- Create the Accounts table
create table accounts( account_id int primary key, cust_id int not null, branch_id int not null,
account_type varchar(20) not null, balance money not null, 
foreign key (cust_id) references customers(cust_id),
foreign key (branch_id) references branches (branch_id))


-- insert values into accounts table
insert into accounts values (1, 1, 5, 'Checking', 1000),
(2, 1, 5, 'Savings', 5000),
(3, 2, 1, 'Checking', 2500),
(4, 2, 1, 'Savings', 10000),
(5, 3, 2, 'Checking', 7500),
(6, 3, 2, 'Savings', 15000),
(7, 4, 8, 'Checking', 5000),
(8, 4, 8, 'Savings', 20000),
(9, 5, 14, 'Checking', 10000),
(10, 5, 14, 'Savings', 50000),
(11, 6, 2, 'Checking', 5000),
(12, 6, 2, 'Savings', 10000),
(13, 1, 5, 'Credit Card', -500),
(14, 2, 1, 'Credit Card', -1000),
(15, 3, 2, 'Credit Card', -2000);

select * from accounts 
drop table accounts

-- Create transactions table
create table transactions (
transaction_id int primary key,
account_id int not null,
transaction_date date not null,
amount money not null,
foreign key (account_id) references accounts(account_id))

-- insert values into transactions table

insert into transactions values (1, 1, '2022-01-01', -500),
(2, 1, '2022-01-02', -250),
(3, 2, '2022-01-03', 1000),
(4, 3, '2022-01-04', -1000),
(5, 3, '2022-01-05', 500),
(6, 4, '2022-01-06', 1000),
(7, 4, '2022-01-07', -500),
(8, 5, '2022-01-08', -2500),
(9, 6, '2022-01-09', 500),
(10, 6, '2022-01-10', -1000),
(11, 7, '2022-01-11', -500),
(12, 7, '2022-01-12', -250),
(13, 8, '2022-01-13', 1000),
(14, 8, '2022-01-14', -1000),
(15, 9, '2022-01-15', 500);

select * from transactions
drop table transactions

--Q1. What are the names of all the customers who live in New York?
select concat(first_name, last_name) as custs_live_in_new_york from 
customers where city='New York'


--Q2. find no.of customers are from which state and no.of distinct cities from each state.
select  state, count(cust_id) as no_of_customers, 
count(distinct city) as no_of_distinct_cities
 from customers group by state


--Q3. What is the total number of accounts in the Accounts and how many types of accounts in accounts table?
select count(distinct account_id) as no_of_accounts , 
count(distinct account_type) as no_of_different_types_of_account from accounts

select * from accounts


--Q4. What is the total balance of all checking accounts?
select total_balance_in_checking_account from (
select account_type, sum(balance) as total_balance_in_checking_account from 
accounts group by 
account_type) a where a.account_type='checking'


--Q5. What is the average balance of all checking accounts?
select average_balance_in_checking_account from (
select account_type, avg(balance) as average_balance_in_checking_account from 
accounts group by 
account_type) a where account_type='checking'


--Q6. find no.of checking type of accounts
select distinct cust_id, count(*),account_type from 
accounts where account_type='checking' group by cust_id,account_type


--Q7. find no.of savings type of accounts
select distinct cust_id, count(*),account_type from 
accounts where account_type='savings' group by cust_id,account_type


--Q8. find no.of customers using different type of accounts
select account_type, count(distinct cust_id)as no_of_customers from 
accounts group by account_type


--Q9. What is the total balance of all accounts associated with customers who live in Los Angeles?
select sum(balance) as total_balance_los_angeles from (
select c.cust_id, c.city,a.account_id, a.balance from 
customers c join accounts a on c.cust_id=a.cust_id)b
where b.city='Los Angeles'


--Q10. Which branch has the highest average account balance?
with cte as (
select top 1 a.branch_id, avg(a.balance) as highest_average_balance from 
accounts a join branches b on a.branch_id=b.branch_id group by 
a.branch_id order by max(a.balance) desc)
select b.branch_name from branches b join cte c on c.branch_id=b.branch_id


--Q11. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
with cte as (
select top 1 cust_id, sum(balance) as highest_current_balance from accounts 
group by cust_id order by sum(balance) desc)
select concat(c.first_name,' ',c.last_name) as customer_name from customers c 
join cte c1 on c.cust_id=c1.cust_id


--Q12. list down the customers who has made the most transactions in the Transactions table desceding order.
with cte as (
select concat(c.first_name, ' ', c.last_name) as cust_name , c.cust_id, a.account_id from 
customers c join accounts a on c.cust_id=a.cust_id)
select count(distinct t.transaction_id) as no_of_transactions, ct.cust_name from 
cte ct join transactions t on t.account_id=ct.account_id group by cust_name 
order by count(distinct transaction_id) desc


--Q13.Which branch has the highest total balance across all of its accounts?
with cte as (
select top 1 a.branch_id, sum(a.balance) as highest_average_balance from 
accounts a join branches b on a.branch_id=b.branch_id group by 
a.branch_id order by max(a.balance) desc)
select b.branch_name from branches b join cte c on c.branch_id=b.branch_id


--Q14. list down which branch has the highest number of transactions in the Transactions table in descending order.
with cte as(select a.account_id, a.cust_id, b.branch_id,b.branch_name from 
accounts a join branches b on b.branch_id=a.branch_id)
select count(distinct t.transaction_id),c.branch_name from 
transactions t join cte c on c.account_id=t.account_id group by c.branch_name order by 
count(distinct t.transaction_id) desc


--Q15. Find the total balance of all the accounts in each branch.
select b.branch_name , sum(a.balance) as total_balance from accounts a 
join branches b on b.branch_id=a.branch_id group by b.branch_name, b.branch_id


--Q16.calculate the average balance for each account type (Checking, Savings, Credit Card) across all branches.
select account_type, avg(balance) as average_balance from accounts group by account_type


select * from branches
select * from transactions
select * from customers
select * from accounts