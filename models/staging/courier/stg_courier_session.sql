WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_session') }}
)

SELECT
    id AS session_id,
    courier_id AS courier_fk,
    session_start_ts AS session_start_timestamp,
    session_end_ts AS session_end_timestamp,
    status AS session_status
FROM source