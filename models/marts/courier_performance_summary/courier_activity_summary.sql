WITH couriers AS (
    SELECT
        courier_id,
        courier_name,
        courier_start_ts,
        current_city_fk
    FROM {{ ref('dim_courier') }}
),

courier_activity AS (
    SELECT
        courier_id,
        COALESCE(total_hours, 0) AS total_hours_in_app,
        first_activity,
        last_activity
    FROM {{ ref('int_courier_activity_summary') }}
),

courier_activity_summary AS (
    SELECT
        courier.courier_id,
        courier.courier_name,
        courier.courier_start_ts as courier_start_date,
        COALESCE(courier_activity.total_hours_in_app, 0) AS total_hours_in_app,
        courier_activity.first_activity,
        courier_activity.last_activity
    FROM couriers courier
    LEFT JOIN courier_activity
    ON courier.courier_id = courier_activity.courier_id
)

SELECT
    courier_id,
    courier_name,
    courier_start_date,
    total_hours_in_app,
    first_activity,
    last_activity
FROM courier_activity_summary