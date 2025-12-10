select

key_id,
tournament_id,
tournament_name,
match_id,
match_name,
match_date,
stage_name,
group_name,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
home_team,
away_team,
player_id,
family_name as last_name,
given_name as first_name,
shirt_number,
position_name,
position_code,
starter,
substitute

from {{ source("fifa_world_cup", "player_appearances") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'