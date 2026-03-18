
--Problem Statement:
----------------------
-- Q.Implement Lag or Lead Values (Only for Numeric Data) Without Using Lag() 
--or Lead() Window Functions. 

select * from employees 
  
select *, lag(name, 2, 'unknown') over(
order by id ) prev_emp_name,
lead(name, 2, 'unknown') over(
order by id ) next_emp_name from employees 

select *, lag(salary, 1, 1000) over(
order by id ) prev_emp_salary,
lead(salary, 1, 1000) over(
order by id) next_emp_salary from employees 

select *, isnull(sum(salary) over(order by id rows between 2 preceding
and 2 preceding), 0) prev_emp_salary, 
sum(salary) over(order by id rows between 2 following and 2 following) 
next_emp_salary from employees 


1 preceding
current
1 following



