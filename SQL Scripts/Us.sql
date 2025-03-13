---create account

--SQl commands
-----------------
--DDL --> Create, alter, truncate, drop

empid, empname,  salary     mob_no  location		.......................
1		lkjiji		90000
2		lkfg			877777
4
5
6

created bank account
--------------------------
acc_id, name varchar(10), date_reg, amount_dep, cred,..........., type_of_tran, ....


--DML ---> update, insert, delete
--DRL  --- select 
--DCL ==> Grant, Revoke
-- TCL ===> commit, rollback

--- syntax of creation of db
-- Create database USA_8am

-- create database USA_10am


-- use USA_8am

use usa_10am


--- creating table syntax
create table employees (emp_id int, emp_name varchar(20), age int, salary float, gender char(1))


---inserting data syntax
insert into employees values (45, 'samala', 78, 3377.28828, 'F')

select * from employees 


update employees set salary = 



truncate table employees

delete employees where emp_id = 3

insert into employees(emp_id, salary) values (3, 32.0), (4, 79.2),(7,787.25)


'A787a'
2872
Aagka


drop table employees



--- retrieval syntax
select * from employees 


---------

create database USA_8am
use usa_8am


---DDL ==> 
create table employees (emp_id int, emp_name varchar(20), age int, salary decimal(5, 2))

select * from employees  -- DRL

select emp_id, emp_name from employees

--alter table table_name add coulmn_name data type

alter table employees add gender char(1) ---- adding a column by using alter 

alter table employees drop column age   ----dropping a column 

alter table employees alter column  emp_id varchar(20)  --- changing data type of any columns

select * from employees

drop table employees

truncate table employees

--- DML
----------
==> insert, update, delete

insert into employees values (100, 'mndra', null, 500.00), 
(20, 'mahe', 90, 52.00), (40, null, 80, 440.00),
(50, 'mahen', 80, 400.00)

truncate table employees

delete employees

delete employees where salary < 450




select * from employees where emp_id >= 10;


select * from employees;

delete employees where emp_name is not null        ----'null' ==> string ; null ==> no value or not known or missing

update employees set age = 100 where emp_name is null

update employees set emp_name = 'something' where emp_name  is null 

update employees set emp_id = 52, emp_name = 'uma' where age = 100 


update employees set gender = 'A', salary = 679.99  where emp_id > 40

select * from employees


create table eployees (id int, salary int)

create schema emp
drop schema emp


create table emp.eployees (id int, name varchar(20))

create database hari
use hari

select * from employees

alter table employees add gender char(1)



drop table eployees




alter table employees add update_salary int

update employees set update_salary = salary*1.3


====
DDL
DML
DRL

clauses
---------
where, group by, order by , having, .........



---DDL, DML, DRL
----------------------------
DDL==> create, alter, truncate, drop

students info
----------------
create table ==> stu_id, stud_name, age, marks

DML => insert, update, delete


delete from employees  --- all data gets deleted (or) 

truncate table employees --all data gets deleted

select * from employees

DCL: --- user, login, passwords, role, privilages ===> Grant, Revoke

TCL: --- commit, rollback

begin transaction
update employees set salary = 458 where salary < 100000

rollback

commit


select * from employees

--DDL, DML, DRL, DCL, TCL

select * from sys.databases

select * from information_schema.tables

-- surrogate (identity)

create table employees_info2(emp_id int identity(1444, 1),
name varchar(30), age int, salary int)


create table employees_info(emp_id int,
name varchar(30), age int, salary int)

select * from employees_info1 

insert into employees_info1 values('alkjgai', 49, 4000)

------------------
Constraints
------------------
--- null, not null, unique, primary key, foreign key, check, default

null==> accepts null values
not null => wont accept null values

unique ==> wont allow duplicates

primary key ==> not null and unique

a p.k, b p.k ==> 


===
1 mahendra
1 akhga

(a, b) primary key



foreign key ==> relation building 

check ==> check(age > 19)

star marks in red==> mandatory==> not null
check(expe> 4)

default ======> default value that we defined while creating a table 



