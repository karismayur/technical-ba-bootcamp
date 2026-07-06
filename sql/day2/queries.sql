-- Number of transactions by type
SELECT transaction_type, COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_type;

-- Which transaction type has the most transactions? Order the results by transaction_count in descending order.
SELECT transaction_type, COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_type
ORDER BY transaction_count DESC;

-- Number of transactions by status and show which status occurs the most frequently. Order the results by status_count in descending order.
SELECT transaction_status, COUNT(*) AS status_count
FROM transactions
GROUP BY transaction_status
ORDER BY status_count DESC;

-- Show the duplicate transactions
SELECT account_id, transaction_type,amount, created_at,COUNT(*) AS duplicate_count    
FROM transactions
GROUP BY account_id, transaction_type, amount, created_at HAVING COUNT(*) > 1;

-- Show the duplicate transactions with all columns
SELECT * FROM transactions
WHERE (account_id, transaction_type, amount, created_at) IN (
    SELECT account_id, transaction_type, amount, created_at
    FROM transactions
    GROUP BY account_id, transaction_type, amount, created_at
    HAVING COUNT(*) > 1
);









