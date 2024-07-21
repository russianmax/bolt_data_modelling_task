WITH session_duration AS (
    SELECT
        courier_fk AS courier_id,
        SUM(DATEDIFF(minute, session_start_timestamp, session_end_timestamp)) / 60 AS total_hours
    FROM {{ ref('fct_courier_session') }}
    GROUP BY courier_fk
)

SELECT
    s.courier_id,
    s.total_hours as total_hours_since_start,
    c.courier_start_ts as courier_start_date
FROM session_duration s
LEFT JOIN {{ ref('dim_courier') }} c ON s.courier_id = c.courier_id


