{{
    config(
        materialized = 'incremental'
        ,unique_key = 'video_id'
        ,on_schena_change = 'sync_all_columns'
    )
}}

WITH
    base AS (
        SELECT
            video_id
            ,published_at_timestamp
            ,title
            ,en_description
            ,channel_id
            ,channel_title
            ,category_id
            ,tags
            ,default_audio_language
        FROM {{ref('dl_dbt_yout_video_items')}}
        WHERE
            1 = 1

            {% if is_incremental() %}

                published_at_timestamp >=
                    (SELECT 
                        max(published_at_timestamp)
                    FROM {{this}})

            {% endif %}
)
SELECT
    video_id
    ,published_at_timestamp
    ,title
    ,en_description
    ,channel_id
    ,channel_title
    ,category_id
    ,tags
    ,default_audio_language
FROM base
