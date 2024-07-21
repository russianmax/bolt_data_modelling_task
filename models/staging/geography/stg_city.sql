WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'city') }}
)

SELECT
    id AS city_id,
    country_id AS country_fk,
    name AS city_name,
    code AS city_code,
FROM source
