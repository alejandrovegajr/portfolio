select

id as time_entry_id,
project_id,
task_id,
user_id,
workspace_id,
is_locked,
cost_rate_amount,
cost_rate_currency,
description,
type,
billable,
hourly_rate_amount / 100 as hourly_rate,
hourly_rate_currency,
time(time_interval_start) as time_start,
time(time_interval_end) as time_end,
time(timestamp_seconds(time_diff(time(time_interval_end), time(time_interval_start),second))) as total_time,

from {{ source('clockify', 'time_entry') }}