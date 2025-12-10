select

{{ dbt_utils.generate_surrogate_key(['tournament_id']) }} as tournament_key,
{{ dbt_utils.generate_surrogate_key(['match_id']) }} as match_key,
{{ dbt_utils.generate_surrogate_key(['home_team_id']) }} as home_team_key,
{{ dbt_utils.generate_surrogate_key(['away_team_id']) }} as away_team_key,

score,
home_team_score,
away_team_score,
home_team_score_margin,
away_team_score_margin,
extra_time,
penalty_shootout,
score_penalties,
home_team_score_penalties,
away_team_score_penalties,
result,
home_team_win,
away_team_win,
draw

from {{ ref('stg_matches') }}