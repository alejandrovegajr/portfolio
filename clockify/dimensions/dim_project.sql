select

{{ dbt_utils.generate_surrogate_key(['project_id']) }} as project_key,
{{ dbt_utils.generate_surrogate_key(['client_id']) }} as client_key,

name,
public,
archived,
hourly_rate_amount,
hourly_rate_currency,
billable

from {{ ref('stg_project') }}