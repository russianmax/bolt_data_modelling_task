WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'country') }}
)

SELECT
    id AS country_id,
    name AS country_name,
    code AS country_code
FROM source

