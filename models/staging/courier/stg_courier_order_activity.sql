WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_order_activity') }}
)

SELECT
    id AS activity_id,
    courier_session_id AS courier_session_fk,
    fleet_id AS fleet_fk,
    city_id AS city_fk,
    activity_type,
    geo_coordinates AS activity_geo_coordinates,
    activity_ts AS activity_timestamp,
    order_id AS order_fk
FROM source