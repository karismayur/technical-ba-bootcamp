# Statement Download — Swimlane

## Participants

| Customer | Banking UI | Statement API | Database |
|---|---|---|---|
| Select account/date range/format | | | |
| Click Download | | | |
| | Validate input | | |
| | Send request | | |
| | | Authenticate/authorize | |
| | | Validate request | |
| | | Request account and transaction data | Retrieve data |
| | | Generate statement | |
| | | Return success/error | |
| | Start download | | |
| | Display error | | |

## Responsibilities

### Customer

- Selects the account.
- Selects statement period and format.
- Initiates the download.

### Banking UI

- Collects input.
- Performs frontend validation.
- Sends the API request.
- Initiates download on success.
- Displays customer-friendly errors.

### Statement API

- Authenticates/authorizes the request.
- Performs backend validation.
- Retrieves required data.
- Applies statement business rules.
- Coordinates statement generation.
- Returns success/error information.

### Database

- Stores and retrieves customer, account and transaction data.

## Key Observation

The database is responsible for data persistence and retrieval; it should not be assumed to generate the downloadable statement.
