select

{{ dbt_utils.generate_surrogate_key(['tournament_id']) }} as tournament_key,

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

from {{ ref('stg_tournaments') }}