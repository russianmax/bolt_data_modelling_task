WITH city_metrics AS (
    SELECT
        ci.city_id,
        ci.city_name,
        COUNT(DISTINCT c.courier_id) AS total_couriers,
        COUNT(o.order_id) AS total_orders,
        SUM(o.order_earnings) AS total_earnings,
        AVG(DATEDIFF(day, oe.order_placed_at, oe.order_ready_at)) AS avg_preparation_time,
        AVG(DATEDIFF(day, oe.order_ready_at, oe.order_picked_up_at)) AS avg_time_to_pickup,
        AVG(DATEDIFF(day, oe.order_placed_at, oe.order_delivered_at)) AS avg_delivery_time
    FROM {{ ref('fct_orders') }} o
    JOIN {{ ref('dim_courier') }} c ON o.courier_fk = c.courier_id
    JOIN {{ ref('dim_city') }} ci ON c.current_city_fk = ci.city_id
    JOIN {{ ref('int_order_events') }} oe ON o.order_id = oe.order_id
    GROUP BY ci.city_id, ci.city_name
)

SELECT
    city_id,
    city_name,
    total_couriers,
    total_orders,
    total_earnings,
    avg_delivery_time
FROM city_metrics



