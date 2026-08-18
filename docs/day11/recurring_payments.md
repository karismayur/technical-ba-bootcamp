# Recurring Payments / Autopay

## User Story

**As a customer,**  
I want to set up recurring payments,  
so that regular payments can be made automatically without manually initiating each payment.

## Functional Requirements

### Setup

- Customers should be able to create an autopay manually.
- Customers may also be offered an autopay setup action for transactions identified as recurring.
- When created from an existing transaction, relevant fields should be pre-populated.
- The setup form should support:
  - Autopay name
  - Beneficiary/account
  - Payment date
  - Frequency
  - Amount or maximum amount
  - Valid-until/end date
- Customers should be able to save the autopay after required validation.

### Maximum amount

- The customer should be able to define a maximum permitted payment amount where applicable.
- If the payment exceeds the configured maximum, the customer should be prompted according to the agreed confirmation flow.

### Notifications

- Customers should normally receive a notification of the payment status.
- Additional confirmation should only be required where the business rule specifies it.
- Customers may be notified when the account balance is insufficient.

### Pause / Resume

- Customers should be able to pause an active autopay.
- The customer should be able to specify the pause duration/end date.
- Customers may manually resume a paused autopay.
- A paused autopay should have a visible `PAUSED` status.
- No payment should be initiated through a paused autopay.
- The customer should be notified when an autopay automatically resumes if this notification is part of the agreed product behavior.

### Delete

- Customers should be able to delete an autopay according to the agreed data-retention rules.

## Non-Functional Requirements

- Autopay information must be protected in transit and at rest.
- Sensitive information should be masked where appropriate.
- The autopay service should meet agreed availability requirements.
- Payment processing should complete within an agreed performance threshold or provide status feedback.
- Failed payments should be monitored and communicated to customers according to business rules.
- Autopay configuration and payment history should be auditable.

## Edge Cases

- Insufficient account balance.
- Payment exceeds maximum amount.
- Payment fails.
- Beneficiary is invalid or unavailable.
- Duplicate autopay exists.
- End date is in the past.
- Autopay is already paused.
- Customer manually resumes an autopay before its scheduled resume date.
- Autopay remains paused for an unusually long period.
- A payment is scheduled around a service-maintenance period.