a table ==> colum1 ===> foreign key
b table ==> column1 ==> should be primary key


customers
------------
cust_id, cust_name, order_id, city



orders 
----------
id, amount, item_name


create tabale 

delete? 

drop table eployees


create table employees(emp_id int primary key, name varchar(20), salary int not null, 
age int constraint ck check(age>18), dept_id int not null, location varchar(10) unique,
charecter varchar(20)
constraint df default 'good', 
foreign key(dept_id) references departments1(id))

create table departments1 (id int primary key, name varchar(20))

alter table departments1 drop column id

alter table employees drop constraint df



----employees
--- departments

insert into employees values (








employees ==> 1 ==> dept_id
departments ==> 2 => id


drop table employees


select * from dataengineer.dbo.customers ---cross db queries


insert into employees(emp_id, name, salary, 
age, dept_id, location) values (107, 'chari', 5555, 19, 8009, 'africa', 'aaa')

select * from employees

alter table employees alter column age check(age>40)

alter table employees alter column charecter varchar(20) default 'something'

alter table employees drop constraint df


select * from employees


insert into departments values(8009, 'data analytics')

select * from employees;
select * from departments;

insert into employees(emp_id, dept_id) values (200, 19)

drop table employees
drop table departments


create table employees(emp_id int primary key, name varchar(20), salary int not null, 
age int constraint ck check(age>18), dept_id int not null, location varchar(10) unique,
charecter varchar(20), 
foreign key(dept_id) references departments1(id))

create table departments1 (id int primary key, name varchar(20))

insert into departments1 values(1055, 'data')

insert into employees values(102, 'amahendra', 8888, 48, 1055, 'cayaga', 'alga')

select * from departments1
select * from employees


--------------
all about data profe==> 
SQL Course
----------
All Basics==> data, info, sql, sql db, server, rdbms, dbms,

All SQL Commands
---------------
==> DDL(create, alter, truncate, drop)
, DML(insert, update, delete),
DRL(select),
DCL(grant, revoke),
TCL(rollback, commit)

constraints
----------------
null, not null, unique, primary key, foreign key, default, check

create table emp_usa (id int primary key, emp_name varchar(20))


create table orders(order_id int, item varchar(20),
city varchar(20), primary key(order_id, item))

create 

select * from orders 


100 ==>  item1 => 10 
100==> item2
100 => item3


===> null values ==> both null and not nulls

alter table emp_usa alter column id int null


drop table emp_usa

sql server ==v10.0 ==> 


100001 ====> mahendra
100 ===> mahi
102 ==> mahi


Clauses
-----------------
---> where, group by, having, order, top n, (limit, offset) ======> 

===> partition by(), over()

use dataanalyst


where
-----------
retrieving, updating, deleting

select * from employees_info where age < 40

update employees_info set salary = salary * 1.1
where department = 'data analytics'


select * from empss

select * from emp_a


delete from employees_info where emp_id = 8

select *, age + 2 updated_age from employees_info

select *, department from employees_info

update 


1.1

100/- * 1.1
110/-

100 ==> * 0.9
90



select * from empsa

select * from employees_info

update emp_a set age = age + 2 where employee_name = 'Ravi KUMAR'

SELECT * FROM EMP_A

OPERATORS:
---------------
ARITHMATIC ==> +, -, /, *, %
LOGICAL ==> AND, OR, NOT
STRING ==> LIKE, NOT LIKE
RANGE ==> BETWEEN , NOT BETWEEN
COMPARISION ==> =, !=, <, >, <=, >=
SPEACIAL==> IS NULL, IS NOT NULL, IN, NOT IN

select * from emp_a

delete from emp_a where age > 40.4 and department = 'Hr'

delete from emp_a where employee_id > 17 or employee_name != 'Manoj Yadav' 
and department = 'Hr'

Hr ==> 19, 'something'
finance ==> 16, 'Manoj Yada'
Hr ==> 15, 'Manoj Yada'


select * from emp_a where department = 'Engineering' or department = 'sales'
or department = 'marketing'

select * from emp_a where department in ('Engineering', 'sales', 'marketing')

update emp_a set salary = salary * 0 where age not in (27, 34, 33)

select * from emp_a

udpate emp_a set salary = 

update emp_a set age = 45 where employee_id = 3

update emp_a set salary = 
	case when age > 40 then 88888
		when age = 40 then 77777
		else 6666 end 


select * from emp_a where employee_id > 7 and department = 'marketing' or employee_name = 'karan Mehta'
select * from emp_a

select * from emp_a where employee_id > 7 and department = 'marketing' or 
employee_name= 'suresh gupta' and age = 45

select * from emp_a where age not between 40 and 50

select * from emp_a where age between 40/2 and 50/2

select 444 * 444 as lgaklgjka

logical execution of sql query
--------------------------------
from, where, group by, having, select, order by


like, not like

like 'a%'
'a__i%'
'a____h'

select * from emp_a where employee_name like 'a%a' and employee_name like 'a%'

select * from emp_a where department not in ('engineering') and employee_name not like 'a%'

update emp_a set age = age - 4 where employee_name not like 'r_%__o'

select * from emp_a

select *, salary *1.1 as updated_salary
from emp_a

x+x*0.1
x(1+0.1)
x(1.1)

---count, min, max, avg, sum ===> aggregate function

===> without group by we cant use aggregate functions
===> alone can use group by

select *, count(*) from emp_a group by department, employee_name, employee_id, age, salary

1, 'mahi', 'data', 40, 5000
1, 'mahi', 'data', 40, 5000, 2

select count(employee_id) from emp_a group by department

--Q) return number of employees in each department whose age is less than 30

