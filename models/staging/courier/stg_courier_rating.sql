WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_rating') }}
)

SELECT
    id AS courier_rating_id,
    rating AS courier_rating,
    comment AS courier_comment,
    rating_ts AS courier_rating_timestamp,
    order_id AS order_fk,
    courier_id AS courier_fk
FROM source
