select

key_id,
tournament_id,
tournament_name,
match_id,
match_name,
stage_name,
group_name,
group_stage,
knockout_stage,
replayed,
replay,
match_date,

--parsing match time from string to time format
parse_time('%H:%M', match_time) as match_time,

stadium_id,
stadium_name,
city_name,
country_name,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code,
opponent_id,
opponent_name,
opponent_code,
home_team,
away_team,
goals_for,
goals_against,
goal_differential,
extra_time,
penalty_shootout,
penalties_for,
penalties_against,
result,
win,
lose,
draw

from {{ source("fifa_world_cup", "team_appearances") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'