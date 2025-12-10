select

{{ dbt_utils.generate_surrogate_key(['tournament_id']) }} as tournament_key,

stage_number,
stage_name,
group_stage,
knock_out_stage,
unbalanced_groups,
start_date,
end_date,
count_matches,
count_teams,
count_scheduled,
count_replays,
count_playoffs,
count_walkovers

from {{ ref('stg_tournament_stages') }}