WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'orders') }}
)

SELECT
    id AS order_id,
    courier_id AS courier_fk,
    restaurant_id AS restaurant_fk,
    order_item_summary AS order_item_summary,
    order_amount AS order_amount,
    order_earnings AS order_earnings
FROM source


