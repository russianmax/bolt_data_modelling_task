WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'restaurant') }}
)

SELECT
    id AS restaurant_id,
    name AS restaurant_name,
    location AS restaurant_location,
    geo_coordinates AS restaurant_geo_coordinates,
    contact_info AS restaurant_contact_info,
    city_id AS city_fk
FROM source
