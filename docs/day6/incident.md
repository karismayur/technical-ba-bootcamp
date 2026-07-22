## Incident: VIP Customer Portfolio Report Returning Incorrect Results

### Problem

The Relationship Management team reported that the "High Value Customers" dashboard was showing incorrect customers. Some customers with multiple accounts were missing, while others with relatively low total balances were appearing on the report.

### Investigation

Verified the business requirement:

> Display customers whose **total balance across all accounts** is greater than the **average account balance**.

Initially reviewed existing SQL and noticed aggregation was being performed at the account level instead of the customer level.

Further analysis confirmed that grouping by `account_id` calculated the balance for each individual account rather than the customer's combined balance.

### Resolution

- Changed the aggregation to group by `customer_id`.
- Used a scalar subquery to calculate the average account balance.
- Applied the comparison in the `HAVING` clause after aggregation.
- Validated the results against sample customer balances.

### SQL Concepts Used

- GROUP BY
- HAVING
- Aggregate Functions
- Scalar Subquery
- SQL Execution Order

