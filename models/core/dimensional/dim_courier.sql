WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier') }}
)

SELECT
    courier_id,
    current_fleet_fk,
    current_city_fk
    courier_name,
    courier_email,
    courier_phone_number,
    courier_bank_details,
    courier_start_ts,
    courier_end_ts
FROM source
