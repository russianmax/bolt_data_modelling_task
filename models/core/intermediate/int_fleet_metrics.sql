WITH courier_metrics AS (
    SELECT
        courier_id,
        total_orders,
        total_earnings
    FROM {{ ref('int_courier_metrics') }}
),

session_metrics AS (
    SELECT
        courier_fk AS courier_id,
        SUM(DATEDIFF(hour, session_start_timestamp, session_end_timestamp)) AS total_working_hours
    FROM {{ ref('fct_courier_session') }}
    GROUP BY courier_fk
)



SELECT
    c.current_fleet_fk,
    COUNT(DISTINCT c.courier_id) AS total_couriers,
    COALESCE(SUM(o.total_orders), 0) AS total_orders,
    COALESCE(SUM(o.total_earnings), 0) AS total_earnings,
    COALESCE(SUM(s.total_working_hours), 0) AS total_working_hours
FROM {{ ref('dim_courier') }} c
LEFT JOIN courier_metrics o ON c.courier_id = o.courier_id
LEFT JOIN session_metrics s ON c.courier_id = s.courier_id
GROUP BY c.current_fleet_fk


