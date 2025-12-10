select

{{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_key,

name as username,
email as user_email,
my_start_of_day as start_of_day,
time_zone,
lang as language,
status as user_status

from {{ ref('stg_users') }}