# Statement JSON Review

## Sample Response

```json
{
  "statement_id": "ST12345",
  "account_id": "ACC789",
  "period": {
    "start_date": "2026-07-01",
    "end_date": "2026-07-31"
  },
  "currency": "INR",
  "opening_balance": 45000,
  "closing_balance": 38250,
  "transactions": [
    {
      "transaction_id": "TX1001",
      "date": "2026-07-05",
      "type": "DEBIT",
      "status": "POSTED",
      "amount": 2500,
      "description": "Electricity Bill"
    }
  ]
}
```

## Review Findings

### Existing useful fields

- Statement ID
- Account ID
- Statement period
- Currency
- Opening balance
- Closing balance
- Transaction list

### Transaction information to clarify

The transaction object should distinguish:

- `type`: `DEBIT` or `CREDIT`
- `status`: `POSTED`, `PENDING`, `FAILED`, or `REVERSED`

These represent different business concepts.

Additional fields to consider:

- Transaction timestamp
- Reference number
- Beneficiary/merchant
- Running balance

### Customer ID

Confirm whether `customer_id` is required in the response. If the account is already associated with the authenticated customer, it may be unnecessary.

### Format

Confirm whether `format` belongs in the response. If the response represents raw statement data, format may only be relevant to the request. If the response represents a generated file, the contract may instead need a file/download reference.

## Key BA Question

Does the response represent:

1. underlying statement data, or
2. the generated downloadable document?

This should be confirmed with Engineering/Product before finalizing the API contract.
