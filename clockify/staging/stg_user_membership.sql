select

target_id,
user_id,
hourly_rate_currency,
type,
hourly_rate_amount / 100 as hourly_rate_amount,
status

from {{ source('clockify', 'user_membership') }}