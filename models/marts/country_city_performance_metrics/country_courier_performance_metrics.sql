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
        current_city_fk
    FROM {{ ref('dim_courier') }} 
),


country AS (
    SELECT
        country_id,
        country_name
    FROM {{ ref('dim_country') }} 
),


city AS (
    SELECT
        city_id,
        country_fk,
        city_name
    FROM {{ ref('dim_city') }} 
),


order_event AS (
    SELECT
        order_id,
        order_date,
        order_placed_at,
        order_ready_at,
        order_picked_up_at,
        order_delivered_at
    FROM {{ ref('int_order_events') }} oe
),

country_courier_performance_metrics AS (
    SELECT
        country.country_id,
        country.country_name,
        order_event.order_date AS date,
        COUNT(DISTINCT courier.courier_id) AS total_couriers,
        COUNT(orders.order_id) AS total_orders,
        SUM(orders.order_earnings) AS total_earnings,
        AVG(DATEDIFF(minutes, order_event.order_placed_at, order_event.order_ready_at)) AS avg_preparation_time,
        AVG(DATEDIFF(minutes, order_event.order_ready_at, order_event.order_picked_up_at)) AS avg_time_to_pickup,
        AVG(DATEDIFF(minutes, order_event.order_placed_at, order_event.order_delivered_at)) AS avg_delivery_time
    FROM orders 
    JOIN courier ON orders.courier_fk = courier.courier_id
    JOIN city ON courier.current_city_fk = city.city_id
    JOIN country ON city.country_fk = country.country_id
    JOIN order_event ON orders.order_id = order_event.order_id
    GROUP BY country.country_id, country.country_name, order_event.order_date
)

SELECT
    country_id,
    country_name,
    date,
    total_couriers,
    total_orders,
    total_earnings,
    avg_delivery_time
FROM country_courier_performance_metrics
