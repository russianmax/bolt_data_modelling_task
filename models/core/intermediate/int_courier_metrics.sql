 SELECT
        courier_fk as courier_id,
        COUNT(order_id) AS total_orders,
        SUM(order_earnings) AS total_earnings
FROM {{ ref('fct_orders') }} 
GROUP BY courier_id