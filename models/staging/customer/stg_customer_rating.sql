WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'customer_rating') }}
)

SELECT
    id AS customer_rating_id,
    rating AS customer_rating,
    comment AS customer_comment,
    rating_ts AS customer_rating_timestamp,
    customer_id AS customer_fk,
    courier_id AS courier_fk
FROM source