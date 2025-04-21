{{
    config(
        materialized = 'incremental'
        ,unique_key = 'comment_thread_id'
        ,on_schema_change = 'sync_all_columns'
    )
}}

WITH
    base AS (
        SELECT
            comment_thread_id
            ,video_id
            ,top_level_comment_id
            ,top_level_comment_channel_id
            ,top_level_comment_text_display
            ,top_level_comment_text_original
            ,top_level_comment_author_display_name
            ,top_level_comment_author_channel_id
            ,top_level_comment_like_count
            ,top_level_comment_published_at
        FROM {{ref('dl_dbt_yout_comment_thread_items')}}
        WHERE
            1 = 1

            {% if is_incremental() %}

                AND top_level_comment_published_at >=
                    (SELECT 
                        max(top_level_comment_published_at)
                    FROM {{this}})

            {% endif %}
)
SELECT
    comment_thread_id
    ,video_id
    ,top_level_comment_id
    ,top_level_comment_channel_id
    ,top_level_comment_text_display
    ,top_level_comment_text_original
    ,top_level_comment_author_display_name
    ,top_level_comment_author_channel_id
    ,top_level_comment_like_count
    ,top_level_comment_published_at
FROM base
