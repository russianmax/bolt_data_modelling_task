SELECT
    o.courier_fk AS courier_id,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_earnings) AS total_earnings,
    AVG(order_earnings) AS average_earnings_per_order,
    COUNT(CASE WHEN a.activity_type = 'Accepted' THEN 1 END) AS accepted_orders,
    COUNT(CASE WHEN a.activity_type = 'Declined' THEN 1 END) AS declined_orders
FROM {{ ref('fct_orders') }} o
LEFT JOIN {{ ref('fct_courier_order_activity') }} a ON o.order_id = a.order_fk
GROUP BY o.courier_fk