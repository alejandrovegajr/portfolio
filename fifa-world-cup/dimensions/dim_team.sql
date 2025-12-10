select

{{ dbt_utils.generate_surrogate_key(['team_id']) }} as team_key,

team_name,
team_code,
federation_name,
region_name,
confederation_name,
confederation_code

from {{ ref('stg_teams') }}