INSERT INTO countries (country_name, region)
Values('Hong Kong', 'Asia')

INSERT INTO countries (country_name, region)
Values('Hong Kong', 'Asia')

INSERT INTO countries (country_name, region)
Values('Portugal', 'Europe')

INSERT INTO clubs (club_name)
Values('Real Madrid')

INSERT INTO clubs (club_name)
Values('Barcelona')

INSERT INTO players (full_name, country_id, birth_date, dominant_foot, current_club_id)
Values('Lionel Messi', '2', '01/01/1986', 'LEFT', '1')

INSERT INTO players (full_name, country_id, birth_date, dominant_foot, current_club_id)
Values('Andres Iniesta', '1', '01/01/1986', 'RIGHT', '1')

INSERT INTO players (full_name, country_id, birth_date, dominant_foot, current_club_id)
Values('Xavi', '1', '01/01/1986', 'RIGHT', '1')

INSERT INTO players (full_name, country_id, birth_date, dominant_foot, current_club_id)
Values('Segio Ramos', '1', '01/01/1986', 'RIGHT', '2')

INSERT INTO players (full_name, country_id, birth_date, dominant_foot, current_club_id)
Values('Ronaldo', '3', '01/01/1984', 'RIGHT', '2')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('1', '2', 5, 0, '01/01/2011')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('2', '1', 2, 6, '01/10/2011')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('1', '2', 4, 0, '01/01/2013')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('1', '2', 5, 1, '01/03/2011')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('2', '1', 1, 2, '01/01/2013')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('2', '1', 1, 0, '01/01/2014')

INSERT INTO matches (home_team, away_team, home_score, away_score, date)
Values('1', '2', 3, 2, '01/01/2015')

INSERT INTO goal_scorings(scorer_id, minutes, is_own_goal, is_penalty, team, match_id)
select '1', 89, FALSE, FALSE, 1, 1

INSERT INTO goal_scorings(scorer_id, minutes, is_own_goal, is_penalty, team, match_id)
select '1', 60, FALSE, FALSE, 1, 1

INSERT INTO goal_scorings(scorer_id, minutes, is_own_goal, is_penalty, team, match_id)
select '5', 20, FALSE, TRUE, 2, 4

INSERT INTO goal_scorings(scorer_id, minutes, is_own_goal, is_penalty, team, match_id)
select '4', 5, TRUE, FALSE, 2, 1