select department, count(employee_id) as number_of_employee_dept_wise 
from emp_a where age < 30
group by department 

select * from emp_a


select avg(salary) from emp_a

===> 6666+........6666

select  * from emp_a order by age desc, employee_name


select department, sum(salary) as total_salary from emp_a
group by department having sum(salary) < 30000



where, group by, having, order by, top n

select department, max(salary), min(salary), avg(salary), count(employee_id)
, sum(salary)
from emp_a
group by department having count(employee_id) = 3 and avg(salary) = 34073


where, gro by, hav, order, topn

select  * from emp_a

clauses
---------
where, group by, having, order by, top n, distinct, (over(), partition by)

select department, count(employee_id) number_of_employees  from emp_a group by department

select count(distinct employee_name) from emp_a 

select top 1 department, age, sum(salary) from emp_a 
group by department, age order by department desc, age desc 

select distinct department, salary, age from emp_a

select *, count(employee_id) from emp_a 
where employee_id < 10 group by department, employee_id, employee_name, department, age, salary
having department not like '%g' order by 4 desc, 3 desc


---- conditional statements (case when)
===================================
update emp_a set salary = 
	case when department = 'sales' then  50000
		 when department = 'hr' then 60000
		 when department = 'finance' then 5400
		 else salary end 
		select * from emp_a

select *, case when age between 18 and 30 then 'young_age'
				when age > 31 and age < 50  then 'middle_age'
				when age > 51 then 'old_age'
				else 'not known'
				end as age_group
from emp_a

select *, case when salary >= 80000 then 'high range'
			when salary < 80000 and salary > 50000 then 'middle_range'
			else 'low range' end as salary_updated 
from emp_a



select * from emp_a


from, where, group by, having, select, order by , top n


select top 1 * from emp_a order by salary desc




A, 30 => 5000
B, 34 ==> 4000
C, 30 ==> 333
A, 30==> 30
B, 39 => 40

A ==> 5030   ; A, 30 ==> 5030
B ==> 4040	; B, 34 ==> 4000
C ==> 333	; B, 39 ==> 40

A ==> male + femal ==> 
B ==> male + f ==> 

A, male ==> 
A, fe==> 
B, 

group by department, employee_name



Engineering, 'mahendra' , 2


A = mahi
B = sam
B = sam
B = mahi
C = mahi
C= mahendra
D = ravi

group by department only

A ==> 1
B ==> 3
C ==> 2
D ==> 1

group by department, name

A, mahi ==> 1
B, sam ==> 2
B, mahi ==> 1



