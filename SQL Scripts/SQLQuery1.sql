-- Problem Statement
------------------------
--Given Employee details like ID, name, age, and salary. 
---Assume a record is duplicate only if name, age, and salary match. 

--Q4) Find the number of duplicate records other than the original one. 

-- Q5) Keep the latest record as the original one and delete the older record as duplicated. 


create table employees (
    id int primary key,
    name varchar(50),
    age int,
    salary int
);

insert into employees (id, name, age, salary) values
(1, 'Sharath', 28, 50000),
(2, 'Ganesh', 30, 60000),
(3, 'Ravi', 28, 55000),
(4, 'Sekhar', 35, 70000),
(5, 'Mahendra', 30, 48000),
(6, 'Sharath', 28, 50000),
(7, 'Ganesh', 30, 60000),
(8, 'Sekhar', 35, 70000),
(9, 'Ravi', 28, 55000),
(10, 'Sharath', 36, 50000),
(11,'Mahendra', 45, 56000),
(12, 'Ganesh', 30, 43000)

select * from employees


-------SQL Commands
---------------------
DDL, DML, DRL, DCL, TCL

DDL==> create, alter, drop, truncate
DML ==> insert, update, delete
DRL ==> select
DCL ==> Grant, Revoke
TCL ==> Commit, Rollback


create database raghav_USA 

use raghav_usa

create table employees (id int, name varchar(20), age int, salary int, joining_date date)

insert into employees values(1, 'maha', 52, 40000, '2023-08-21')

select * from employees 

--Alter: to change any data type of any column, add a column, drop a column 

alter table employees alter column name char(9)

ALTER TABLE employees
ADD CONSTRAINT a PRIMARY KEY (id);

alter table employees alter column id int null

truncate table employees 

alter table employees drop constraint a


select * from employees

insert into employees values (1, 'ma', 20, 39999, '2022-03-30')
, (2, 'aga', 33, 1111, '3000-02-9')

alter table employees add gender char(2)

create schema abc

create table abc.employees (id int)

alter table employees drop column gender

select * from employees 

sp_rename employees, emplo

sp_rename 'abc.empl', 'empal'

drop database abcd
create database abcd

create table aaa (id int)

drop table aaa

insert into aaa values (2),(24),(8)
select * from aaa


truncate table aaa

delete aaa where id <= 2


create table employees(id int, name varchar(20), salary float, age decimal(2,1))

insert into employees values(1, 'mahe', 2000.80, 35.5258)

alter table employees alter column age decimal(5, 2)

select * from employees 

truncate table employees 




use dataanalyst


create login maha with password = 'mahendra'

create user maha_user for login maha

create role manage 

-- Grant permissions to roles
GRANT SELECT, INSERT, UPDATE, DELETE ON employees TO manage
GRANT SELECT, INSERT ON projects TO developer_role
GRANT SELECT ON employees TO viewer_role;

-- Assign roles to users
EXEC sp_addrolemember 'manage', 'maha_user';
EXEC sp_addrolemember 'developer_role', 'developer_user';
EXEC sp_addrolemember 'viewer_role', 'viewer_user';


-- Check roles assigned to a user
SELECT * FROM sys.database_role_members
WHERE member_principal_id = USER_ID('maha_user');

-- Check permissions for a role
SELECT * FROM fn_my_permissions(NULL, 'dataanalyst')
WHERE grantee_principal_id = DATABASE_PRINCIPAL_ID('manage');

-- Revoke permissions from a role
REVOKE SELECT ON employees FROM viewer_role;

-- Remove a user from a role
EXEC sp_droprolemember 'manager_role', 'manager_user';



---SQL Commands
----------------
--DDL, DML, DRL, DCL, TCL
-------------------------------
--DDL=> Create, Alter, Truncate, drop
===================================
create table items (id int, name varchar(20), price float, quantity int, offer decimal(2, 1))


insert into items values (1, 'Dosa', 5, 20, 6), 
(2, 'Samosa', 2, 40, 3.0), (3, 'Edli', 4, 100, 5.5)

select * from items

alter table items add abc int

alter table items drop column abc 



insert into items values (4, 'Puri', 6, null, 2.0), (5, 'tea', 2, 1000, null)

alter table items drop column offer

alter table items alter column name varchar(200)

create table emp28 (id identity(100, 10), name varchar(20), salary int)

drop table emp28
drop table emp24 


insert into emp28 values ('mahendra', 40000), ('sa', 88777), ('aga', 99999)

select * from emp24 

select * from emp28


insert into emp2 values ('mahendra', 2000), ('sarath', null),('hemanth', 79999)

