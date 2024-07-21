WITH source AS (
    SELECT * 
    FROM {{ ref('stg_order_status') }}
)

SELECT
    order_status_id,
    order_fk
    order_status,
    order_status_timestamp
FROM source