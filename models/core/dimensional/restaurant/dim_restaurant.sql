WITH source AS (
    SELECT * 
    FROM {{ ref('stg_restaurant') }}
)

SELECT
    restaurant_id,
    city_fk
    restaurant_name,
    restaurant_address,
    restaurant_geo_coordinates,
    restaurant_contact_info
FROM source
