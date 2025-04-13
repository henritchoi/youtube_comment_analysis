with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_channel_items') }}
    )
SELECT
    int64_field_0 AS upload_id
    ,kind AS entity_type
    ,etag	
    ,id AS channel_id
    ,snippet_title	AS title
    ,snippet_description AS description_en
    ,snippet_customUrl AS custom_url
    ,snippet_publishedAt AS published_at_timestamp
    ,snippet_thumbnails_default_url	AS thumbnails_default_url
    ,snippet_thumbnails_default_width AS thumbnails_default_width
    ,snippet_thumbnails_default_height AS thumbnails_default_height
    ,snippet_thumbnails_medium_url AS thumbnails_medium_url
    ,snippet_thumbnails_medium_width AS thumbnails_medium_width
    ,snippet_thumbnails_medium_height AS thumbnails_medium_height
    ,snippet_thumbnails_high_url AS thumbnails_high_url
    ,snippet_thumbnails_high_width AS thumbnails_high_width
    ,snippet_thumbnails_high_height AS thumbnails_high_height
    ,snippet_localized_title AS localized_title
    ,snippet_localized_description AS localized_description
    ,snippet_country AS country
from source