select * from emp2

alter table emp2 add joining_date date
select * from emp2

select * from items 

drop database abcd 

create database aa

use aa

create table eem(id int)

drop database aa

use dataanalyst 

select  * from items 

--DML => Insert, Update, delete


update items set abc = 8

update items set quantity = 42 where name = 'tea'

delete items where quantity < 10

truncate table items




-- DRL => Select
-- DCL => Grant, Revoke
-- TCL => Commit, Rollback

select * into empad from 
employee where 1=2

select * from empad 

select * from emps 

begin transaction
update emps set salary = 74366 where age < 30
commit

rollback 

select * from emps 


rollback 

select * from emps;


alter table emps add abc int;

update emps set abc = salary

-- i) update a column with a reference another columns
-- ii) can we add a same named column in a table
-- iii) can we change column name using alter command or intro sp_rename
--- iv) change table name
-- v) update a to A, A to a
--- vi) Identity (surrogate key)
--- vii) creation of table using visual format
-- viii) can we create same table name in a data base (schemas intro)
---ix) can we delete a database using delte command.
--- x) how can i see list of databases?
--- xi) how can i see list of tables in db.
--- x) TCL
-- xi) DCL (Data Base Adminstators)
--- xi) constraints


EXEC sp_rename 'xyz.letter', 'word', 'COLUMN';

exec sp_rename emp_det, emp_details 

sp_rename xyz, abc

select * from sys.databases 

SELECT * 
FROM INFORMATION_SCHEMA.TABLES

WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG = 'YourDatabaseName';


create database aa

drop database aa


alter table xyz rename column letter to word

create table letters (id int, letter char(1))
insert into letters values (1, 'a'), (2, 'A'),(3, 'b'), (4, 'a'), (5, 'C'), (6, 'd'),
(7,'A'), (8,'B'),(9,'D')

select * from xyz
drop table xyz

select * from xyz

update letters set letter = 
case when ascii(letter) >= 97 then (select char(ascii(letter)-32)) 
	when ascii(letter) < 97 then (select char(ascii(letter) + 32))
	else letter
end

select * from letters 

drop database uk_9am

use master 


alter table xyz alter column id float, letter varchar(399)

update xyz set letter = 
	case when letter = 'a' then 'A'
		when letter = 'A' then 'a'
		when letter = 'b' then 'B'
		when letter = 'B' then 'b' end

		select * from xyz 


create table fruits (id int, name varchar(20))
insert into fruits values (1, 'apple'), (2, 'Mango'), (3, 'banana'),
(4, 'orange'), (5, 'Grapes')

select * from fruits 

select *,  case 
	when 
		ascii(left(name, 1)) >=97 then char(ascii(left(name,1))-32) + substring(name,2,len(name)) 
	when ascii(left(name, 1)) < 97 then char(ascii(left(name,1)) + 32) + substring(name, 2, len(name))
	end  from fruits 

drop database aa 



select *, case when letter = 'a' then 'A'
				when letter = 'A' then 'a'
				when letter = 'b' then 'B'
				when letter = 'B' then 'b'
				else letter end 
				from xyz 


ALTER DATABASE dataanalyst MODIFY NAME = dataanalyst1;


create table abc (id int primary key, age int check(age > 18), salary int, 
name varchar(20) not null, dept_id int not null, constraint fk 
foreign key(dept_id) references departments(id))


create table departments (id int not null, name varchar(20))




alter table departments add constraint pk primary key(id)


alter table departments drop column id

alter table abc drop column dept_id

alter table abc drop constraint fk

alter table abc drop column dept_id

alter table departments drop column id

alter table departments drop constraint pk 


SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'abc';



create table custo (id int primary key, order_id int not null, constraint fk 
foreign key(order_id) references 
orders1 (id) )

drop table custo

create table orders1 (id int constraint pk primary key , item varchar(20))


drop table orders1

alter table orders1 drop column id 

alter table custo drop column order_id

alter table custo drop constraint fk

alter table orders1 drop constraint pk

alter table orders1 drop column id

alter table custo drop column order_id

select * from information_schema.tables 

select * from sys.databases 

select * from information_schema.TABLE_CONSTRAINTS
where table_name in ('customers', 'orders', 'custo')




create table xyz (id int, name varchar(20), age int not null, salary int, dept_id int, 
primary key(id, name), foreign key (dept_id) references departments (id))

create table departments (id int, name varchar(20))

alter table departments alter column id int not null

alter table departments add constraint pk primary key(id)

