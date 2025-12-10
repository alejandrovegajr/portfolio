select

{{ dbt_utils.generate_surrogate_key(['project_id']) }} as project_key,
{{ dbt_utils.generate_surrogate_key(['task_id']) }} as task_key,
{{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_key,

time_start,
time_end,
total_time,
type,
billable,
hourly_rate,
hourly_rate_currency,
description

from {{ ref('stg_time_entry') }}
