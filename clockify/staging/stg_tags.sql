select

id as tag_id,
workspace_id,
archived,
name

from {{ source('clockify', 'tags') }}