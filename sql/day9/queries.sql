/*
Day 9
Topic: Window Functions Part 2

Concepts:
- LAG()
- LEAD()
- Comparing current vs previous row
- Consecutive event detection
*/

-- Previous transaction amount

SELECT
    account_id,
    created_at,
    amount,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY created_at
    ) AS previous_amount
FROM transactions;


-- Next transaction amount

SELECT
    account_id,
    created_at,
    amount,
    LEAD(amount) OVER (
        PARTITION BY account_id
        ORDER BY created_at
    ) AS next_amount
FROM transactions;


-- Amount change from previous transaction

SELECT
    account_id,
    created_at,
    amount,

    amount -
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY created_at
    ) AS amount_change

FROM transactions;


-- Transactions where amount increased from previous transaction

WITH transaction_history AS (

    SELECT
        *,
        LAG(amount) OVER (
            PARTITION BY account_id
            ORDER BY created_at
        ) AS previous_amount

    FROM transactions

)

SELECT *
FROM transaction_history
WHERE amount > previous_amount;