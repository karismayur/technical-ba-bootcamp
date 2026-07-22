-- Fraud Team wants to investigate large ATM withdrawals.
-- Return every ATM Withdrawal greater than $150.
SELECT * 
FROM transactions
WHERE transaction_type = 'ATM_WITHDRAWAL' AND ABS(amount) > 150;


-- Emma wants every Pending or Failed Interac Transfer.
SELECT *
FROM transactions
WHERE transaction_type = 'INTERAC_TRANSFER' 
AND transaction_status IN (
    'PENDING', 
    'FAILED'
    );


-- Finance wants every Salary and Pension transaction.
SELECT * 
FROM transactions
WHERE transaction_type = 'SALARY' OR transaction_type = 'PENSION';


-- Customer Support remembers the description contains
-- the word "Shop".
-- Find matching transactions.
SELECT *
FROM transactions
WHERE description ILIKE '%shop%';


-- Engineering wants every transaction that was posted
-- successfully.
-- Return only transactions where posted_at has a value.
SELECT *
FROM transactions
WHERE posted_at IS NOT NULL;

-- Fraud wants every outgoing transaction larger than $400.
SELECT *    
FROM transactions
WHERE amount < 0 AND ABS(amount) > 400;


-- Customer Support wants all Pending transactions
-- created on July 3, 2026.
SELECT *
FROM transactions
WHERE transaction_status = 'PENDING' AND 
    created_at BETWEEN '2026-07-03 00:00:00' AND '2026-07-03 23:59:59';

-- Emma wants every transaction except
-- Salary and Refund transactions.
SELECT *
FROM transactions 
WHERE transaction_type NOT IN (
        'SALARY', 'REFUND'
        );

-- Finance wants every Debit Card and ATM Withdrawal that has already been posted.
SELECT * 
FROM transactions
WHERE transaction_type IN ('DEBIT_CARD', 'ATM_WITHDRAWAL') 
AND transaction_status = 'POSTED';

-- Support remembers the description contains the word "Transfer" regardless of upper/lower case.
SELECT *
FROM transactions
WHERE description ILIKE '%transfer%';


-- Engineering wants all Failed transactions that have not yet been posted.
SELECT *
FROM transactions
WHERE transaction_status = 'FAILED' AND POSTED_AT IS NULL;

-- Fraud wants every transaction whose amount is between $100 and $300 in absolute value.
SELECT *
FROM transactions
WHERE ABS(amount) BETWEEN 100 AND 300;



-- "Show me every transaction that could require customer follow-up."
--
-- For today's report, that means:
--
-- • Status is FAILED or PENDING
-- • Amount greater than $200 (outgoing)
-- • Description contains the word "Payment"
--
-- Return all matching transactions.
SELECT *
FROM transactions
WHERE transaction_status IN ('PENDING', 'FAILED') 
AND amount < 0 AND ABS(amount) > 200 
AND description ILIKE '%payment%';
















