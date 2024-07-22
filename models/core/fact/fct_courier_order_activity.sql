WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier_order_activity') }}
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