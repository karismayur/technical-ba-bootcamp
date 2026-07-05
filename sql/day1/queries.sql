SELECT *
FROM transactions;

SELECT COUNT(*) AS total_transactions
FROM transactions;

SELECT *
FROM transactions
WHERE transaction_type = 'INTERAC_TRANSFER';

SELECT *
FROM transactions
WHERE amount > 0;

SELECT transaction_type, amount
FROM transactions
WHERE amount < 0;

-- Write a query which returns all transactions of type 'INTERAC_TRANSFER' that were created after July 4, 2026, at 2:00 PM.
SELECT *
FROM transactions  
WHERE transaction_type = 'INTERAC_TRANSFER'
AND created_at >= '2026-07-04 14:00:00';

-- Write a query that returns all transactions from newest to oldest
SELECT *
FROM transactions
ORDER BY created_at DESC;

-- Get the 5 most recent transactions
SELECT *
FROM transactions
ORDER BY created_at DESC
LIMIT 5;


-- Which different transaction types are present in the transactions table?
SELECT DISTINCT transaction_type
FROM transactions;

-- Update the transaction_status of the transaction with transaction_id 2 to 'PENDING'.

SELECT * 
FROM transactions
WHERE transaction_id = 2;


UPDATE transactions
SET transaction_status = 'PENDING'
WHERE transaction_id = 2;

SELECT *
FROM transactions;

-- Delete the transaction with transaction_id 7 from the transactions table.
DELETE 
FROM transactions
WHERE transaction_id = 7;

SELECT *
FROM transactions;
