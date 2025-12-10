select

key_id,
tournament_id,
tournament_name,
stage_number,
stage_name,
group_name,
position,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code,
played,
wins,
draws,
losses,
goals_for,
goals_against,
goal_difference,
points,
advanced

from {{ source("fifa_world_cup", "group_standings") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'