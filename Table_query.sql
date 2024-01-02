
--Check all the goal scoring event in history
select p.full_name, minutes, c.club_name, m.date from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
join matches m on m.match_id = g.match_id

--Check all the goal scoring event in history that is not a own_goal
select p.full_name, minutes, c.club_name, m.date from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
join matches m on m.match_id = g.match_id
where g.is_own_goal is FALSE

--Check all the goal scoring event in history that is by a penalty
select p.full_name, minutes, c.club_name, m.date from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
join matches m on m.match_id = g.match_id
where g.is_penalty is TRUE

--Check the player who scores the most in 2011
select p.full_name, c.club_name from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
join matches m on m.match_id = g.match_id
where EXTRACT('Year' from m.date) = '2011'
LIMIT 1

--Create a view to check the number of goals by each player in 2011
CREATE OR REPLACE VIEW goals_scorers_2011 AS
select p.full_name, c.club_name, count(g.score_id) from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
join matches m on m.match_id = g.match_id
where EXTRACT('Year' from m.date) = '2011'
group by p.full_name, c.club_name

--Check the top 2 goal_scorer in 2011
select * from goals_scorers_2011 limit 2


--check on every matches between Barcelona and Real Madrid in 2011
select c.club_name as home_team, cc.club_name as away_team, m.home_score, m.away_score, m.date from matches m
join clubs c on m.home_team = c.club_id
join clubs cc on m.away_team = cc.club_id
where EXTRACT('Year' from m.date) = '2011' and
((c.club_name = 'Barcelona' and cc.club_name = 'Real Madrid') OR (cc.club_name = 'Barcelona' and c.club_name = 'Real Madrid'))

--Indicates how many matches Barcelona won in 2011
select 
COUNT(Case When (home_score > away_score) and c.club_name = 'Barcelona' then 'Wins'
When (away_score > home_score) and cc.club_name = 'Barcelona' then 'Wins'
END)
from matches m
join clubs c on m.home_team = c.club_id
join clubs cc on m.away_team = cc.club_id
where EXTRACT('Year' from m.date) = '2011'

--Get a full picture which players score in each match
select p.full_name, c.club_name as player_club_name, m.date as match_date, 
cc.club_name as home_team, ccc.club_name as away_team 
from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
join matches m on m.match_id = g.match_id
join clubs cc on m.home_team = cc.club_id
join clubs ccc on m.away_team = ccc.club_id
where g.is_own_goal is FALSE

--who is the youngest player scores in history and is left-footed
select p.full_name, c.club_name, p.birth_date from goal_scorings g
join players p on p.player_id = g.scorer_id
join clubs c on c.club_id = g.team
where p.dominant_foot = 'LEFT' and g.is_own_goal = 'FALSE'
ORDER BY  birth_date  desc LIMIT 1

--Who comes from America and scores most goals 
with America_player as (
select * from players p
join countries c on p.country_id = c.country_id	
where c.region = 'America')

select A.full_name, count(*) from goal_scorings g
inner join America_player A on g.scorer_id = A.player_id
group by A.full_name LIMIT 1


