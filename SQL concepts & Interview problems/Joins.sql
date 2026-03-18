create table empd (empid int, empname varchar(30), mgrid int, salary int)

insert into empd values (1, 'mahendra', 1, 1000),(2,'mahi',1,3000),(3,'monkey',1,200),
(4,'donkey',2,4000),(5,'da',2,3200),(6,'sai',3,2030)

select * from empd

select empid, empname, mgrid, salary from (
select distinct a.empid, a.empname, a.mgrid, a.salary, b.salary as mgrsalary from empd a 
join empd b on b.empid=a.mgrid)a 
where salary > mgrsalary

create table abc (empid int)
insert into abc values (1),(2),(3),(4)
select * from abc
create table xy (id int)
insert into xy values(1),(1),(2),(1),(2),(3),(1)

select * from xy
select * from abc

select count(*) from abc a join xy b on a.empid=b.id ----7

select count(*) from abc a left join xy b on a.empid=b.id  -----8

select count(*) from abc a right join xy b on a.empid=b.id -------7

select count(*) from abc a left outer join xy b on a.empid=b.id where b.id is null ------1 (values which are present only in a not in common or b)

select count(*) from abc a right outer join xy b on a.empid=b.id where a.empid is null -----0

select count(*) from abc a full join xy b on a.empid=b.id --------8

select count(*) from abc a cross join xy b on a.empid=b.id --7

select count(*) from abc a full outer join xy b on a.empid=b.id where a.empid is null or b.id is null -----1 (only either a or b not common values


use mahi

create database mahi

select * from mm
create table mm(id int, name char(8), salary int)