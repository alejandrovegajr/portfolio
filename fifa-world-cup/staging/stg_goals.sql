select

key_id,
goal_id,
tournament_id,
tournament_name,
match_id,
match_name,
match_date,
stage_name,
group_name,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code,
home_team,
away_team,
player_id,
family_name as last_name,
given_name as first_name,
shirt_number,
player_team_id,
player_team_name,
player_team_code,
minute_label,
minute_regulation,
minute_stoppage,
match_period,
own_goal,
penalty

from {{ source("fifa_world_cup", "goals") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'