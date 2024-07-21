WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'restaurant') }}
)

SELECT
    id AS restaurant_id,
    city_id AS city_fk,
    name AS restaurant_name,
    address AS restaurant_address,
    geo_coordinates AS restaurant_geo_coordinates,
    contact_info AS restaurant_contact_info
FROM source
