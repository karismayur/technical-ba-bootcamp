-- q1
SELECT accounts.customer_id
FROM accounts JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE transactions.transaction_status = 'POSTED'
GROUP BY accounts.customer_id
HAVING COUNT(transactions.transaction_id) > 3;

-- q2
SELECT customers.customer_id, customers.first_name, customers.last_name
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.status = 'ACTIVE'
GROUP BY customers.customer_id, customers.first_name, customers.last_name
HAVING COUNT(DISTINCT accounts.account_type) > 1;


-- q3
SELECT customers.customer_id, customers.first_name, customers.last_name
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE transactions.transaction_status = 'FAILED'
GROUP BY customers.customer_id, customers.first_name, customers.last_name
HAVING customers.customer_id IN (
    SELECT accounts.customer_id
    FROM accounts JOIN transactions
    ON accounts.account_id = transactions.account_id
    WHERE transactions.transaction_status = 'POSTED' 
);



-- q4


WITH ranked_accounts AS (
      SELECT customer_id, account_id, balance, 
      DENSE_RANK() OVER (
        PARTITION BY customer_id
        ORDER BY balance DESC
      ) AS rank
       FROM accounts
) 

SELECT customer_id, account_id, balance
FROM ranked_accounts
WHERE rank = 1;    

-- q13
SELECT customers.customer_id, SUM(accounts.balance) AS total_balance
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id;
ODER BY total_balance DESC
LIMIT 1;


WITH customer_balance AS (
    
    SELECT customers.customer_id, SUM(accounts.balance) AS total_balance,
    DENSE_RANK() OVER (
        ORDER BY SUM(accounts.balance) DESC
    ) AS rank
    FROM customers JOIN accounts
    ON customers.customer_id = accounts.customer_id
    GROUP BY customers.customer_id
)

SELECT customer_balance.customer_id, customer_balance.total_balance
FROM customer_balance
WHERE customer_balance.rank = 1;