-----------
create table aaa(id int primary key, name varchar(19) not null, 
age int constraint ck check(age > 18), location varchar(20) default 'city', salary int, mob_no varchar(20) unique)

select * from aaa

drop table aaa

insert into aaa(id, name, age, salary, mob_no) values(110, 'ala', 44, 555, 'agag45')


select cast(age as float) from xyz

alter table aaa drop ck

select * from sys.databases

select * from information_schema.tables 

select * from information_schema.table_constraints

select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS


alter table aaa alter column age int not null

alter table aaa add constraint ck check(age > 23)


alter table aaa add constraint ck check(age > 50)


select * from aaa 


insert into aaa values(1, 'mahendra', 33, 'kgjaih',  8877, 'alg')
 


 select * from information_schema.tables


 select * from employee

 select * from employees_info 





 update employees_info set emp_name = 
 case when age =20 then 'rao' 
		when age = 40 then 'faroz'
		when age = 21 then 'komali'
		when age = 22 then 'saho'
		when age = 23 then 'tarun'
		when age = 24 then 'mahi'
		when age = 40 then 'mari'
		when age = 26 then 'ragav'
		else 'yogesh' 
		end



update employees_info set emp_name = 'sambo', 
salary = 65000 where emp_id = 7



select * from employees_info 


Data Analytics team by 12 %, Software by 14%, HR by 8 %, and remaining by 15%.

select *, 
	case when salary < 55000 then salary 
		when salary between 55000 and 75000 then salary/20
		when salary between 75000 and 90000 then salary/15
		else salary/100 end as updated_salary
		from employees_info 



select department, count(emp_id),  sum(case when 
salary > 75000 then 1 else 0 end)
from employees_info group by department

select department, count(emp_id), count(case when
salary > 75000 then 1 else null end) from employees_info group by department 


select department, count(emp_id),
sum(case when salary > 50000 then 1 else 0 end)*100.0/(select count(*) from 
employees_info)
as greaterthan50k from employees_info group by department 



create table ikk(id int, name int, salary int not null constraint chk1
check(salary > 20000) constraint dfa default 30000 ,
age int null constraint chk check(age > 18), 
department varchar(20) not null , city varchar(20) unique, primary key(id, name))

alter table ikk alter column age int 

alter table ikk add constraint chy check(salary > 40000)

alter table ikk drop constraint chk1 


drop table ikk 

---- null, not null, primary key, foreign key.

----check, default, unique
create table xyr (id int, name varchar(20), primary key(id, name), foreign key(id, name) 
references hh(id1, name1))


drop table xyr 

insert into xyr values (1, 'ram'), (2, 'sam')

select * from xyr 

create table xa(id int unique)
insert into xa values(null), (2)

create table hh(id1 int, name1 varchar(20) primary key(id1, name1))

drop table hh











