WITH source AS (
    SELECT * 
    FROM {{ ref('stg_country') }}
)

SELECT
    country_id,
    country_name,
    country_code
FROM source