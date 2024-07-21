WITH source AS (
    SELECT * 
    FROM {{ ref('stg_courier_earning') }}
)

SELECT
    courier_earning_id,
    courier_fk,
    courier_balance_amount,
    courier_last_payout_date
FROM source