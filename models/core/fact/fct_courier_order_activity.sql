{{ config(
    materialized='incremental',
    unique_key='activity_id'
) }}

WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier_order_activity') }}
    {% if is_incremental() %}
        WHERE activity_timestamp > (SELECT MAX(activity_timestamp) FROM {{ this }})
    {% endif %}
)

SELECT
    activity_id,
    courier_session_fk,
    fleet_fk,
    city_fk,
    activity_type,
    activity_geo_coordinates,
    activity_timestamp,
    order_fk
FROM source