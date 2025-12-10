select

key_id,
tournament_id,
tournament_name,
position,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code

from {{ source("fifa_world_cup", "tournament_standings") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'
and position in (1,2,3)