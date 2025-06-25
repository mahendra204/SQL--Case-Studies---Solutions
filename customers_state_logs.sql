drop table customer_state_log

create table customer_state_log (
    user_id varchar(10),
    state int,
    timestamp datetime2
);

insert into customer_state_log values
('U001', 1, '2024-11-26 07:00:00'),
('U001', 0, '2024-11-26 09:30:00'),
('U001', 1, '2024-11-26 12:00:00'),
('U001', 0, '2024-11-26 14:30:00'),
('U001', 1, '2024-11-26 16:00:00'),
('U001', 0, '2024-11-26 19:30:00'),
('U002', 1, '2024-11-26 08:00:00'),
('U002', 0, '2024-11-26 09:30:00'),
('U002', 1, '2024-11-26 11:00:00'),
('U002', 0, '2024-11-26 12:30:00'),
('U002', 1, '2024-11-26 15:00:00'),
('U002', 0, '2024-11-26 16:30:00'),
('U003', 1, '2024-11-26 09:00:00'),
('U003', 0, '2024-11-26 10:30:00'),
('U004', 1, '2024-11-26 10:00:00'),
('U004', 0, '2024-11-26 10:30:00'),
('U004', 1, '2024-11-26 14:00:00'),
('U004', 0, '2024-11-26 15:30:00'),
('U005', 1, '2024-11-26 10:00:00'),
('U006', 1, '2024-11-26 11:30:00'),
('U005', 0, '2024-11-26 14:30:00'),
('U005', 1, '2024-11-26 15:30:00'),
('U006', 0, '2024-11-26 16:00:00'),
('U005', 0, '2024-11-26 18:30:00');

--Q) Given customers time log detailes. Return highest time spending customer. 

select * from customer_state_log

with logins as(
select *, row_number() over(partition by user_id order by user_id, timestamp) as rn
from customer_state_log where state = 1), 
logouts as(
select *, row_number() over(partition by user_id order by user_id, timestamp) as rn
from customer_state_log where state = 0), 
cte as(
select logins.user_id, logins.timestamp as logintime, 
logouts.timestamp as logouttime from logins, logouts where logins.rn = logouts.rn and 
logins.user_id = logouts.user_id), 
cte2 as(
select user_id, sum(datediff(minute, logintime, logouttime)/60.0) totaltime from cte
group by user_id), 
cte3 as(
select *, DENSE_RANK() over(order by totaltime desc) as drnk from cte2 )
select user_id from cte3 where drnk = 1 








select * from logins 




