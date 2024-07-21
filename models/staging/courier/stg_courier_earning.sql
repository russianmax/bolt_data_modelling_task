WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_earning') }}
)

SELECT
    id AS earning_id,
    balance_amount AS balance_amount,
    last_payout_date AS last_payout_date,
    courier_id AS courier_fk
FROM source
