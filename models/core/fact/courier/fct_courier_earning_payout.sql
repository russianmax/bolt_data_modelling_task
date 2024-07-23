WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier_earning_payout') }}
)

SELECT
    payout_id,
    courier_fk,
    payout_amount,
    payout_date,
    next_payout_date,
    created_at,
    updated_at,
    payout_status
FROM source