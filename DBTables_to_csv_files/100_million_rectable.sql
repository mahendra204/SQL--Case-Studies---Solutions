
create table employee_100million(emp_id int primary key, 
emp_name varchar(20), department varchar(30),
salary int,  age int, city varchar(40));
----generate sequence of numbers using CTE
with cte as(
select -101 as emp_id
union all
select emp_id + 1 from cte where emp_id < 99)
insert into employee_100million  -------inserting into our required table
----selecting columns from cte we created before
select emp_id, 
case when emp_id % 4 =0 then 'mahi' + cast(emp_id as varchar) 
 when emp_id % 3 =0 then 'mahendra' + cast(emp_id as varchar)
 when emp_id % 5 = 0 then 'saraswathi' + cast(emp_id as varchar)
 when emp_id % 8 =0 then 'surya' + cast(emp_id as varchar)
 when emp_id % 9 =0 then 'maha' + cast(emp_id as varchar)
 else 'ravi' + cast(emp_id as varchar) end as emp_name, ---using conditional statements we can create any names
case when emp_id % 4 =0 then 'HR'
 when emp_id % 5 = 0 then 'Finance'
 when emp_id % 3 = 0 then 'Data Analytics'
 when emp_id % 2 =0 then 'Accounts'
 else 'Software' end as department, ----creating departments using conditional statements
case when emp_id % 2 =0 and emp_id <=1000 then 40000
 when emp_id % 3 =0 and emp_id > 1000 and emp_id < 10000 then 5000
 when emp_id % 4 =0 and emp_id >=10000 and emp_id < 50000 then 24000
 when emp_id % 5 =0 and emp_id >=50000 and emp_id < 500000 then 60000 
 else 100000 end as salary, ----setting the salary limits using conditional statements
case when emp_id % 2 = 0 then (emp_id % 30) + 20 
 when emp_id % 3 =0 then (emp_id % 40) + 17
 when emp_id % 5 = 0 then (emp_id % 20)+ 35
 when emp_id % 8 =0 then (emp_id % 10) + 22
 when emp_id % 9 =0 then (emp_id%30) + 17
 when emp_id % 11 =0 then 18
 else 60 end as age, --setting the age using conditional statements
case when emp_id % 2 = 0 then 'Hyderabad'
 when emp_id % 3 = 0 then 'Bangalore'
 when emp_id % 5 =0 then 'Chennai'
 when emp_id % 11 =0 then 'Mumbai'
 when emp_id % 13= 0 then 'Pune'
 when emp_id % 7 =0 then 'Delhi'
 when emp_id % 17 =0 then 'Ahmadabad'
 else 'kerala' end as city ----- choosing the city using conditional statements
from cte
option (maxrecursion 0)

select count(*) from employee_100million;

