select

key_id,
tournament_id,
tournament_name,
award_id,
award_name,
shared,
player_id,
family_name as last_name,
given_name as first_name,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code

from {{ source("fifa_world_cup", "award_winners") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'