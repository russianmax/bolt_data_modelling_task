WITH source AS (
    SELECT * 
    FROM {{ ref('stg_fleet') }}
)

SELECT
    fleet_id,
    city_fk,
    fleet_name,
    fleet_type,
    fleet_contact_info,
    fleet_start_ts,
    fleet_end_ts
FROM source
