WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_rating') }}
)

SELECT
    id AS courier_rating_id,
    order_id AS order_fk,
    courier_id AS courier_fk,
    rating AS courier_rating,
    comments AS courier_comment
FROM source
