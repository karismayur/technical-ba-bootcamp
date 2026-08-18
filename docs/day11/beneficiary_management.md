# Beneficiary Management

## User Story

**As a customer,**  
I want to add, edit, disable and delete beneficiaries,  
so that I can manage the accounts I make payments to.

## Functional Requirements

### Add

- The customer should be able to add a beneficiary using an Add Beneficiary action.
- Required beneficiary details must be provided before saving.
- Field validation should enforce appropriate formats and lengths.
- The system should check for duplicate beneficiaries according to agreed business rules.
- The newly added beneficiary should appear in the beneficiary list after successful creation.
- If a maximum beneficiary limit exists, Add should be disabled once the limit is reached.

### Edit

- Each eligible beneficiary should have an Edit action.
- The customer should be able to update permitted beneficiary details.
- Updated details should appear in the beneficiary list after successful save.

### Delete

- Each eligible beneficiary should have a Delete action.
- The customer should receive a confirmation prompt before deletion.
- Cancel should return the customer to the beneficiary list without changes.
- Delete should remove or deactivate the beneficiary according to the agreed data-retention/audit rules.

### Disable

- The customer should be able to disable a beneficiary where supported.
- A disabled beneficiary should not allow new transactions.
- Existing pending transactions should follow the agreed business rules.

### Fraud

- The customer should have an appropriate mechanism to report suspected beneficiary fraud.
- Fraud handling should immediately stop further activity where required by business and risk rules.

## Non-Functional Requirements

- Beneficiary data must be protected in transit and at rest.
- Sensitive information should be masked where appropriate.
- Beneficiary actions should provide timely feedback to the customer.
- The service should meet agreed availability requirements.
- Beneficiary changes should be auditable.
- Customer-facing error messages should not expose sensitive technical information.

## Edge Cases

- Duplicate beneficiary.
- Maximum beneficiary limit reached.
- Required field missing.
- Invalid field format.
- Customer session times out during the operation.
- Beneficiary has pending transactions.
- Beneficiary is already disabled.
- Beneficiary is already deleted.
- Suspected fraud is reported.
