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
home_team_id,
{{ rename_world_cup_home_team_name('home_team_name') }} as home_team_name,
home_team_code,
away_team_id,
{{ rename_world_cup_away_team_name('away_team_name') }} as away_team_name,
away_team_code,
score,
home_team_score,
away_team_score,
home_team_score_margin,
away_team_score_margin,
extra_time,
penalty_shootout,
score_penalties,
home_team_score_penalties,
away_team_score_penalties,
result,
home_team_win,
away_team_win,
draw

from {{ source("fifa_world_cup", "matches") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'