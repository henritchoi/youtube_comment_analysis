with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_comment_threads') }}
    )
SELECT
    int64_field_0
    ,kind
    ,etag
    ,nextPageToken
    ,items
    ,pageInfototalResults	
    ,pageInforesultsPerPage	
from source

