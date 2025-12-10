select

id as invoice_item_time_entry_id,
invoice_item_index,
invoice_item_invoice_id,

from {{ source('clockify', 'invoice_item_time_entry') }}