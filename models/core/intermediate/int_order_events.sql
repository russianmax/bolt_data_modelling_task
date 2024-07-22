
WITH order_events AS (
    SELECT
        o.order_id,
        MIN(CASE WHEN os.order_status = 'Placed' THEN os.order_status_timestamp END) AS order_placed_at,
        MIN(CASE WHEN os.order_status = 'Ready' THEN os.order_status_timestamp END) AS order_ready_at,
        MIN(CASE WHEN os.order_status = 'Picked Up' THEN os.order_status_timestamp END) AS order_picked_up_at,
        MIN(CASE WHEN os.order_status = 'Delivered' THEN os.order_status_timestamp END) AS order_delivered_at
    FROM {{ ref('fct_orders') }} o
    JOIN {{ ref('dim_order_status') }} os ON o.order_id = os.order_fk
    GROUP BY o.order_id
)

SELECT 
    order_id,
    DATE(order_placed_at) AS order_date, 
    order_placed_at,
    order_ready_at,
    order_picked_up_at,
    order_delivered_at,
    DATEDIFF(minute, order_placed_at, order_delivered_at) AS delivery_time_minutes,
FROM order_events