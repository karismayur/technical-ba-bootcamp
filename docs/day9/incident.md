## Business Scenario

The Fraud Operations team wants to identify accounts that have experienced three consecutive failed transactions.

## SQL Concepts Used

- LAG()
- Window Functions
- PARTITION BY
- ORDER BY
- Common Table Expressions (CTEs)

## Approach

1. Partition transactions by account.
2. Order transactions chronologically.
3. Use multiple LAG() functions to retrieve the previous two transaction statuses.
4. Identify rows where the current, previous, and second previous transactions are all FAILED.
5. Return the affected account and the triggering transaction.