WITH source AS (
    SELECT * 
    FROM {{ ref('stg_customer_rating') }}
)

SELECT
    customer_rating_id,
    customer_fk,
    courier_fk,
    customer_rating_value,
    customer_rating_comment
FROM source