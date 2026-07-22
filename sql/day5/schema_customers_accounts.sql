
-- create a database schema for customers  with customer_id as primary key
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    address VARCHAR(100)
);


-- create a database schema for accounts with account_id as primary key and customer_id as foreign key referencing customers table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_number VARCHAR(20),
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

