select

id as task_id,
project_id,
workspace_id,
billable,
duration,
estimate,
name,
budget_estimate,
status

from {{ source('clockify', 'task') }}