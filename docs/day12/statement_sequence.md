# Statement Download — Sequence Diagram

## Participants

- Customer
- Banking UI
- Statement API
- Database

## Sequence

```text
Customer → Banking UI
Select account, date range and format

Customer → Banking UI
Click Download Statement

Banking UI → Banking UI
Validate required fields and date range

Banking UI → Statement API
Submit statement request

Statement API → Statement API
Authenticate/authorize and validate request

Statement API → Database
Request account and transaction data

Database → Statement API
Return account and transaction data

Statement API → Statement generation logic
Generate statement

Statement generation logic → Statement API
Return statement/result

Statement API → Banking UI
Return success or error

Banking UI → Customer
Start download or display customer-friendly error
```

## Notes

The exact statement-generation architecture should be confirmed with Engineering. The diagram intentionally does not assume that a separate Statement Service must exist.
