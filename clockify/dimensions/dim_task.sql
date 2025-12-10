select

{{ dbt_utils.generate_surrogate_key(['task_id']) }} as task_key,
{{ dbt_utils.generate_surrogate_key(['project_id']) }} as project_key,

name as task_name,
billable,
status as task_status,

from {{ ref('stg_task') }}