
-- Show every customer's:

-- First name
-- Last name
-- Account number
-- Account type

SELECT customers.first_name,customers.last_name,
accounts.account_number,accounts.account_type
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id;


-- Show every customer and their current account balance. Sort by highest balance first.
SELECT  customers.first_name, customers.last_name, accounts.account_type,accounts.balance
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
ORDER BY accounts.balance DESC;


-- Emma wants a list of every Checking Account owner.

-- Return:

-- First name
-- Last name
-- Account number
SELECT customers.first_name, customers.last_name, accounts.account_number
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.account_type = 'CHECKING'; 


-- Show every account along with the customer's full name.Sort by account_id.
SELECT accounts.account_id, customers.first_name, customers.last_name,accounts.account_number,accounts.account_type
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
ORDER BY accounts.account_id;

-- Return every customer who owns more than one account.

-- Show:

-- First name
-- Last name
-- Number of accounts
SELECT customers.first_name, customers.last_name, count(customers.customer_id) as num_of_accounts
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id
HAVING count(customers.customer_id) > 1;

-- Emma wants to know how much money each customer has across all of their accounts.

-- Return:

-- Customer name
-- Total Balance

-- Sort highest to lowest.
SELECT customers.first_name, customers.last_name, SUM(accounts.balance) as total_balance
FROM customers JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id
ORDER BY total_balance DESC;

-- Show every transaction together with:

-- Customer name
-- Account type
-- Transaction type
-- Amount
-- Status
SELECT customers.first_name, customers.last_name,accounts.account_type, transactions.transaction_type,transactions.amount,transactions.transaction_status
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id 
JOIN transactions
ON accounts.account_id = transactions.account_id;




-- Emma wants to investigate FAILED transactions.

-- Return:

-- Customer name
-- Account number
-- Transaction type
-- Amount
-- Description
SELECT customers.first_name, customers.last_name,accounts.account_number, transactions.transaction_type,transactions.amount,transactions.description
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id 
JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE transactions.transaction_status = 'FAILED';


-- Which customer has spent the most money?
-- Return:
-- Customer name
-- Total spent
SELECT customers.first_name, customers.last_name, SUM(ABS(transactions.amount)) as total_amount_spent
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id 
JOIN transactions
ON accounts.account_id = transactions.account_id
WHERE transactions.amount < 0
GROUP BY customers.customer_id
ORDER BY total_amount_spent DESC;

-- For every customer show:

-- Customer Name
-- Number of Accounts
-- Number of Transactions
SELECT customers.first_name, customers.last_name, COUNT(DISTINCT accounts.account_id) AS total_accounts, COUNT(transactions.transaction_id) AS total_transactions
FROM customers JOIN accounts 
ON customers.customer_id = accounts.customer_id 
JOIN transactions
ON accounts.account_id = transactions.account_id
GROUP BY customers.customer_id;














