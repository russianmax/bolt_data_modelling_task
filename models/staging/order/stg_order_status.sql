WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'order_status') }}
)

SELECT
    id AS order_status_id,
    order_id AS order_fk,
    status AS order_status,
    status_ts AS order_status_timestamp
FROM source
