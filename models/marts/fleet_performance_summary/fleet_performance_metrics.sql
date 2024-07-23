WITH country AS (
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

fleet AS (
    SELECT
        fleet_name,
        city_fk,
        fleet_id
    FROM {{ ref('dim_fleet') }}
),

fleet_metrics AS (
    SELECT
        session_date,
        total_couriers,
        total_working_hours,
        total_orders,
        total_earnings,
        current_fleet_fk  -- Ensure this field is included for JOINs
    FROM {{ ref('int_fleet_metrics') }}
),

fleet_performance AS (
    SELECT
        f.fleet_name,
        fm.session_date AS date,
        ci.city_name,
        co.country_name,
        fm.total_couriers AS number_of_couriers_employed,
        fm.total_working_hours AS total_working_hours_provided,
        fm.total_orders,
        fm.total_earnings
    FROM fleet_metrics fm
    JOIN fleet f ON fm.current_fleet_fk = f.fleet_id
    LEFT JOIN city ci ON f.city_fk = ci.city_id
    LEFT JOIN country co ON ci.country_fk = co.country_id
)

SELECT
    fleet_name,
    date,
    city_name,
    country_name,
    number_of_couriers_employed,
    total_working_hours_provided,
    total_orders,
    total_earnings
FROM fleet_performance
