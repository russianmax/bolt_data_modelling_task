WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'fleet') }}
)


SELECT
    id AS fleet_id,
    name AS fleet_name,
    type AS fleet_type,
    contact_info AS fleet_contact_info,
    start_ts AS fleet_start_ts,
    end_ts AS fleet_end_ts,
    city_id AS city_fk
FROM source