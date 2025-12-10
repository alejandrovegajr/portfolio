select

id as project_id,
client_id,
workspace_id,
duration,
archived,
public,
estimate,
time_estimate_active,
hourly_rate_amount / 100 as hourly_rate_amount,
billable,
time_estimate_type,
time_estimate,
hourly_rate_currency,
name,
time_estimate_include_non_billable

from {{ source('clockify', 'project') }}