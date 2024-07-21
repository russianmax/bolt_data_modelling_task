WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier_session') }}
)

SELECT
    session_id,
    courier_fk,
    session_start_timestamp,
    session_end_timestamp,
    session_status
FROM source