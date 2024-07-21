WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'customer_rating') }}
)

SELECT
    id AS customer_rating_id,
    customer_id AS customer_fk,
    courier_id AS courier_fk,
    rating AS customer_rating_value,
    comments AS customer_rating_comment
FROM source