WITH activity_summary AS (
    SELECT
        c.courier_id,
        c.courier_name,
        a.courier_start_date,
        COALESCE(a.total_hours, 0) AS total_hours_in_app,
        COALESCE(a.first_activity, NULL) AS first_activity,
        COALESCE(a.last_activity, NULL) AS last_activity
    FROM {{ ref('dim_courier') }} c
    LEFT JOIN {{ ref('int_courier_activity_summary') }} a ON c.courier_id = a.courier_id
)

SELECT  
        courier_id,
        courier_name,
        courier_start_date,
        total_hours_in_app,
        first_activity,
        last_activity
FROM activity_summary