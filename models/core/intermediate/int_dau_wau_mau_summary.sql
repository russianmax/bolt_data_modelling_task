WITH activity_data AS (
    SELECT
        courier_fk AS courier_id,
        DATE(session_start_timestamp) AS activity_date
    FROM {{ ref('fct_courier_session') }}
    WHERE session_start_timestamp IS NOT NULL
),

daily_active_users AS (
    SELECT
        activity_date AS date,
        COUNT(DISTINCT courier_id) AS dau
    FROM activity_data
    GROUP BY activity_date
),

weekly_active_users AS (
    SELECT
        DATE_TRUNC('week', activity_date) AS week_start_date,
        COUNT(DISTINCT courier_id) AS wau
    FROM activity_data
    GROUP BY week_start_date
),

monthly_active_users AS (
    SELECT
        DATE_TRUNC('month', activity_date) AS month_start_date,
        COUNT(DISTINCT courier_id) AS mau
    FROM activity_data
    GROUP BY month_start_date
)

SELECT
    d.date AS activity_date,
    COALESCE(d.dau, 0) AS daily_active_users,
    COALESCE(w.wau, 0) AS weekly_active_users,
    COALESCE(m.mau, 0) AS monthly_active_users
FROM daily_active_users d
LEFT JOIN weekly_active_users w ON d.date = w.week_start_date
LEFT JOIN monthly_active_users m ON d.date = m.month_start_date