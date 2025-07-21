use meanlifestudies

create table Product_Launches (
    Year int,
    Company_name varchar(20),
    ProductName varchar(20)
)

insert into Product_Launches values (2019, 'Apple', 'iPhone 11'),
(2019, 'Apple', 'iPhone 12'),(2019, 'Apple', 'iPhone 11s'),
(2019, 'Apple', 'MacBook Pro 16'),(2020, 'Apple', 'MacBook Air M1'),
(2020, 'Apple', 'iPhone 12'),(2019, 'Samsung', 'Galaxy S10'),(2019, 'Samsung', 'Galaxy S11'),
(2019, 'Samsung', 'Galaxy S12'),(2020, 'Samsung', 'Galaxy S20'),(2019, 'Google', 'Pixel 4'),
(2020, 'Google', 'Pixel 6s'),(2019, 'Microsoft', 'Surface Pro 7'),(2019, 'Microsoft', 'Surface Pro 7pro'),
(2020, 'Microsoft', 'Surface Pro X'),(2019, 'Samsung', 'Galaxy Note 10'),(2020, 'Samsung', 'Galaxy Note 20'),
(2019, 'Google', 'Pixel 3a'),(2020, 'Google', 'Pixel 4a'),(2019, 'Microsoft', 'Surface Laptop 3'),
(2020, 'Microsoft', 'Surface Go 2'),(2019, 'Apple', 'Apple Watch Series 5'),(2020, 'Apple', 'Apple Watch Series 6'),
(2019, 'Samsung', 'Galaxy Fold'),(2020, 'Samsung', 'Galaxy Z Fold 2'),(2020, 'Samsung', 'Galaxy Z Fold 3'),
(2020, 'Samsung', 'Galaxy Z Fold 3s'),(2020, 'Google', 'Pixel 5'),(2020, 'Google', 'Pixel 6')

select * from product_launches

with cte as(
select year, company_name, count(productname) number_of_products from Product_Launches 
group by year, company_name)
select company_name, sum(case when year = 2020 then number_of_products else 0 end) - 
sum(case when year = 2019 then number_of_products else 0 end) as num_products_diff
from cte group by company_name


create table cricket (name varchar(20), role varchar(20), performance int)
insert into cricket values('virat', 'bat', 29),('rohit', 'bat',38),('gill', 'bat',47),('sreyas', 'bat',54),('shami','ball', 5),
('shardul', 'ball',2),('axar', 'ball',3),('buvi','ball', 1)

select * from cricket

drop table cricket

with cte as(
select *, rank() over(partition by role order by performance desc) rnk from cricket)
, cte2 as(select * from cte where role = 'ball'),
cte3 as(select * from cte where role = 'bat')
select a.name as 'bowler', b.name as 'batsman',a.rnk from cte2 a left join cte3 b on a.rnk =b.rnk
