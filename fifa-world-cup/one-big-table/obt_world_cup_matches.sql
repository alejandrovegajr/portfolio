select

b.tournament_name as tournament,
a.team_name,
federation_name,
region_name,
confederation_code,

--array agg with struct created here for match results as matches
array_agg(
struct(c.match_name as match_name,
c.match_date as match_date,
c.stage_name as stage_name, 
d.stage_number as stage_number,
c.home_team_name as home_team,
c.away_team_name as away_team,
c.score as score,
c.home_team_score as home_team_score,
c.away_team_score as away_team_score,
extra_time as extra_time,
penalty_shootout as penalty_shootout,
score_penalties as score_penalties,
home_team_score_penalties as home_team_score_penalties,
away_team_score_penalties as away_team_score_penalites,
case when a.team_name = c.home_team_name and result = 'home team win' then 'win' when result = 'draw' then 'draw' else 'loss' end as result,
case when a.team_name = c.home_team_name and result = 'home team win' then 1 else 0 end as win,
case when a.team_name = c.home_team_name and result = 'home team win' then 0 
     when a.team_name in(c.home_team_name,c.away_team_name) and result = 'draw' then 0
     else 1 end as loss,
case when a.team_name in(c.home_team_name,c.away_team_name) and result = 'draw' then 1 else 0 end as draw)) as matches,
performance as tournament_result,
case when position = 1 then 1 else 0 end as champion,
case when position = 2 then 1 else 0 end as runner_up,
case when position is null then 0 else 1 end as top_three_finish,
case when position is null then 0 else position end as top_three_position,

from {{ ref('stg_teams') }} as a

left join {{ ref('stg_qualified_teams') }} as b on a.team_name = b.team_name
left join {{ ref('stg_matches') }} as c on b.tournament_name = c.tournament_name and (a.team_name = c.home_team_name or a.team_name = c.away_team_name)
left join {{ ref('stg_tournament_stages') }} as d on c.tournament_name = d.tournament_name and c.stage_name = d.stage_name
left join {{ ref('stg_tournament_standings') }} as e on b.tournament_name = e.tournament_name and b.team_name = e.team_name

where b.tournament_name is not null

group by 

b.tournament_name,
team_name,
federation_name,
region_name,
confederation_code,
performance,
position
