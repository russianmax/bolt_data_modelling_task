WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'order_status') }}
)

SELECT
    id AS status_id,
    order_id AS order_fk,
    status AS order_status,
    status_ts AS status_timestamp
FROM source
