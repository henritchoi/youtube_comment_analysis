with
    source AS (
        SELECT * from {{ source('youtube', 'dl_yout_comment_thread_items') }}
    )
SELECT
    int64_field_0 AS upload_id
    ,kind AS entity_type
    ,etag
    ,id	AS comment_thread_id
    ,snippet_channelId AS
    ,snippet_videoId AS video_id
    ,snippet_topLevelComment_kind AS top_level_comment_type
    ,snippet_topLevelComment_etag AS top_level_comment_etag
    ,snippet_topLevelComment_id AS top_level_comment_id
    ,snippet_topLevelComment_snippet_channelId AS top_level_comment_channel_id
    ,snippet_topLevelComment_snippet_videoId AS top_level_comment_video_id
    ,snippet_topLevelComment_snippet_textDisplay AS top_level_comment_text_display 
    ,snippet_topLevelComment_snippet_textOriginal AS top_level_comment_text_original 
    ,snippet_topLevelComment_snippet_authorDisplayName AS top_level_comment_author_display_name 
    ,snippet_topLevelComment_snippet_authorProfileImageUrl AS top_level_comment_profile_imag_url 
    ,snippet_topLevelComment_snippet_authorChannelUrl AS top_level_comment_author_channel_url 
    ,snippet_topLevelComment_snippet_authorChannelId_value AS top_level_comment_author_channel_id 
    ,snippet_topLevelComment_snippet_canRate AS top_level_comment_can_rate 
    ,snippet_topLevelComment_snippet_viewerRating AS top_level_comment_viewer_rating 
    ,snippet_topLevelComment_snippet_likeCount AS top_level_comment_like_count 
    ,snippet_topLevelComment_snippet_publishedAt AS top_level_comment_published_at 
    ,snippet_topLevelComment_snippet_updatedAt AS top_level_comment_updated_at 
    ,snippet_canReply as can_reply 
    ,snippet_totalReplyCount AS total_reply_count 
    ,snippet_isPublic AS is_public 
from source

