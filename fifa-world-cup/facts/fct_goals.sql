select

{{ dbt_utils.generate_surrogate_key(['tournament_id']) }} as tournament_key,
{{ dbt_utils.generate_surrogate_key(['match_id']) }} as match_key,
{{ dbt_utils.generate_surrogate_key(['team_id']) }} as team_key,
{{ dbt_utils.generate_surrogate_key(['player_id']) }} as player_key,

minute_label,
minute_regulation,
minute_stoppage,
match_period,
own_goal,
penalty

from {{ ref('stg_goals') }}