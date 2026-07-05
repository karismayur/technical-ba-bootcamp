-- Return the 5 newest transactions.
SELECT *
FROM transactions
ORDER BY created_at DESC
LIMIT 5;


-- Return every unique transaction type.
SELECT DISTINCT transaction_type
FROM transactions;

-- Return all debit transactions ordered from largest withdrawal to smallest withdrawal.
-- Largest withdrawal is the most negative number, so we want to order by amount ascending.
SELECT * 
FROM transactions
WHERE amount < 0
ORDER BY amount ASC;


-- Change transaction 3 to FAILED
SELECT * 
FROM transactions
WHERE transaction_id = 3;

UPDATE transactions
SET transaction_status = 'FAILED'
WHERE transaction_id = 3;

SELECT * 
FROM transactions;

-- Delete transaction 999.
DELETE 
FROM transactions
WHERE transaction_id = 999;