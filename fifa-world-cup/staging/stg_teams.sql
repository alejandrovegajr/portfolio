select

key_id,
team_id,
{{ rename_world_cup_team_name('team_name') }} as team_name,
team_code,
federation_name,
region_name,
confederation_id,
confederation_name,
confederation_code

from {{ source("fifa_world_cup", "teams") }}