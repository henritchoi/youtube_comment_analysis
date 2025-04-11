with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_channel_items') }}
    )
SELECT
    int64_field_0	
    ,kind	
    ,etag	
    ,id
    ,snippet_title	
    ,snippet_description	
    ,snippet_customUrl	
    ,snippet_publishedAt
    ,snippet_thumbnails_default_url	
    ,snippet_thumbnails_default_width	
    ,snippet_thumbnails_default_height	
    ,snippet_thumbnails_medium_url	
    ,snippet_thumbnails_medium_width	
    ,snippet_thumbnails_medium_height	
    ,snippet_thumbnails_high_url
    ,snippet_thumbnails_high_width	
    ,snippet_thumbnails_high_height
    ,snippet_localized_title
    ,snippet_localized_description
    ,snippet_country
from source

