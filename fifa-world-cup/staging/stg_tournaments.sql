select

key_id,
tournament_id,
tournament_name,
year,
start_date,
end_date,
host_country,
winner,
host_won,
count_teams,
group_stage,
second_group_stage,
final_round,
round_of_16,
quarter_finals,
semi_finals,
third_place_match,
final

from {{ source("fifa_world_cup", "tournaments") }}

--excluding Women's World Cups
where tournament_name not like '%Women%'