# Statement Download

## User Story

**As a customer,**  
I want to download my bank statement for a selected period,  
so that I can review where my money was spent and credited.

## Functional Requirements

1. The customer should be able to select the account for which the statement is required.
2. The customer should be able to select a start date and end date.
3. The customer should be able to select a supported download format.
4. The UI should validate required fields before submitting the request.
5. The API should independently validate the request.
6. The system should validate that the account belongs to the authenticated customer.
7. The system should provide an appropriate error message if statement generation fails.
8. A statement with no transactions should still be downloadable.
9. Recently downloaded statements may be displayed for convenient access, subject to business rules.
10. The download functionality should be accessible through intuitive navigation and search.

## Non-Functional Requirements

- Statement downloads should complete within an agreed performance threshold.
- Downloaded statements should protect sensitive customer information.
- The statement should be readable across supported screen/document orientations and accessibility settings.
- The service should be available according to agreed banking service availability requirements.
- Technical failures should be logged for monitoring and troubleshooting.

## Edge Cases

- Start date is after end date.
- No transactions exist in the selected period.
- Account was recently opened and is not yet active.
- Account is closed.
- Statement generation temporarily fails.
- The requested format is unsupported.
- The customer is not authorized to access the selected account.

## Acceptance Criteria

### Download statement

**Given** the customer is logged in and is on the statement download page  
**When** the customer selects an account, valid date range and supported format and clicks Download  
**Then** the statement should be generated and downloaded.

### Invalid date range

**Given** the customer is on the statement download page  
**When** the end date is earlier than the start date  
**Then** the UI should display an appropriate validation message and prevent submission.

### Failed download

**Given** the customer has submitted a valid statement request  
**When** statement generation fails  
**Then** the customer should receive a clear, customer-friendly error message.

### No transactions

**Given** the customer selects a valid account and date range with no transactions  
**When** the customer requests the statement  
**Then** the system should generate a statement indicating that there were no transactions during the selected period.
