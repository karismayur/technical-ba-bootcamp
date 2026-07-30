

--  SHow the latest transaction for each customer 

WITH ranked_transactions AS (
    
       SELECT customer_id,transaction_id,accounts.account_id,transaction_type,amount,created_at, description,
        ROW_NUMBER() OVER (
           PARTITION BY customer_id
           ORDER BY created_at DESC
       ) AS row_number
       FROM accounts JOIN transactions
       ON accounts.account_id = transactions.account_id

)

SELECT * FROM ranked_transactions JOIN customers
ON ranked_transactions.customer_id = customers.customer_id
WHERE row_number = 1



