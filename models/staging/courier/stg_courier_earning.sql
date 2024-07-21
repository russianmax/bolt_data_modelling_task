WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_earning') }}
)

SELECT
    id AS earning_id,
    courier_id AS courier_fk,
    balance_amount AS balance_amount,
    last_payout_date AS last_payout_date
FROM source
