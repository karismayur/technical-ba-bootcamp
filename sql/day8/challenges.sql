-- Remove Duplicate Records

WITH duplicate_transactions AS (
    SELECT *,
    ROW_NUMBER() OVER (
    PARTITION BY account_id, amount, created_at 
    ORDER BY transaction_id
    ) AS row_num 
    FROM transactions 
)

SELECT * FROM duplicate_transactions 
 WHERE row_num = 1;


--  Show duplicate records

WITH duplicate_transactions AS (
    SELECT *,
    ROW_NUMBER() OVER (
    PARTITION BY account_id, amount, created_at 
    ORDER BY transaction_id
    ) AS row_num 
    FROM transactions 
)

SELECT * FROM duplicate_transactions 
 WHERE row_num > 1;


-- Show the second highest account balance 
WITH ranked_accounts AS (

    SELECT *, DENSE_RANK() OVER (
    ORDER BY balance DESC
    ) AS dense_rank
    FROM accounts
)

SELECT * FROM ranked_accounts
   WHERE dense_rank = 2;

-- Show the top 2 highest balances, including ties.
WITH ranked_accounts AS (

    SELECT *, DENSE_RANK() OVER (
    ORDER BY balance DESC
    ) AS dense_rank
    FROM accounts
)

SELECT * FROM ranked_accounts
   WHERE dense_rank <= 2;



