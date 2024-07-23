{{ config(
    materialized='incremental',
    unique_key='order_status_id'
) }}

WITH source AS (
    SELECT * 
    FROM {{ ref('stg_order_status') }}
    {% if is_incremental() %}
        WHERE order_status_timestamp > (SELECT MAX(order_status_timestamp) FROM {{ this }})
    {% endif %}
)

SELECT
    order_status_id,
    order_fk,
    order_status,
    order_status_timestamp
FROM source