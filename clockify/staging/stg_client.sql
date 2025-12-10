select

workspace_id,
id as client_id,
name as client_name,
address as client_address,
currency_id,
case when archived is true then 'inactive' else 'active' end as client_status

from {{ source('clockify', 'client') }}