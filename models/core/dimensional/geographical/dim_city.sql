WITH source AS (
    SELECT * 
    FROM {{ ref('stg_city') }}
)

SELECT
    city_id,
    country_fk,
    city_name,
    city_code
FROM source
