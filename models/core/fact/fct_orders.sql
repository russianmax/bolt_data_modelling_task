WITH source AS (
    SELECT * 
    FROM {{ ref('stg_orders') }}
)

SELECT
    order_id,
    courier_fk,
    restaurant_fk,
    order_item_summary,
    order_amount,
    order_earnings
FROM source
