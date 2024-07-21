WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier_rating') }}
)

SELECT
    courier_rating_id,
    courier_fk,
    order_fk,
    courier_rating_value,
    courier_rating_comment
FROM source