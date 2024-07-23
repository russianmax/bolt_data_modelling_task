WITH source AS (
    SELECT * 
    FROM {{ ref('stg_customer') }}
)

SELECT
    customer_id,
    city_fk,
    customer_name,
    customer_email,
    customer_phone_number,
FROM source
