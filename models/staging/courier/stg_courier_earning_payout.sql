WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'courier_earning_payout') }}
)

SELECT
    id AS payout_id,
    payout_amount AS payout_amount,
    payout_date AS payout_date,
    next_payout_date AS next_payout_date,
    created_at AS created_at,
    updated_at AS updated_at,
    status AS payout_status,
    courier_id AS courier_fk
FROM source