select

workspace_id,
index,
feature,

from {{ source('clockify', 'workspace_feature') }}