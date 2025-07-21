use SQLPrep

create table person (personId int, firstname varchar(40), lastname varchar(40))
create table address(addressid int, personId int, city varchar(30), state varchar(30))

select * from person
select * from address

INSERT INTO person
VALUES (1, 'John', 'Doe'),
 (2, 'Jane', 'Smith'),(3, 'Michael', 'Johnson'),
  (4, 'Emily', 'Davis'),
 (5, 'Chris', 'Brown'), (6, 'Jessica', 'Taylor'),
 (7, 'Matthew', 'Wilson'),
(8, 'Ashley', 'Martinez'), (9, 'Joshua', 'Anderson'),
(10, 'Megan', 'Thomas');

INSERT INTO address (addressid, personId, city, state) VALUES
(1, 1, 'New York', 'NY'),
(2, 2, 'Los Angeles', 'CA'),
(3, 3, 'Chicago', 'IL'),
(4, 4, 'Houston', 'TX'),
(5, 5, 'Phoenix', 'AZ'),
(6, 6, 'Philadelphia', 'PA'),
(7, 7, 'San Antonio', 'TX'),
(8, 8, 'San Diego', 'CA'),
(9, 9, 'Dallas', 'TX'),
(10, 10, 'San Jose', 'CA');

--Q1) return persons with their addresses & store this as copy into another table called person_address
select p.personid, concat(p.firstname, p.lastname)
as fullname, a.city, a.state from person p join address a 
on p.personid = a.addressid 

create table person_address  (personid int, fullname varchar(40), city varchar(20), state varchar(30))
---Or
select * into person_address from (
select p.personid, concat(p.firstname, p.lastname)
as fullname, a.city, a.state from person p join address a 
on p.personid = a.addressid )a  where 1=1

insert into person_address select p.personid, concat(p.firstname, p.lastname)
as fullname, a.city, a.state from person p join address a 
on p.personid = a.addressid 


select * from person
select * from address
select * from person_address

----------------------------------------------------------------
--Q2) group persons with their state wise &  also their fullnames,city names in each state(group_concat or str_agg or stuff)
select a.state, count(p.personid) numberofpersons from person p 
join address a on p.personid=a.personid
group by a.state order by 2 desc

select state, count(personid) as number_of_persons, group_concat(fullname, ' ,  ') as persons_names,
group_concat(city, ' , ') as city_names 
from person_address 
group by state order by 2 desc --SQLite, Oracle, MySQL (group_concat)

select * from person_address
select * from person
select * from address
----------------------------------------------------------
--Q3) second highest salary from the employee table. if there is not second highest then return null.
create table employee (id int, salary int)
insert into employee values(1,1000)

select * from employee

select max(salary) second_highest_salary from employee where 
salary<(select max(salary) from employee) --aggregate and comparison operator

insert into employee values(2,2000),(4,2000),(5,2300),(6,4000)

select * from employee
select max(salary) secondhighestsalary from employee where salary<(select max(salary) from employee) -----using aggregate functions & comparision operators

select * from employee where salary in(
select max(salary) from employee where salary<(select max(salary) from employee))

--or ------using top n clause  (SSMS)  ------(limit 1 offset 1 in MySQL)
select top 1 salary as secondhighestsalary from 
(select top 2 salary from employee order by salary desc)a order by a.salary asc

---select * from employee order by salary desc limit 1 offset 1

--Q4) give them rankings based on their earnings (Window Functions)
select * from employee
select id, salary, rank() over(order by salary desc) as rnk from employee  ---skips rank after common values

select id, salary, dense_rank() over(order by salary desc) as rnk from employee ---won't skip any rank

select id, salary, row_number() over(order by salary desc) as rnk from employee --returns different rankings

---Add department column 
alter table employee add dept_name varchar(20)
select * from employee
----update employee table with department names
update employee set dept_name = 'IT' where id>4 
update employee set dept_name = 'Software' where id<4 
update employee set dept_name = 'DataAnalytics' where id=4

select * from employee
----Q5) Update salary for software it is 10%, for IT people is 20% and data professionals it is 40% increments.& store updated table into employeeupdated named table


select * into employeeupdated from(
select *, case
	when dept_name ='Software' then salary*1.1
	when dept_name = 'IT' then salary*1.2
	else salary*1.4 end as updated_salary
from employee)a where 1=2

select * from employeeupdated

drop table employeeupdated

select * into employeeupdated from(
select *, case
	when dept_name ='Software' then salary*1.1
	when dept_name = 'IT' then salary*1.2
	else salary*1.4 end as updated_salary
from employee)a where 1=1
--------------------------------------
create table employeeupdated as        ------SQLite, Oracle
select *, case
	when dept_name ='Software' then salary*1.1
	when dept_name = 'IT' then salary*1.2
	else salary*1.4 end as updated_salary
from employee
------------------------------------------

select * from employeeupdated

---Q6) now return the percentage of increment as another table and store as employeeupdated1
select * into employeeupdated1 from(
select *, concat(cast(round((updated_salary-salary)*100.0/salary,2) as int),'%') as increment from 
employeeupdated)a where 1=1

-------------------- SQLite, Oracle,..
create table employeeupdated1 as
select *, cast(round((updated_salary-salary)*100.0/salary,2) as int) || '%' as increment from 
employeeupdated
---------------------

select * from employeeupdated1
select * from employeeupdated
select * from employee
--drop table employeeupdated1

--Q6) now rank the employees based on updated salary, their department wise , averagesalaries per each dept & return cummilative or rolling sum of total updated salary, give me lead, lag examples of altering their salaries in each department.

select id, dept_name, updated_salary, rank() over( partition by dept_name order by updated_salary desc) as rnk from employeeupdated1  ---skips rank after common values

select id, dept_name, updated_salary, dense_rank() over(partition by dept_name  order by updated_salary desc) as rnk from employeeupdated1  ---won't skip any rank

select id, dept_name, updated_salary, row_number() over(partition by dept_name  order by updated_salary desc) as rnk from employeeupdated1  --returns different rankings

---------------------------
select dept_name, cast(avg(updated_salary) over(partition by dept_name) as int) -------average updated salary in each dept
as avg_sal from employeeupdated 
-------------- rolling average in each department.
select dept_name, updated_salary, avg(updated_salary) 
over(partition by dept_name order by updated_salary) as average_sal from 
employeeupdated 
-----------------------

select id, dept_name, updated_salary, 
sum(updated_salary) over(partition by dept_name order by updated_salary desc) as cum_sum 
from employeeupdated

select * from employeeupdated
select id, dept_name, updated_salary, lag(updated_salary) over(partition by dept_name order by id)
 as previousempsalary from employeeupdated

 select id, dept_name, updated_salary, lead(updated_salary) over(partition by dept_name order by id)
 as previousempsalary from employeeupdated

 ---Now find second highest salary using window functions. (organization wise & department wise)

 select * from employee

 select id, salary, dept_name from (
 select *, rank() over(order by salary desc) as rnk from employee)a where rnk=2

 select id, salary, dept_name from (
 select *, rank() over(partition by dept_name order by salary desc) as rnk from employee) a where rnk=2

 -----it will be same for update salaries in employeeupdated table. 
