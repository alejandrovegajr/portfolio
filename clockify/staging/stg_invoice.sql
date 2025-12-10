select

id as invoice_id,
client_id,
user_id,
bill_from,
cast(issued_date as date) as date_issued,
cast(due_date as date) as date_due,
currency,
amount / 100 as amount,
balance / 100 as balance,
subtotal / 100 as subtotal,
paid / 100 as paid,
status as invoice_status

from {{ source('clockify', 'invoice') }}