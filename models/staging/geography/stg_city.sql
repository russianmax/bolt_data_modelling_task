WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'city') }}
)

SELECT
    id AS city_id,
    name AS city_name,
    code AS city_code,
    country_id AS country_fk
FROM source
