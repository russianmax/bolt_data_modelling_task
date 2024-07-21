SELECT
    f.fleet_id,
    f.fleet_name,
    fm.total_couriers,
    fm.total_working_hours,
    fm.total_orders,
    fm.total_earnings
FROM {{ ref('int_fleet_metrics') }} fm
JOIN {{ ref('dim_fleet') }} f ON fm.current_fleet_fk = f.fleet_id
