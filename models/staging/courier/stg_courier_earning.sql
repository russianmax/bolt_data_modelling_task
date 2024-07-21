WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_earning') }}
)

SELECT
    id AS courier_earning_id,
    courier_id AS courier_fk,
    balance_amount AS courier_balance_amount,
    last_payout_date AS courier_last_payout_date
FROM source
