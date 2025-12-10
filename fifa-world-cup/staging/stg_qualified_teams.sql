select

key_id,
tournament_id,
tournament_name,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code,
count_matches,
performance

from {{ source("fifa_world_cup", "qualified_teams") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'