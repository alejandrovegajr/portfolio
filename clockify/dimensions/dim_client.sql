select

{{ dbt_utils.generate_surrogate_key(['client_id']) }} as client_key,

client_name,
client_address,
client_status

from {{ ref('stg_client') }}