-- Find customers who own both a CHECKING and a SAVINGS account, and all account are active.
SELECT customers.customer_id, customers.first_name, customers.last_name
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.status = 'ACTIVE'
GROUP BY customers.customer_id, customers.first_name, customers.last_name
HAVING count(DISTINCT accounts.account_type) > 1;



-- Customers whose total balance exceeds the average customer balance.
WITH total_balance AS (
    SELECT SUM(balance) AS SUM_BALANCE, customer_id
    FROM accounts
    GROUP BY customer_id
)

SELECT customers.customer_id, customers.first_name, customers.last_name, total_balance.SUM_BALANCE
FROM total_balance JOIN customers
ON total_balance.customer_id = customers.customer_id
WHERE SUM_BALANCE > (SELECT AVG(SUM_BALANCE) FROM total_balance); 





-- Customers with more than one account
SELECT customers.customer_id, customers.first_name, customers.last_name
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name
HAVING COUNT(DISTINCT account_id) > 1;

-- Customers with exactly one account
SELECT customers.customer_id, customers.first_name, customers.last_name
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name
HAVING COUNT(DISTINCT account_id) = 1;



-- Customers with at least one FAILED transaction
WITH failed_accounts AS (
    SELECT DISTINCT transactions.account_id, accounts.customer_id
    FROM transactions JOIN accounts 
    ON transactions.account_id = accounts.account_id
    WHERE transaction_status = 'FAILED'
)

SELECT DISTINCT customers.customer_id, customers.first_name, customers.last_name
FROM failed_accounts JOIN customers
ON failed_accounts.customer_id = customers.customer_id;



-- Find customers who have never had a FAILED transaction.
SELECT * FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT accounts.customer_id
    FROM accounts JOIN transactions
    ON accounts.account_id = transactions.account_id
    WHERE transactions.transaction_status = 'FAILED'
);

-- Calculate the total balance held in CHECKING accounts and SAVINGS accounts
SELECT account_type,SUM(balance) as total_balance
FROM accounts
GROUP BY account_type
ORDER BY total_balance DESC;


--  Show the number of trasactions each customer made.
SELECT customers.customer_id, customers.first_name, customers.last_name, COUNT(*) AS total_transactions
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
JOIN transactions
ON accounts.account_id = transactions.account_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name;



-- Find the customer who has the highest total balance across all their accounts.
WITH customer_balance AS (
    SELECT SUM(balance) AS total_balance, customer_id,
    DENSE_RANK() OVER (
        ORDER BY SUM(balance) DESC
    ) as rank
    FROM accounts
    GROUP BY customer_id
)

SELECT customers.first_name, customers.last_name, customer_balance.total_balance
FROM customers JOIN customer_balance
ON customers.customer_id = customer_balance.customer_id
WHERE customer_balance.rank = 1;



-- 
WITH failed_customers AS (
    SELECT DISTINCT accounts.customer_id
    FROM accounts JOIN transactions
    ON accounts.account_id = transactions.account_id
    WHERE transactions.transaction_status = 'FAILED'
    GROUP BY accounts.customer_id
)


    SELECT DISTINCT accounts.customer_id, customers.first_name, customers.last_name
    FROM accounts JOIN transactions
    ON accounts.account_id = transactions.account_id
    JOIN customers
    ON accounts.customer_id = customers.customer_id
    WHERE transactions.transaction_status = 'POSTED' AND accounts.customer_id IN (SELECT * from failed_customers)
    GROUP BY accounts.customer_id, customers.first_name, customers.last_name;



-- Find the accounts with the highest trasanction count.

WITH transactions_count AS (
SELECT transactions.account_id, COUNT(transactions.transaction_id) AS total_transactions, 
DENSE_RANK() OVER(
    ORDER BY COUNT(transactions.transaction_id) DESC
) AS rank
FROM transactions 
GROUP BY transactions.account_id
)

SELECT * from transactions_count
WHERE rank = 1;


-- "I want to know which customers have accounts that have never had a transaction."
SELECT customers.first_name, customers.last_name, customers.customer_id, accounts.account_id
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
LEFT JOIN transactions 
ON accounts.account_id = transactions.account_id
WHERE transactions.transaction_id IS NULL;



WITH ranked_balances AS (
    SELECT customer_id, account_id, balance,
    DENSE_RANK() OVER (
        PARTITION BY customer_id
        ORDER BY balance DESC
    ) AS rank
    FROM accounts
)

SELECT * FROM ranked_balances
WHERE rank = 1;













