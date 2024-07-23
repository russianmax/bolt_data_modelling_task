WITH orders AS (
    SELECT
        order_id,
        courier_fk,
        order_earnings
    FROM {{ ref('fct_orders') }}
),

courier AS (
    SELECT
        courier_id,
        courier_name,
        current_city_fk
    FROM {{ ref('dim_courier') }}
),

city AS (
    SELECT
        city_id,
        city_name
    FROM {{ ref('dim_city') }}
),

activity AS (
    SELECT
        order_fk,
        activity_timestamp,
        activity_type
    FROM {{ ref('fct_courier_order_activity') }}
),

courier_performance AS (
    SELECT
        city.city_name AS city_name,
        orders.courier_fk AS courier_id,
        courier.courier_name AS courier_name,
        DATE(activity.activity_timestamp) AS date,
        COUNT(orders.order_id) AS total_orders,
        SUM(orders.order_earnings) AS total_earnings,
        AVG(orders.order_earnings) AS average_earnings_per_order,
        COUNT(CASE WHEN activity.activity_type = 'Accepted' THEN 1 END) AS accepted_orders,
        COUNT(CASE WHEN activity.activity_type = 'Declined' THEN 1 END) AS declined_orders
    FROM orders
    LEFT JOIN courier ON courier.courier_id = orders.courier_fk
    LEFT JOIN city ON courier.current_city_fk = city.city_id
    LEFT JOIN activity ON orders.order_id = activity.order_fk
    GROUP BY city.city_name, orders.courier_fk, courier.courier_name, DATE(activity.activity_timestamp)
)

SELECT
    date,
    city_name,
    courier_id,
    courier_name,
    total_orders,
    total_earnings,
    average_earnings_per_order,
    accepted_orders,
    declined_orders
FROM courier_performance