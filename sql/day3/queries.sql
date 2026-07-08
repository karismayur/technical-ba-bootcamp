
-- show me every transaction that is currently PENDING"
SELECT * 
FROM transactions
WHERE transaction_status = 'PENDING';


-- show only Debit Card transactions that are still Pending.
SELECT * FROM transactions
WHERE transaction_status = 'PENDING' 
AND transaction_type = 'DEBIT_CARD'; 

-- show all transactions that need attention -- failed or pending
SELECT * 
FROM transactions
WHERE transaction_status = 'PENDING'
OR transaction_status = 'FAILED';


-- show all transactions that need attention -- failed, pending, or reversed
SELECT *
FROM transactions
WHERE transaction_status IN ('PENDING', 'FAILED','REVERSED');


-- show me all transactions that are either a Debit Card, ATM Withdrawal, or Interac Transfer
SELECT *
FROM transactions
WHERE transaction_type IN (
    'DEBIT_CARD', 
    'ATM_WITHDRAWAL',
    'INTERAC_TRANSFER'
    );


-- Show me all transactions that took place between July 2, 2026, and July 3, 2026.
SELECT *
FROM transactions
WHERE created_at BETWEEN '2026-07-02 00:00:00' 
                     AND '2026-07-03 23:59:59';

-- Customer Support remembers that the transaction description contained the word 'Payment', but they don't remember the full description.
-- LIKE is case sensitive 
SELECT * 
FROM transactions
WHERE description LIKE '%Payment';
-- ILIKE is case insensitive
SELECT * 
FROM transactions
WHERE description ILIKE '%Payment';

-- Show me all transactions that have not yet been posted to the account.
SELECT *
FROM transactions
WHERE posted_at IS NULL;


















