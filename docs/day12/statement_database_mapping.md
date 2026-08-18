# Statement Database Mapping

## Purpose

Map the Statement Download requirement to the Avalon Bank database.

## Entity Relationship

```text
customers
    |
    | customer_id
    ↓
accounts
    |
    | account_id
    ↓
transactions
```

## Tables and Fields

### customers

- `customer_id`
- `first_name`
- `last_name`

Purpose: identify the customer.

### accounts

- `customer_id`
- `account_id`
- `account_type`
- `balance`
- `status`

Purpose: identify the requested account and account-level information.

### transactions

- `transaction_id`
- `account_id`
- `transaction_date`
- `transaction_type`
- `transaction_status`
- `amount`
- `description`

Purpose: retrieve transactions belonging to the requested account and date range.

## Filtering Rules

Transactions should be filtered using:

- Requested `account_id`
- Requested start date
- Requested end date

The API should also verify that the requested account belongs to the authenticated customer.

## Business Rules to Clarify

- Should `FAILED` transactions appear on statements?
- Should `PENDING` transactions appear?
- How should `REVERSED` transactions be represented?
- Should a statement with no transactions still be generated?
