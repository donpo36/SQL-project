
CREATE TABLE clubs (
  	club_id SERIAL PRIMARY KEY,
  	club_name VARCHAR(255)
);

CREATE TABLE countries (
  	country_id SERIAL PRIMARY KEY,
  	country_name VARCHAR(255),
  	region VARCHAR(255)
);


CREATE TABLE players (
  	player_id SERIAL PRIMARY KEY,
	full_name VARCHAR(255),
	country_id int REFERENCES countries(country_id),
	birth_date DATE,
	dominant_foot VARCHAR(10),
	current_club_id int REFERENCES clubs(club_id)
);

CREATE TABLE matches (
  	match_id SERIAL PRIMARY KEY,
	home_team int REFERENCES clubs(club_id),
	away_team int REFERENCES clubs(club_id),
	home_score int,
	away_score int,
	date DATE
);

CREATE TABLE goal_scorings (
  	score_id SERIAL PRIMARY KEY,
	scorer_id int REFERENCES players(player_id),
	minutes int,
	is_own_goal BOOLEAN,
	is_penalty BOOLEAN,
	team int REFERENCES clubs(club_id),
	match_id int REFERENCES matches(match_id)
);


