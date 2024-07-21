WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'order') }})

SELECT
    id AS order_id,
    order_item_summary AS order_item_summary,
    order_amount AS order_amount,
    order_earnings AS order_earnings,
    courier_id AS courier_fk,
    restaurant_id AS restaurant_fk
FROM source


