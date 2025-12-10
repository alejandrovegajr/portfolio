select

key_id,
tournament_id,
tournament_name,
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

from {{ source("fifa_world_cup", "tournament_stages") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'