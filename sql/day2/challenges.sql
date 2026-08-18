

-- "Can you tell me how many transactions occurred for each transaction type? We want to understand how customers are primarily using the application."
SELECT transaction_type, COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_type; 


-- "Can you provide the number of transactions in each transaction status (POSTED, PENDING, FAILED)?"
SELECT transaction_status, COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_status; 

-- "What is the total amount spent using Debit Card transactions across all customers?"
SELECT ABS(SUM(amount)) AS total_amount
FROM transactions
WHERE transaction_type = 'DEBIT_CARD';

-- "How many Interac Transfer transactions have been performed in total?"
SELECT COUNT(*) AS total_transactions
FROM transactions
WHERE transaction_type = 'INTERAC_TRANSFER';

-- "How many ATM withdrawals has each customer made?"
SELECT account_id, COUNT(*) AS total_atm_withdrawals
FROM transactions
WHERE transaction_type = 'ATM_WITHDRAWAL'
GROUP BY account_id
ORDER BY account_id;

-- "Which customer has spent the most money using their Debit Card?"
SELECT account_id, ABS(SUM(amount)) AS total_debit_card_spending
FROM transactions
WHERE transaction_type = 'DEBIT_CARD'
GROUP BY account_id
ORDER BY total_debit_card_spending DESC;


-- "What is the average Debit Card transaction amount?"
SELECT AVG(amount) AS average_debit_card_transaction
FROM transactions
WHERE transaction_type = 'DEBIT_CARD';

-- "Which transaction type generates the highest number of FAILED transactions?"
SELECT transaction_type , count(*) AS failed_transactions
FROM transactions
WHERE transaction_status = 'FAILED'
GROUP BY transaction_type
ORDER BY failed_transactions DESC;

-- "Can you identify any duplicate transactions based on:account_idtransaction_typeamoun created_at".Return only duplicate groups.
SELECT account_id, transaction_type,amount, created_at,COUNT(*) AS duplicate_count    
FROM transactions
GROUP BY account_id, transaction_type, amount, created_at HAVING COUNT(*) > 1;

-- "Rank all accounts by the total number of transactions they have performed."
SELECT account_id, count(*) AS total_transactions
FROM transactions
GROUP BY account_id 
ORDER BY total_transactions DESC;

-- "Which transaction type moves the most money through the bank?"
SELECT transaction_type, SUM(ABS(amount)) AS total_amount
FROM transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;

-- "For each transaction type, what is the average transaction amount?"
SELECT transaction_type, AVG(ABS(amount)) AS average_amount
FROM transactions
GROUP BY transaction_type;

-- "Which account has the highest number of FAILED transactions?"
SELECT account_id, count(*) AS total_failed_transactions
FROM transactions
WHERE transaction_status = 'FAILED'
GROUP BY account_id
ORDER BY total_failed_transactions DESC;

-- "For every account, what is the largest withdrawal they have made?"
SELECT account_id, MIN(amount) AS largest_withdrawal
FROM transactions
WHERE amount < 0
GROUP BY account_id;


-- "How much money has each customer spent in total across all outgoing transaction types?"
SELECT account_id, SUM(ABS(amount)) AS total_spent
FROM transactions
WHERE amount < 0
GROUP BY account_id
ORDER BY total_spent DESC;

-- Show the total amount of all transactions of type 'DEBIT_CARD'.
SELECT SUM(amount) AS total_amount
FROM transactions
WHERE transaction_type = 'DEBIT_CARD';

-- Show the average amount of all transactions of type 'DEBIT_CARD'.
SELECT AVG(amount) AS average_amount
FROM transactions
WHERE transaction_type = 'DEBIT_CARD';


-- Show the largest withdrawal (most negative amount) in the transactions table.
SELECT MIN(amount) AS largest_withdrawal
FROM transactions
WHERE amount < 0;


-- "Which account has spent the most money using their Debit Card?"
SELECT account_id, SUM(amount) FROM transactions
WHERE transaction_type = 'DEBIT_CARD'
GROUP BY account_id
ORDER BY SUM(amount) ASC;
















