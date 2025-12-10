select

{{ dbt_utils.generate_surrogate_key(['tournament_id']) }} as tournament_key,
{{ dbt_utils.generate_surrogate_key(['match_id']) }} as match_key,
{{ dbt_utils.generate_surrogate_key(['home_team_id']) }} as home_team_key,
{{ dbt_utils.generate_surrogate_key(['away_team_id']) }} as away_team_key,

stage_name,
group_name,
group_stage,
knockout_stage,
replayed,
replay,
match_date,
match_time,
stadium_name,
city_name,
country_name,

from {{ ref('stg_matches') }}