WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier') }}
)


SELECT
    id AS courier_id,
    current_fleet_id AS current_fleet_fk,
    current_city_id AS current_city_fk,
    name AS courier_name,
    email AS courier_email,
    phone_number AS courier_phone_number,
    bank_details AS courier_bank_details,
    start_ts AS courier_start_ts,
    end_ts AS courier_end_ts
FROM source