count, min, max, avg, sum



----
All basics ==> data, info, db, dbms, rdbms, server

SQL Server ==> software, interface intro, 
SQL commands ==> DDL (Create, alter, drop, truncagt)
				===> DML (insrt, upda, delete)	
					===> DRL (select)
					==> DCL (grant, revo)
					==> TCL (commit, rollback)
constraints ==> not null, null, unique, pk, fk, default, check

surrogate ==> auto increment =>

operators ===> arith (+, -, %, /, *)
				-==> log(and, or, not)
				===> range (b/w, not b/w)
				===> string(like, not like)
				===> compari(=, !=, >, <, >=, <=)
				==> is null, is not null
				===> in, not in 

	select *from emp_a where employee_id not in(1,2,5)

clauses ===> where, group by, having, order by, top n, distinct

conditional statements ==> case when 


select (8/9.0)



select * from emp_a where employee_id % 2 !=0





3
==
a==> 10 a==0
b==> 20 b== 2
c==> 40 c==24







insert into emp_a (department, employee_name) values ('Finance', 'Pooja Iyar')


A ===> 'ab'
B ==> 'gh'
C ===> 'mahi'
D ===> 'ab'
A ==> 'ab'
C ==> 'mahi'


select * from emp_a

delete from emp_a where employee_name like 'p%' and employee_id is null

select * from letters

update letters set aga = 
	case when ascii(aga) < 97 then char(ascii(aga)+32) 
	else char(ascii(aga) - 32) end


	a = 97 b = 98 c = 99
	A = 65 B = 66......
	


	select *, count(employee_id) from emp_a group by 
	department, employee_id, employee_name, department, age, salary

	select *, count(employee_id) over(order by age desc) from emp_a

	select * from emp_a

	please try to solve these problems. 
	Q) find the percentage of employees working in each department?
	Q) 

	number of employees in each department/total number of employees in the organization..

	select department, count(employee_id)*100.0/(select count(employee_id) from emp_a)
 from emp_a group by department

 select * from emp_a where department = 'HR'


 select count(*) as number_of_employees_inHr, 
 count(case when department = 'Engineering' and age < 50then employee_id else null end)
 from emp_a where department = 'HR' 


 select * from emp_a


 select *, case when age < 30 then 'young_age' 
				when age > 30 and age < 50 then 'middle_age'
				else 'old_age' end as age_group from emp_a




