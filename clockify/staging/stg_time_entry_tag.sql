select

time_entry_id,
tag_id

from {{ source('clockify', 'time_entry_tag') }}