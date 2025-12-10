select

id as time_entry_report_id,
client_id,
project_id,
task_id,
user_id,
is_locked,
amount / 100 as amount,
earned_amount / 100 as earned_amount,
description,
type,
billable,
cost_amount,
--adding date field to stg_time_entry_report, using time stamp fields for both time and date
date(time_interval_start) as date,
time(time_interval_start) as time_start,
time(time_interval_end) as time_end,
time(timestamp_seconds(time_diff(time(time_interval_end), time(time_interval_start),second))) as total_time,
rate / 100 as rate,
currency,
cost_rate / 100 as cost_rate,
time_interval_duration,
earned_rate / 100 as earned_rate

from {{ source('clockify', 'time_entry_report') }}