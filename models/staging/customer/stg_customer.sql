WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'customer') }}
)

SELECT
    id AS customer_id,
    name AS customer_name,
    email AS customer_email,
    phone_number AS customer_phone_number,
    city_id AS city_fk
FROM source

