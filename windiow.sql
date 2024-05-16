CREATE TABLE EMPLOYEE12 (
EMPLOYEE_ID int, 
NAME VARCHAR(20), 
SALARY int 
);
INSERT INTO EMPLOYEE12(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400),(100,'Jennifer',4400),
(101,'Michael',13000),
(101,'Michael',13000),
(101,'Michael',13000),
(102,'Pat',6000),
(102,'Pat',6000),
(103,'Den',11000);
SELECT * FROM EMPLOYEE12

select employee_id, name, salary, count(*) as numberofrecords from employee12 group by employee_id, name, salary
order by 4 desc

create table x as (select * from( 
select employee_id, name, salary, ROW_NUMBER()Over(partition by employee_id, name order by salary) as rnk from employee12)
where a.rnk=1)
select * from cte

drop table employee12


