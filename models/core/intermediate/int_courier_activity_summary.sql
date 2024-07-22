WITH session_duration AS (
    SELECT
        courier_fk AS courier_id,
        SUM(DATEDIFF(minute, session_start_timestamp, session_end_timestamp)) / 60 AS total_hours
    FROM {{ ref('fct_courier_session') }}
    GROUP BY courier_fk
),

activity_timestamps AS (
    SELECT
        courier_fk AS courier_id,
        MIN(session_start_timestamp) AS first_activity,
        MAX(session_end_timestamp) AS last_activity
    FROM {{ ref('fct_courier_session') }}
    GROUP BY courier_fk
)

SELECT
    s.courier_id,
    s.total_hours,
    a.first_activity,
    a.last_activity,
    c.courier_start_ts AS courier_start_date
FROM session_duration s
LEFT JOIN {{ ref('dim_courier') }} c ON s.courier_id = c.courier_id
LEFT JOIN activity_timestamps a ON s.courier_id = a.courier_id