insert into ikk values(1, 'mahendra', 40000, 40, 


CREATE TABLE Orders (
    order_id INT,
    product_id INT,
    order_date DATE,
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    constraint fk FOREIGN KEY (order_id, product_id)
    REFERENCES Orders(order_id, product_id)
);

drop table orders
drop table orderdetails 

alter table orders drop column order_id 
alter table orderdetails drop column order_id

alter table orderdetails drop constraint fk 



-- references from parent table
-- first we need to delte child table data or constraint.



select * from INFORMATION_SCHEMA.tables



select * from empsa 








update empsa set salary = salary * 0 where department not in ('Engineering', 'HR')

select * from empsa 


insert into empsa select * from empsa 



select * into dataengineer.dbo.emp_a from empsa 

select employee_id, employee_name, salary into dataengineer.dbo.empss from( 
select employee_id, employee_name, salary from empsa )q

select employee_id, count(*) from empsa group by employee_id

select * from empsa order by salary desc, age 

update empsa set salary = 
case when department = 'Engineering' then salary/ 20 
	when department = 'HR' then salary/ 10 
	else salary
	end 






select abs(3-8.9)

select round(4.77703,2)

select floor(4.999999)
select ceiling(4.0000001)
select round(pi(),3)
select sin(20)
select sign(0)

select power(4,4)
select sqrt(4.025)

select 7%7


select len('akga')
select left('mahendra', 3)
select right('mahendra', 4)
select concat('mahe', 'mahendra')  ===> in Mysql, postgres
select 'mahendra' + ' ' + 'aaa'

select ltrim('   mahendra')
select rtrim('mahendra   ')
select len(ltrim('   mahendra'))
select len('    mahendra')
select len(rtrim('mahendra   '))
select len('mahendra      ')
select charindex('a', 'mahendra', charindex('a', 'mahendra')+1)
select replace('mahendra', 'ra', 'saa')

select reverse('mahendra')
select ascii('a')
select ascii('A')
select char(89)
select char(65)
select char(97)
select stuff('mahendra', 1,2, 'tttt') --delete and insert

select 'mahendra' + ' ' + 'sam'
select concat('mahendra', 'mahi')


select * from aaaf 

alter table aaaf add  joining_date date

update aaaf set joining_date = getdate()

select getdate()
select datepart(day, getdate())
select datepart(year, getdate())
select datepart(month, getdate())
select datepart(week, getdate())

select datename(day, getdate())
select datename(year, getdate())
select datename(month, getdate())
select datename(week, getdate())
select datename(weekday, getdate())

select datediff(day, getdate(), '2023-11-22')
select datediff(year, getdate(), '2022')

select dateadd(day, 4, getdate())

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss');

select convert(format(datetime, getdate()), 'YYYY-MM-DD')
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS FormattedDate;

select date_format(getdate(), '%y-%m-%d')


select replace('mahendra', 'ra', 'sa')

select replace ('mahendra is working', 'is', 'own')

select substring('mahendra working', 1, charindex(' ', 'mahendra working')), 
substring('mahendra working', charindex(' ', 'mahaendra working'), len('mahendra working'))

select reverse('mahendra')

select * into empp 
from emp_a where employee_id < 10

select * from empp1 

select * into empp1 from emp_a where 1=2

insert into empp1
select * from emp_a 

select * from empp1 

select employee_id, age, salary into empx
from emp_a 

insert into empx select employee_id, age, salary from emp_a 


select * from empx 

select * from empx
except
select * from empx 


insert into empx values (1, 22, 88000)

select  age, salary from empx 
union
select  salary, age from emp_a 



alter table empx add joining_date date

select * from empx 
update empx set joining_date = '2024-09-30'

select month(joining_date) from empx 

select year(joining_date) from empx

select day(joining_date) from empx

select datename(weekday, joining_date) from empx 

select getdate()

select day(getdate())

SELECT CONVERT(VARCHAR, GETDATE(), 101) AS FormattedDate; -- Output: 'mm/dd/yyyy'

select convert(varchar, getdate(), 101) 

select date_format(getdate, '%m-%d-%y') --mysql
select to_char(getdate, 'YYYY-mm-dd') ---postgres

select * from customers 
select * from orders
select * from shippings 


select c.*, o.*, s.* from customers c right join orders o on c.customerid = o.customerid
right join shippings s on o.orderid = s.order_id


joins
--------
inner, outer(left, right, full), self join, cross join




--- Intro
===========
----Data, info, db, dbms, rdbms, server
-- data types ==> int, char, varchar, float, money, time, date, date time, etc. 
--- SQL Commands ==> DDL, DML, DRL, DCL, TCL
-- DDL(create, alter, drop, truncate)
create database recall

use recall

create table emp(id int, name varchar(20), department varchar(20), salary int, 
age int, gender char(1))

alter table emp add city varchar(20)

alter table emp drop column city 

alter table emp alter column salary money

truncate table emp

select * from emp

drop table emp

---DML (insert, update, delete)
---------
insert into emp values (1, 'mahendra', 'engineering', 10000, 40, 'M'),
(2, 'sai', 'data', 20000, 50, 'M'),
(3, 'teju', 'IT', 40000, 60, 'F')

insert into emp (id, name, salary) values (4, 'gouri', 30000)
,(5, 'hari', 78000)

select * from emp 

update emp set age = 54 

update emp set salary = 66000 

delete emp where id < 5


truncate table emp

---DRL (select)
------
select * from emp

select id, name, gender from emp

-- DCL (grant, revoke)
---------------------------

-- TCL(commit, rollback)
-------------------------------
begin transaction
update emp set salary = 888

rollback

select * from emp 

begin transaction
delete from emp

begin transaction 
insert into emp values (6,'mahi', 'data', 50000, 34, 'M')

commit


----constraints
-------------------
null, not null, unique, primary key, foreign key, default, check

create table emp1(id int primary key, name varchar(20), salary int not null, 
age int check(age>18), joining_date date default getdate())

alter table emp1 add dept_id int foreign key(dept_id) 
references departments(id)

create table departments (id int primary key, name varchar(20))

drop table departments 

select * from emp1
select * from departments 

insert into emp1 values (2, 'mahendra', 5580, 40, '2020/02/08', 201)

insert into departments values (200, 'data'), (201, 'IT')

drop table departments 
drop table emp1 



---clases (where, group by, having, order by, top n, over(), partition by())
===========================================
where ==> filter ==> deltion, updation, retrieving

select * from emp
select * from emp where age < 40

update emp set age = 79 where age = 50

update emp set salary = 400 where department= 'data'

update emp set salary = 500, age = 45 where department = 'IT'

delete from emp where age < 30


select age, count(id) from emp group by age

select department, count(id)  from emp group by department 

select department, count(id) from emp where id < 5
group by department having department = 'data'

select department from emp

select distinct department from emp 

select top 4 * from emp order by name desc

select top 3 id, name from emp 

--operators (arith, string, range, logical, comparision)
==================================================
arith (+, -, /, *, %)
string (like, not like)
range (between, not between)
logical (and, or, not)
comparision (=, !=, <, >, <=, >=)
==================================
select *, salary - 300 from emp 
select *, age * 10 from emp
select *, salary + salary * 10/100 from emp 

select *, age * 10 from emp

select * from emp where id % 2 =0 

select * from emp

select * from emp where name not like 'm_h_'

select * from emp where name like 'm_h_' or salary < 40000 and gender = 'F'

update emp set salary = salary * 1.2 where age > 50 and department = 'data'

select * from emp where not salary < 5000

select * from emp where salary between 100 and 4000

delete from emp where salary between 400 and 450

select * from emp

--system defined functions (math, string, aggregate, date time)
=================================================================
abs(), round(), sqrt(), power(), pi(), sin(), cos(), floor(), ceiling()
-------------
len(), substring(), upper(), lower(), ascii(), char(), charindex(), reverse(), stuff(), 
ltrim(), rtrim(), left(), right()
------------------
day(), month(), year(), datepart, datename, dateadd, datediff, format()
---------------
count(), avg(), min(), max(), sum()

select abs(salary - salary *3) from emp
select round(salary/3.12, 2) from emp 
select floor(4.001)
select ceiling(4.001)
select sqrt(7)
select  pi()
select round(abs(...))

select len(name) from emp
select substring(name, 1, 2) from emp
select charindex('a', name) from emp
select left(name,2) from emp
select right(name, 3) from emp
select ltrim(name) from emp
select rtrim(name) from emp
--select concat(name, department) from emp
select name + department from emp
select reverse(name) from emp
select stuff(name, 1,3, 'hhjhhhh') from emp
select replace(name, 'ra', 'aaaa') from emp

select month('2020-8-8')
select day('2020-8-8')
select year('2020-8-8')

select datepart(day, '2020-8-8')
select datepart(month, '2020-8-8')
select datepart(year, '2020-8-8')
select datename(day, '2020-8-8')
select datename(month, '2020-8-8')
select datename(weekday, '2020-8-8')

select format('2020-8-8', 'yyyy/mm/dd HH:MM:ss')
select format(getdate(), anyformat you want)
--------------
select avg(salary) from emp
select sum(salary) from emp
select min(salary) from emp
select max(salary) from emp
select department, avg(salary) from emp group by department
select department, sum(salary) from emp group by department, gender
select sum(salary), min(salary), max(salary), avg(salary), count(id) from emp
group by gender, department, age

---set operators
==================
union, union all, intersect, except

select * from emp


--copy commands
=================
select * into emp1 from emp where id < 3

select * into emp2 from emp where 1=2 -----only copies structure or schema of table

select * from emp1
select * from emp2

insert into emp2 
select * from emp where department = 'data'

select id, name,department from emp1
except
select id, name, department from emp2

union all
select * from emp2

select * from emp
union all
select * from emp1

select * from emp
union 
select * from emp2

select * from emp
intersect 
select * from emp1

select * from emp
except
select * from emp1

---conditional statements (case when)
---------------------------
---select, update (we can use any of these two)

update emp set salary = 
	case when department = 'IT' then salary * 1.1
		when department = 'data' then salary * 1.2
		else salary end

select *, case when age between 30 and 40 then 'young'
			when age between 41 and 60 then 'old'
			when age > 60 and age < 80 then 'senior citizen'
			else 'nothing' end from emp

select department, count(emp_id),  count(case when salary < 1000 then 1 else null end) 
as number_of_emps_lessthan1000salary from emp where department = 'data'
group by department

select * from emp


-- percentage of employees workign in each dept
select department, round(count(id)*100.0/(select count(id) from emp),2)
from emp group by department 

select count(*) from emp

select *, salary+age+dept_id from emp



------to see all databases from the given server
select * from sys.databases
select * from information_schema.tables
select * from information_schema.table_constraints

----joins
==============
inner, outer(left, right, full), self, cross



select sum(marks) from table

select count(*) from table