update emp_a set salary = 
	case when department = 'Engineering' then salary * 1.1
		when department = 'HR' then 20000
		when department = 'Sales' then salary * 0.9
		else salary end 

	select * from emp_a



	select total_number_of_employees from(
	select count(*) total_number_of_employees,
	count( case when department = 'Engineering' then employee_id else null end )
	as number_of_employees_in_eng, 
	count( case when department = 'HR' then employee_id else null end) as hr_number_emps,
					count( case
					when department = 'Sales' then employee_id 
					else employee_id end) as number
	from emp_a)a


	select * from emp_a

	delete from emp_a 

	---system defined functions
	-------------------------------

	function?

	input ==> function? ==> output

	f(x)=> x2+3x+2
	f(3) => value
	f(4) => value2


	select 9-10.8

	modulus | |
 ===> possitive 

 select abs(9-10.9)


 math, string, aggregate, date time
 -------------------------------------
 math functions
 --------------------
 abs(), floor(), ceiling(), sqrt(), power(), pi(), sin(), cos(), round(), .............


 select abs(7-89.98)

 select floor(9.999999)

 select floor(9.0000000000001000000000000000000000001)

 select ceiling(9.00000000000000000000000000000000001)

 select ceiling(3.12)

 select floor(0.1)

 select sqrt(16.258)


 select power(3,4)

 select pi() ==> 22/7

 select sin(90)
 select cos(78)

 select round(4.0501, 1)

 select round(pi(), 4)


 select * from emp_a

 select *,  round(round(sqrt(salary),3),2) from emp_a

 select round(


 string functions
 ====================
 len(), substring(), left(), right(), ltrim(), rtrim(), stuff, concat (+), charindex, ......
ascii(), char()

select len('mahedndra')
select len(substring('mahedndraaaa', 3, 7))

select len('mahendra')

select substring('mahendra', 4,len('mahendra'))

select 'first_name' + ' ' +  'last_name'
mysql ==> concat 
sqlit ==> || ||

select charindex('a', 'mahendruuua', charindex('a', 'mahendra')+1)

select charindex('m', 'swamivivekananda555m', charindex('m','swamivivekananda555m')+1)

select len(ltrim('  mahi'))

select len('  mahi')

select len(rtrim('mahi  '))
select len('mahi  ')


select right('mahendra', 5)

select left('mahendra', 4)

select stuff('mahendra', 1,2, 'sam')  ==> cut and insert

select stuff('something', 1, 4, 'ma  ')


a=> A
b=B
A=> a

select ascii('a') ==> 97
select ascii('b')


select ascii(',')

select ascii('"')

select char(15)

select ascii('A') ==> 65, ...

select char(97)
select char(65)



math, string



---few string functions remain
select reverse('mahendra')
select replace('mahendra is working', 'is', 'playing')

select concat(first_name, last_name)

select 'first_name' + 'last_name'

select 'mahendra mahi' 

select rtrim(

select substring('mahendra mahi', 1, 10)

select substring('mahendra mahi', 1, charindex(' ', 'mahendra mahi')-1)

select substring('mahendra mahi', charindex(' ', 'mahendra mahi')+1, len('mahendra mahi'))



select charindex(' ', 'mahendra mahi')


select * from emp_a

select *, substring(employee_name, 1, charindex(' ', employee_name)-1) as first_name, 
substring(employee_name, charindex(' ', employee_name)+1, len(employee_name)) as 
last_name  from emp_a

aggregate functions
--------------------------
-- count, min, max, avg, sum
select department, age, count(distinct employee_id) from emp_a 
group by department, age

select top 1 department, sum(salary) total_salary from emp_a group by department
order by sum(salary) 

select avg(salary), sum(salary), min(salary), max(salary), count(employee_id)
from emp_a

select department, avg(salary), sum(salary), min(salary), max(salary), count(employee_id)
from emp_a group by department


date time functions
-----------------------
select getdate()

select month(getdate())
select day(getdate())
select year(getdate())

select datename(month, '2027-12-02')
select datename(weekday, getdate())
select datepart(month, '2027-12-02')
select datepart(day, '2027-12-02')
select datepart(year, getdate())

select datediff(year, getdate(), '2024-02-03')
select datediff(year, '2024-02-02', getdate())

select datediff(week, '2024-05-09', '2025-09-20')

select getdate()

select dateadd(month, 30, getdate())

select convert(varchar, getdate(), 101)

select getdate()


select date_format(getdate(), '%y:%m/%d')

select to_char(getdate(), 'YYYY-MM-DD')

select format(getdate(), 'yyyy-MM-DD')


2024/01/20


select now() 


math, string, aggregate, date time
-------------------------------------

-- copy commands
----------------------
select * from emp_a_finance


select * into emp_a_finance
from emp_a where department = 'finance'

select employee_id, age, salary into emp_a_few from 
emp_a 
select * from emp_a_few

select * into emp_tab1 from emp_a where 1=1

select * from emp_tab


insert into emp_tab
select * from emp_a


select * into emp_y from emp_a

select * from emp_y

select * into emp_xyz from emp_a where 1=1

select * from emp_xyz



selct * into ===> create only schema, copy entire table, (any column)

insert into 
select .. from table



----set operators
=======================
union ==> wont allow duplicates


select * from emp_a_engineering -- 5(4, 1)
intersect
select * from emp_a -- 21

insert into emp_a values(200, 'mahendra', 44, 'data', 888889)




A-B


select * from abcx 


insert into emp_a_engineering values(200, 'mahendra', 40, 'data', 888889)



usa---states==> each ==> table1, table2, table3

A==> 
a,b,c,d,e ==location 1
a,b,c,d,e == location 2

A={1,2,3}
B={2,3,4}

A-B => {1}
B-A ==> {4}


AUB
AintersecitonB
A-B
B-A

---union, union all, intersect, except

---Joins
============
--inner, outer(left, right, full-->left outer, right outer, full outer), self, cross

---inner ==> common valued records
---left ==> common vlaued records + uncommon valued records from left table 
---right ==> common valued records + uncommon valued records from right table
-- full ===> common valued records + uncommon valued records from left + uncommon from right

use dataanalyst

create table customers(cust_id int, cust_name varchar(20), location varchar(20))
insert into customers values (1, 'mahendra', 'india'), (
2, 'mahi', 'france'), (3, 'sam', 'usa'), (4, 'ravi', 'uk')

select * from customers 

create table orders (ord_id int, ord_item varchar(30), ord_amount int, customer_id int)

insert into orders values (100, 'laptop', 20000, 2), (200, 'mouse', 300, 1), 
(300, 'books', 200, 2), (400, 'pen', 30,1), (500, 'keypad', 400, 3)

select * from customers 
select * from orders 

---inner

select customers.*, orders.* from customers left join orders
on customers.cust_id = orders.customer_id


select c.*,u.* from customers c inner join orders u
on c.cust_id = u.customer_id

select c.*,u.* from customers c left join orders u
on c.cust_id = u.customer_id	


select c.*, o.* from customers c full join orders o
on c.cust_id = o.customer_id

insert into orders values (600, 'house', 500000, 10)


1		1
2		3
3		1
4		2
5		3

1, 1
1,1


create table a(id int, name varchar(20))
insert into a values (1, null), (2, null), (3, 'mahendra')

create table b (name varchar(20))
insert into b values (null), (null), ('mahi')

select * from a
select * from b
select * from c


--innner ==> 
--left, right, full outer

select a.*, b.*, c.* from a left join b on a.name = b.name 
join c on c.name = a.name


1, NUll
2, null
1, null

create table c (name varchar(20), age int)
insert into c values ('mahendra', 40), ('mahi', 50), ('sandeep', 60)








---joins
==============
inner, outer(left, right, full)
--------------
self, cross join


select * from employee where empid = mgrid


select  empid, empname,mgrid, salary from(
select e.*, e1.empname as mgr_name, e1.salary mgr_salary
from employee e join employee e1 
on e.mgrid = e1.empid)a
where a.salary = a.mgr_salary

select * from weather_data

--Q) return those dates on which the temp is higher/lower than their prev.day
--Q)......................................................than their nex.day.

