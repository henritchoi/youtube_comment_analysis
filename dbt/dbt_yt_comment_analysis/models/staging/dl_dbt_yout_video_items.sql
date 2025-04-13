with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_video_items') }}
    )
SELECT
    int64_field_0 AS upload_id
    ,kind AS entity_type
    ,etag
    ,id AS video_id
    ,snippet_publishedAt AS published_at_timestamp
    ,snippet_channelId AS channel_id
    ,snippet_title AS title
    ,snippet_description AS description_en
    ,snippet_thumbnails_default_url AS thumbnails_default_url
    ,snippet_thumbnails_default_width AS thumbnails_default_width
    ,snippet_thumbnails_default_height AS thumbnails_default_height
    ,snippet_thumbnails_medium_url AS thumbnails_medium_url
    ,snippet_thumbnails_medium_width AS thumbnails_medium_width
    ,snippet_thumbnails_medium_height AS thumbnails_medium_height
    ,snippet_thumbnails_high_url AS thumbnails_high_url
    ,snippet_thumbnails_high_width AS thumbnails_high_width
    ,snippet_thumbnails_high_height AS thumbnails_high_height
    ,snippet_thumbnails_standard_url AS thumbnails_standard_url
    ,snippet_thumbnails_standard_width AS thumbnails_standard_width
    ,snippet_thumbnails_standard_height AS thumbnails_standard_height
    ,snippet_thumbnails_maxres_url AS thumbnails_marxes_url
    ,snippet_thumbnails_maxres_width AS thumbnails_maxres_width
    ,snippet_thumbnails_maxres_height AS thumbnails_marxes_height
    ,snippet_channelTitle AS channel_title
    ,snippet_tags as tags
    ,snippet_categoryId as category_id
    ,snippet_liveBroadcastContent AS live_broadcast_content
    ,snippet_localized_title as localized_title
    ,snippet_localized_description AS localized_description
    ,snippet_defaultAudioLanguage as default_audio_language
from source