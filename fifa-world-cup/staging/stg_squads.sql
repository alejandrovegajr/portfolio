select

key_id,
tournament_id,
tournament_name,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code,
player_id,
family_name as last_name,
given_name as first_name,
shirt_number,
position_name,
position_code

from {{ source("fifa_world_cup", "squads") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'