select

cast(date as date) as date,
user_id,
remaining_capacity,
break,
time(start_time) as start_time,
time(end_time) as end_time,
time_off,
capacity,
time(timestamp_seconds(total_duration)) as total_duration,
time(timestamp_seconds(overtime)) as overtime,
has_running_entry,
image_url

from {{ source('clockify', 'team_report') }}