select * from (
select w.*, w1.* from weather_data 
as w join weather_data as w1
on day(w.date) +2  = day(w1.date) and month(w.date) = month(w.date))a
where a.temperature > a.pre_day_temperature

--Equi joins , non equi joins
-----------------
select * from (
select a.*, b.employee_name as manager_name, 
b.salary manager_salary from employees a, employees b
where a.manager_id  = b.employee_id)as mahi
where mahi.manager_salary = 87500





---cross joins
=-===============
a==> 4
b==> 3

students
----------
id, name, age

subjects
-------------
id, name, marks

select * from students --36

select * from subjects  --3

select * from students 
cross join
subjects 

-----------------------------

--subqueries
=================

select * from (select employee_id, age from employees)a
where a.employee_id < 10

---i) single record and single column subquery
select employee_name, salary, avg(salary)
from employees where salary < (select avg(salary) from employees)
group by employee_name, salary


--- ii) single column and multiple records subquery

step 1, 2, 3,4,5

select * from employees where department in
(select distinct department from employees where department = 'Finance'
or age > 60)

a = 2*1
--- iii) correlated subquery
----------------------------------
select * from employees where salary = (
select max(salary) from employees where salary < (
select max(salary) from employees where salary < 
(select max(salary) from employees)))

iv) multiple records and multiple columns subq

select * from (
select employee_id, age, salary, department from (
select * from employees where salary > 50000)a)lakhgoiah
where department = 'Engineering'

with cte as(
select * from employees where salary > 50000), 
cte2 as(
select employee_id, age, salary from cte)
select * from cte2 where age > 40

