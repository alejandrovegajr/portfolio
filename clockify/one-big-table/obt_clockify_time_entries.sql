select

c.name as user_name,
email as user_email,
client_name,
client_address,
client_status,
d.name as project_name,

--array agg with struct for time entries
array_agg(
struct(e.name as task_name,
description,
type,
a.billable,
date,
time_start,
time_end,
total_time as time_worked,
rate,
currency,
earned_amount)) as time_entry,

count(distinct d.name) as total_projects,

--sums hh:mm:ss values
concat(
cast((sum(extract(hour from total_time)) + floor(sum(extract(minute from total_time))/60)) as string),':',
cast((mod(sum(extract(minute from total_time)),60) + floor(sum(extract(second from total_time))/60)) as string),':',
cast(mod(sum(extract(second from total_time)),60) as string)) as total_time_worked,

sum(earned_amount) as total_earned_amount

from {{ ref('stg_time_entry_report') }} as a

left join {{ ref('stg_client') }} as b on a.client_id = b.client_id
left join {{ ref('stg_users') }} as c on a.user_id = c.user_id
left join {{ ref('stg_project') }} as d on a.project_id = d.project_id
left join {{ ref('stg_task') }} as e on a.task_id = e.task_id

group by

c.name,
email,
client_name,
client_address,
client_status,
d.name