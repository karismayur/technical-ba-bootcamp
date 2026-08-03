
CREATE TABLE transactions (
    transaction_id BIGSERIAL PRIMARY KEY,
    account_id BIGINT NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    transaction_status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    posted_at TIMESTAMP,
    description TEXT,

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);


