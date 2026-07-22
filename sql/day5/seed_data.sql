

INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    phone_number,
    address
)
VALUES
(1, 'Olivia', 'Bennett', '9876543210', 'Toronto'),
(2, 'Ethan', 'Brooks', '9123456789', 'Vancouver'),
(3, 'Sophia', 'Carter', '9988776655', 'Calgary');

INSERT INTO accounts (
    account_id,
    customer_id,
    account_number,
    account_type,
    balance,
    status
)
VALUES
(101, 1, 'CHK1001', 'CHECKING', 2500.00, 'ACTIVE'),
(102, 1, 'SAV1001', 'SAVINGS', 18000.00, 'ACTIVE'),
(103, 2, 'CHK1002', 'CHECKING', 950.00, 'ACTIVE'),
(104, 3, 'SAV1002', 'SAVINGS', 12250.00, 'ACTIVE'),
(105, 3, 'CHK1003', 'CHECKING', 425.75, 'ACTIVE');



INSERT INTO accounts (
    account_id,
    customer_id,
    account_number,
    balance,
    account_type,
    status
)
VALUES (
    106,2,'ACC106',5000.00,'SAVINGS','ACTIVE');

