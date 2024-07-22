WITH courier_performance AS(
   SELECT
    o.courier_fk AS courier_id,
    c.courier_name as courier_name,
    DATE(a.activity_timestamp) AS date,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_earnings) AS total_earnings,
    AVG(order_earnings) AS average_earnings_per_order,
    COUNT(CASE WHEN a.activity_type = 'Accepted' THEN 1 END) AS accepted_orders,
    COUNT(CASE WHEN a.activity_type = 'Declined' THEN 1 END) AS declined_orders
FROM {{ ref('fct_orders') }} o
LEFT JOIN {{ ref('dim_courier') }} c ON c.courier_id = o.courier_fk
LEFT JOIN {{ ref('fct_courier_order_activity') }} a ON o.order_id = a.order_fk
GROUP BY o.courier_fk, c.courier_name, a.activity_timestamp
)

SELECT
    date,
    courier_id,
    courier_name,
    total_earnings,
    average_earnings_per_order,
    accepted_orders,
    declined_orders
FROM courier_performance

