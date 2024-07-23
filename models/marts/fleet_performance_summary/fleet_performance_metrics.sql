WITH fleet_performance AS (
  SELECT
    f.fleet_name,
    fm.session_date as date,
    ci.city_name,
    co.country_name,
    f.fleet_type,
    fm.total_couriers as number_of_couriers_employed,
    fm.total_working_hours as total_working_hours_provided,
    fm.total_orders,
    fm.total_earnings
FROM {{ ref('int_fleet_metrics') }} fm
JOIN {{ ref('dim_fleet') }} f ON fm.current_fleet_fk = f.fleet_id
LEFT JOIN {{ ref('dim_city') }} ci ON f.city_fk = ci.city_id
LEFT JOIN {{ ref('dim_country') }} co ON ci.country_fk = co.country_id
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


