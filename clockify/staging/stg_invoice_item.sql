select

invoice_id,
unit_price / 100 as unit_price,
amount / 100 as amount,
quantity / 100 as quantity,
description,
orders

from {{ source('clockify', 'invoice_item') }}