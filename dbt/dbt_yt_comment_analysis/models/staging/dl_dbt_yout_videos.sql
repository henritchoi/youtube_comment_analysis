with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_videos') }}
    )
SELECT
    int64_field_0 as upload_id
    ,kind as entity_type
    ,etag
    ,items
    ,pageInfo_totalResults	
    ,pageInfo_resultsPerPage
from source