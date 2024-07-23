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
        fleet_id,
        fleet_type
    FROM {{ ref('dim_fleet') }}
),

fleet_metrics AS (
    SELECT
        session_date,
        total_couriers,
        total_working_hours,
        total_orders,
        total_earnings,
        current_fleet_fk 
    FROM {{ ref('int_fleet_metrics') }}
),

fleet_performance AS (
    SELECT
        fleet.fleet_name,
        fleet.fleet_type,
        fleet_metrics.session_date AS date,
        city.city_name,
        country.country_name,
        fleet_metrics.total_couriers AS number_of_couriers_employed,
        fleet_metrics.total_working_hours AS total_working_hours_provided,
        fleet_metrics.total_orders,
        fleet_metrics.total_earnings
    FROM fleet_metrics 
    JOIN fleet ON fleet_metrics.current_fleet_fk = fleet.fleet_id
    LEFT JOIN city ON fleet.city_fk = city.city_id
    LEFT JOIN country ON city.country_fk = country.country_id
)

SELECT
    fleet_name,
    date,
    city_name,
    country_name,
    fleet_type,
    number_of_couriers_employed,
    total_working_hours_provided,
    total_orders,
    total_earnings
FROM fleet_performance
