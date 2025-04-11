with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_videos') }}
    )
SELECT
    int64_field_0
    ,kind
    ,etag
    ,items
    ,pageInfo_totalResults	
    ,pageInfo_resultsPerPage
from source