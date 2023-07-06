use casestudy

drop table teams
create table teams(team_Id int primary key, team_name varchar(20) not null, city varchar(20), captain_Id int)

insert into teams values(1,'CSK','Chennai', 7),(2, 'GT', 'Gujarat', 39),
(3, 'MI', 'Mumbai', 20),(4,'RCB','Bengolore',46),(5,'SRH','Hyderabad', 14),
(6,'LSG','Luknow',98),(7,'DD','Delhi',100),(8,'RR','Rajastan',203)


create table players(player_id int primary key, player_name varchar(20) not null, team_id int, role varchar(20),
salary money, foreign key (team_id) references teams(team_id))

insert into players values(46,'virat',4,'batsman',12000),(7,'dhoni',1,'batsman',11500),(50,'shardul',2,'bowler',6000),
(18, 'Shami', 2, 'bowler', 8000),(25, 'hardik', 3, 'Allrounder', 8500),(32, 'Devilliers', 4, 'Batsman', 10000),
(49, 'pant', 7, 'wicket keeper', 9500),(58, 'KLRahul', 6, 'Allrounder', 7500),(39, 'Gill', 2, 'batsman', 12000),
(72, 'Jadeza', 1, 'Allrounder', 10000),(83, 'Baristow', 5, 'Batsman', 8500),(20, 'Pollard', 3, 'Allrounder', 9500),
(67,'Sanju',8,'Wicketkeepr',9000)

drop table players

create table matches( match_id int primary key, team1_id int, team2_id int, 
match_date date, winner_id int, score_team1 int, score_team2 int, 
foreign key (team1_id) references teams(team_id),
foreign key (team2_id) references teams(team_id),
foreign key (winner_id) references teams(team_id))

drop table matches
insert into matches values
(1, 1, 8, '2022-01-01', 1, 160, 148),(2, 3, 2, '2022-02-01', 3, 140, 97),(3, 8, 7, '2022-03-01', 7, 170, 173),
(4, 2, 5, '2022-04-01', 5, 130, 155),(5, 3, 6, '2022-05-01', 3, 160, 108),(6, 5, 7, '2022-06-01', 7, 158, 179),
(7, 2, 4, '2022-03-01', 2, 182, 179),(8, 5, 3, '2022-04-21', 3, 149, 156),(10, 4, 6, '2022-11-01', 4, 130, 110),
(9, 1, 8, '2022-05-01', 8, 97, 100),(11, 6, 4, '2022-03-01', 4, 123, 129),(12, 8, 1, '2022-04-11', 1, 118, 159),
(13, 7, 5, '2022-01-01', 5, 138, 139),(14, 6, 3, '2022-05-07', 3, 200, 210),(15, 4, 2, '2022-01-01', 4, 195, 186),
(16, 7, 1, '2022-05-08', 1, 182, 190)

select * from matches
select * from teams
select * from players

--Q). What are the names of the players whose salary is greater than or equal to 10000? and how many of them?
select player_name from players where salary>=10000 order by salary desc
select count(*) from players where salary>=10000

--Q) find the total spend by each team on batsmans, bowers and allrounders
select team_id,role, sum(salary) as total_spent from players group by team_id, role 
order by total_spent desc

--Q) list the players in each team
select team_id, 
       stuff((select ',' + player_name
              from players p2
              where p1.team_id = p2.team_id
              for XML path('')), 1, 1, '') as players
FROM players p1
group by team_id

---Q) list the no.of players from each team
select team_id, count(player_id) from players group by team_id

--Q) What is the team name of the player with player_id = 32 and 67.
 with cte as (select p.player_id, t.team_name from 
 players p join teams t on t.team_id=p.team_id)
 select team_name,player_id from cte where player_id = 32 or player_id= 67

 --Q) find no.of players from each team and return team names and no.of players in each team
 select t.team_name, t.team_id, count(p.player_id) as no_of_players_in_each_team from 
 teams t join players p on p.team_id=t.team_id 
 group by t.team_name,t.team_id
 order by no_of_players_in_each_team desc, team_name asc

 --Q) rank the players depending upon the salary they get
 select p.player_name, p.team_id, t.team_name, dense_rank()over(order by salary desc) as rnk,
 p.salary from 
 players p join teams t on t.team_id=p.team_id

 --Q) find top 3 teams who spend more money on players
select top 3 t.team_name as team_name,sum(p.salary) as total_spent from 
players p join teams t on t.team_id=p.team_id 
group by team_name
order by total_spent desc

--Q) What is the team name and captain name of the team_id =4
select team_name, captain from(
select t.team_name,t.team_id, t.captain_id,p.player_name as captain from 
teams t join players p on p.player_id=t.captain_id)a where team_id=4

--Q) What are the player names and their roles in the team with team_id =3,8
with cte as(select p.player_name,t.team_name, t.team_id, p.role from players p join teams t 
on t.team_id=p.team_id)
select player_name,team_name, role from cte where team_id=3 or team_id=8

--Q) What are the team names and the number of matches they have won? and show some rankings in points table use 
-- both rank and dense rank functions to see the difference.
with cte as
(select w.winner_id,count(w.winner_id) as no_of_matches_won from 
matches w group by w.winner_id)
select t.team_name, c.no_of_matches_won,dense_rank() over(order by no_of_matches_won desc) as position_in_points_table from 
cte c join teams t on t.team_id = c.winner_id order by no_of_matches_won desc

with cte as
(select w.winner_id,count(w.winner_id) as no_of_matches_won from 
matches w group by w.winner_id)
select t.team_name, c.no_of_matches_won,rank() over(order by no_of_matches_won desc) as position_in_points_table from 
cte c join teams t on t.team_id = c.winner_id order by no_of_matches_won desc


--Q7) What is the average salary of players in the teams with different cities?
select t.team_name, round(avg(p.salary),2) as average_salary,
 t.city from players p join teams t on t.team_id=p.team_id group by t.city,t.team_name

--Q) Which team won the most matches?
with cte as
(select w.winner_id,count(w.winner_id) as no_of_matches_won from 
matches w group by w.winner_id)
select top 1 t.team_name, c.no_of_matches_won,rank() over(order by no_of_matches_won desc) as position_in_points_table from 
cte c join teams t on t.team_id = c.winner_id order by no_of_matches_won desc 

--Q) What is the date and the total score of the match and return date on which recorded maximum score.
select match_date, score_team1+score_team2 as total_score from matches order by total_score desc

select top 1 match_date from(
select match_date, score_team1+score_team2 as total_score from matches
)a order by total_score desc

select * from matches
select * from players
select * from teams