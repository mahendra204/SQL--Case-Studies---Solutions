-- Functions
------------------
i) System defined or built in functions
-----------> math, string, data and time, aggregate

ii) User defined functions
--------> Scalar valued function
----------> Table valued function ---------> inline and multi statement


---syntax
-----------
create function function_name (@x int)
returns int
as
begin
return @x * num
end

use dataanalyst

alter function func_1 (@x int, @y int, @c int)
returns int
as
begin
declare @result int
set @result = @x*@y*@c
return @result
end

select dbo.func_1(52,28,29) as mutliplication

alter function func_table (@x int, @y varchar(20), @z int)
returns table
as
return (select * from employees where employee_id > @x and salary > @z and department = @y)

select * from dbo.func_table(10, 'Engineering', 40000)


alter function func_table_multi (@x int, @y int)
returns @emp_result table(employee_id int, employee_name varchar(20), salary float)
as
begin
insert into @emp_result
select employee_id, employee_name, salary from employees 
where salary > @x and employee_id < @y
return 
end

select * from dbo.func_table_multi(60000, 5)



select * from employees


