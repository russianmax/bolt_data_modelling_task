WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'order_status') }}
)

SELECT
    id AS status_id,
    status AS order_status,
    status_ts AS status_timestamp,
    order_id AS order_fk
FROM source
