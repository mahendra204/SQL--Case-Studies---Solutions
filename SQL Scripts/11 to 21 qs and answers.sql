select * from employee_details 

--10. Return employees' details whose salary is higher/lower than the average of all employees' salary. 

select * from employee_details where salary < (select avg(salary) from employee_details) 

with cte as(
select avg(salary) avg_salary from employee_details)
select * from employee_details where salary < (select avg_salary from cte)


--11. Return employees' details whose salary is higher/lower than their department's average salary. 
select * from (
select *,avg(salary) over(partition by department) dept_wise_avg_salary
from employee_details )h
where h.salary < h.dept_wise_avg_salary



--12. Return employees' details whose salary is higher/lower than the employee
--who joined after/before them. 

select * from employee_details 


select * from (
select *, lead(salary) over(order by employee_id) as next_emp_salary, 
lag(salary) over(order by employee_id) as prev_emp_salary from employee_details )h
where h.salary > h.prev_emp_salary 






--13. Return employees' details whose salary is higher/lower than their manager's salary.
select * from employee_details 

with cte as(
select a.*, b.salary as manager_salary from employee_details a join employee_details b
on a.manager_id = b.employee_id)
select * from cte where salary < manager_salary 

--14. Return the second/third highest earning employee details. 

select * from (
select *, dense_rank() over(order by salary desc) drnk from employee_details )a
where a.drnk =3


--15. Return the second/third lowest earning employee details. 

select * from (
select *, dense_rank() over(order by salary) drnk from employee_details )a
where a.drnk =1




--16. Return the second highest/lowest earning employee details in each department.

select * from (
select *, dense_rank() over(partition by department 
order by salary) drnk from employee_details )a
where a.drnk =2



--17. Return the top 3 / top 2 highest earning employee details. 
select * from (
select *, dense_rank() over(
order by salary) drnk from employee_details )a
where a.drnk <=3

--18. Return the top 2 highest/lowest earning employee details in each department.
select * from (
select *, dense_rank() over(partition by department 
order by salary) drnk from employee_details )a
where a.drnk <=2

--19. Return younger/older age employees details in each department. 
select * from (
select *, dense_rank() over(
order by age) drnk from employee_details )a
where a.drnk =1

--20. Return the manager details under whom the highest number of employees work. 
with cte as(
select manager_id, count(employee_id) number_of_employees from employee_details 
group by manager_id ), cte2 as(
select *, dense_rank() over(order by number_of_employees desc) drnk from cte), 
cte3 as(
select * from cte2 where drnk = 1)
select a.* from employees a join cte3 c on c.manager_id = a.employee_id 



select * from employee_details 


