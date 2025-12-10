select

client_name,
currency,
client_status,
a.invoice_id,
date_issued,
date_due,
a.amount,
balance,
paid,
invoice_status,

--array agg with struct for invoice items
array_agg(
struct(description,
unit_price,
quantity,
b.amount)) as items

from {{ ref('stg_invoice') }} as a

left join {{ ref('stg_invoice_item') }} as b on a.invoice_id = b.invoice_id
left join {{ ref('stg_client') }} as c on a.client_id = c.client_id

group by

client_name,
currency,
client_status,
a.invoice_id,
date_issued,
date_due,
a.amount,
balance,
paid,
invoice_status

order by date_due desc