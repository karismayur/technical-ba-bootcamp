# Statement API Review

## Purpose

Review the API contract required to support Statement Download.

## Request

Potential request fields:

- `customer_id`
- `account_id`
- `start_date`
- `end_date`
- `format`

## Validation

The backend/API should independently validate:

- Customer identity/authorization.
- Account existence.
- Account ownership by the authenticated customer.
- Valid start and end dates.
- End date is not earlier than start date.
- Supported statement format.

Frontend validation should also be implemented for user experience, but the API must not rely on frontend validation.

## Success Response

The exact response structure should be confirmed with Engineering. Possible fields include:

- `statement_id`
- `account_id`
- statement period
- format
- download reference/URL where applicable
- expiry information where applicable

## Failure Response

The API should return an appropriate status and machine-readable error information.

Example:

```json
{
  "status": "FAILED",
  "error_code": "STATEMENT_GENERATION_FAILED",
  "message": "Unable to generate statement. Please try again later."
}
```

Technical failure details should be logged for monitoring rather than exposed directly to customers.

## BA Questions

- Is `customer_id` required in the response if the customer is already authenticated?
- Does the API return statement data, a generated file, or a download reference?
- Where is PDF generation performed?
- Which transaction statuses should appear on the statement?
- How should statements with no transactions be represented?
