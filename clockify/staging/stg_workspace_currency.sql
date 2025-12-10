select

id as workspace_currency_id,
workspace_id,
code,
is_default

from {{ source('clockify', 'workspace_currency') }}