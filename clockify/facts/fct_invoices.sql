select

{{ dbt_utils.generate_surrogate_key(['client_id']) }} as client_key,
{{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_key,

date_issued,
currency,
amount

from {{ ref('stg_invoice') }}