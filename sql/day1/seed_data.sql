INSERT INTO transactions (
    account_id,
    transaction_type,
    amount,
    transaction_status,
    created_at,
    posted_at,
    description
)
VALUES
    (101, 'SALARY', 5000.00, 'POSTED', '2026-07-01 09:00:00', '2026-07-01 09:01:00', 'Monthly Salary'),
    (101, 'DEBIT_CARD', -8.50, 'POSTED', '2026-07-01 10:15:00', '2026-07-01 10:16:00', 'Starbucks'),
    (101, 'INTERAC_TRANSFER', -100.00, 'POSTED', '2026-07-02 14:35:00', '2026-07-02 14:36:00', 'Transfer to John'),
    (101, 'ATM_WITHDRAWAL', -60.00, 'POSTED', '2026-07-03 18:10:00', '2026-07-03 18:11:00', 'Downtown ATM'),
    (101, 'REFUND', 25.99, 'POSTED', '2026-07-04 11:20:00', '2026-07-04 11:21:00', 'Amazon Refund');
    
INSERT INTO transactions
(account_id,
 transaction_type,
 amount,
 transaction_status,
 created_at,
 posted_at,
 description)

VALUES

(101, 'INTERAC_TRANSFER', -250.00, 'POSTED',
 '2026-07-04 14:35:00',
 '2026-07-04 14:36:00',
 'Rent payment to Alex'),

(101, 'DEBIT_CARD', -45.99, 'POSTED',
 '2026-07-04 15:10:00',
 '2026-07-04 15:11:00',
 'Walmart Grocery');


 