with cte as(
select avg(salary) as avg_salary from employees)
select * from employees where salary > (select avg_salary from cte)


select * from employees 
--Q) return those employees details whose salry is higher than the average 
--of all employees salaries


---ctes
------------
with cte as
(select avg(salary) avg_salary from employees), 
cte2 as(select department, 
avg(salary) avg_salary from employees group by department),
cte3 as(select * from cte2 where department like 'E%' or department like 'M%'), 
cte4 as (select * from employees),
cte5 as (select * from cte4 where manager_id = 2), 
cte6 as(
select cte4.*, cte2.avg_salary from cte4 join cte2 on 
cte2.department = cte4.department)
select * from cte6 where salary > avg_salary



----Q) return employees detials whose salary is higher than the average of their department
 ---employees average salaries
select * from (
select e.*, a.avg_salary from employees e join (select department, avg(salary) avg_salary from employees
group by department) a on e.department = a.department)mahi
where mahi.salary > mahi.avg_salary


---recursive ctes
---------------------

with cte as(
select 1 as id, 1 as squared ----anchor tag
union all
select id +2, (id+1)*(id+1) from cte where id < 10) ----recursive tag
select * from cte
option (maxrecursion 0)


select 1 as id 
union all
select 2 as id

select * from employees

select department, count(employee_id), avg(salary), min(salary), 
max(salary),
string_agg(concat(employee_name,':', age), ',') from employees
group by department


---window functions
-----------------------------
select * from employees 

select *, avg(salary) from employees 
group by employee_id, employee_name, age, department, salary, gender, manager_id

select * from (
select *, avg(salary) over() as avg_salary from employees)a
where a.salary > a.avg_salary



dept_wise, avg_sala
join
employee dept=dept







--Q) return those employees details whose salry is higher than the average 
--of all employees salaries


---subquery
------------
select * from (
select * from employees where salary > (select avg(salary) avg_sal from employees))a
where a.salary > a.avg_sala








select 1,2 from (
select * from employee))


abc ==> ==========> 1 ========>3 ==========> 4=========> desired


select * from employees where salary = (select min(salary) from employees)

----Q) return employees detials whose salary is higher than the average of 
--their department
 ---employees average salaries

 ----Window functions (analytical functions)
 ---------------------------
 ---case I
 select *, avg(salary) over() as number_of_employees from employees 

 ---case II
 select * from (
 select *, avg(salary) over(partition by department) as av from employees
 )a where a.salary > a.av

 ---case III
 select *, avg(salary) over(order by employee_id desc) as avg_salary, 
 sum(salary) over(order by employee_id desc)
 from employees 

 ---case IV
  select *, avg(salary) over(partition by department order by employee_id desc) as avg_salary, 
 sum(salary) over(partition by department order by employee_id desc)
 from employees 


 ---RAnk, dense rank, row number, lead, lag
 --first number, last number, ntile

 employee_id) over(partition by department
  order by employee_id) from employees 

  select *, min(salary) over(
   ) min_salary from employees 


 select * from employees order by salary desc

 select * from (
 select *, rank() over(partition by department  order by salary desc) rnk, 
 dense_rank() over(partition by department order by salary desc) drnk from employees
 )a where a.drnk =2

 select * from (
 select *, dense_rank()over(order by age) drnk from employees)a
 where a.drnk <=2

with cte
as( select *, dense_rank() over(order by age) drnk from employees)
select * from cte where drnk =3

select * from employees order by salary 

with cte as(
select *, row_number() over(partition by department, employee_name
order by salary desc) rn from employees
)
select * from cte where rn =1

select * from employees where employee_name = 'tanuja'


delete from employees where employee_id not in(
select min(employee_id)
from employees group by employee_name, 
department)

select * from employees


select *, lag(salary,5, 0) over(order by employee_id) 
as prev_emp_salary, lead(salary, 3, 0) over(order by employee_id)
next_details from employees


select *, sum(salary) over(
order by employee_id rows between 1 preceding and 1 following) 
from employees

precedings
current
following





A 'mahi'
B 'mahi'
C 'mahi'
C 'mahi'































