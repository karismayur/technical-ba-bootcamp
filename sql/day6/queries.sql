

-- Using our Avalon Bank schema, write the SQL to return:

-- First name
-- Last name
-- Account number
-- Account type

-- for customers who have never made a transaction.
SELECT customers.first_name, customers.last_name, accounts.account_number, accounts.account_type
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id
LEFT JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE transactions.transaction_id IS NULL;




-- Marketing only wants Savings accounts that have never had a transaction.
SELECT customers.first_name, customers.last_name, accounts.account_number, accounts.account_type
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id
LEFT JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE accounts.account_type='SAVINGS' AND transactions.transaction_id IS NULL;


-- Show all transactions whose amount is greater than the average transaction amount.
SELECT * FROM transactions 
WHERE amount > (
    SELECT AVG(amount) FROM transactions 
    );

-- Find the account(s) with the highest balance.
SELECT * from transactions 
WHERE amount = (
    SELECT MAX(amount) FROM transactions
    );



-- Show customers who own at least one SAVINGS account.
SELECT customers.first_name, customers.last_name 
FROM customers 
WHERE customers.customer_id IN (
    SELECT accounts.customer_id 
    FROM accounts 
    WHERE accounts.account_type = 'SAVINGS');


-- Show customers who do NOT own any SAVINGS account.
SELECT customers.first_name, customers.last_name 
FROM customers 
WHERE customers.customer_id NOT IN (
    SELECT accounts.customer_id 
    FROM accounts 
    WHERE accounts.account_type = 'SAVINGS');


--  Show the customers whose total balance is greater than the avg account balance 
SELECT accounts.customer_id  , SUM(balance) AS total_balance
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id 
GROUP BY accounts.customer_id 
HAVING SUM(balance) > (SELECT AVG(balance) FROM accounts);




