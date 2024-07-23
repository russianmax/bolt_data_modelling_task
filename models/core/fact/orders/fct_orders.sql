{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

WITH source AS (
    SELECT * 
    FROM {{ ref('stg_orders') }}
    {% if is_incremental() %}
        WHERE order_id > (SELECT MAX(order_id) FROM {{ this }})
    {% endif %}
)
SELECT
    order_id,
    courier_fk,
    restaurant_fk,
    order_item_summary,
    order_amount,
    order_earnings
FROM source
