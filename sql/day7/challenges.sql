
-- Our fraud team wants a report of customers whose total balance is over ₹20,000 and who have had at least one failed transaction.
WITH customer_totals AS (
    SELECT customer_id, SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
    HAVING  SUM(balance)  > 20000
), 

failed_customers AS (
    SELECT DISTINCT accounts.customer_id 
    FROM accounts JOIN transactions
    ON accounts.account_id = transactions.account_id
    WHERE transactions.transaction_status = 'FAILED'
)


SELECT customer_totals.customer_id, customers.first_name, customers.last_name, customer_totals.total_balance
FROM customer_totals JOIN customers
ON customer_totals.customer_id = customers.customer_id
JOIN failed_customers
ON customer_totals.customer_id = failed_customers.customer_id;








