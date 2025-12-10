select

{{ dbt_utils.generate_surrogate_key(['tournament_id']) }} as tournament_key,
{{ dbt_utils.generate_surrogate_key(['team_id']) }} as team_key,
{{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_key,

first_name,
last_name,
concat(first_name,' ',last_name) as player_name,
shirt_number,
position_name,
position_code

from {{ ref('stg_squads') }}