select

id as time_entry_report_tag_id,
time_entry_report_id,

from {{ source('clockify', 'time_entry_report_tag') }}