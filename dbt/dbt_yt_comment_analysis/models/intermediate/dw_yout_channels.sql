{{
    config(
        materialized = 'incremental'
        ,unique_key = 'channel_id'
        ,on_schema_change = 'sync_all_columns'
    )
}}

WITH
    base AS (
        SELECT
            channel_id
            ,title
            ,description_en
            ,custom_url
            ,published_at_timestamp
            ,localized_title
            ,localized_description
            ,country
        FROM {{ref('dl_dbt_yout_channel_items')}}
        WHERE
            1 = 1

            {% if is_incremental() %}

                AND published_at_timestamp >=
                    (SELECT 
                        max(published_at_timestamp)
                    FROM {{this}})

            {% endif %}
)
SELECT
    channel_id
    ,title
    ,description_en
    ,custom_url
    ,published_at_timestamp
    ,localized_title
    ,localized_description
    ,country
FROM base
