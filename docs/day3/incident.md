# JIRA-1142 - Pending Transactions Investigation

## Priority

Medium

## Reported By

Emma (Product Manager)

## Incident Description

Customers reported that some transactions appeared to be missing or remained pending.

Engineering confirmed that the payment processor was healthy.

The investigation focused on identifying transactions requiring attention, filtering by transaction type and status, searching transaction descriptions, and identifying transactions that had not yet been posted.

---

## Investigation Questions

1. Which transactions are currently pending?
2. Which transactions have failed?
3. Which transactions have been reversed?
4. Which transactions have not yet been posted?
5. Are specific transaction types affected?
6. Are there transactions that meet multiple conditions and may require customer follow-up?
7. Are there patterns in transaction descriptions that can help identify affected transactions?

---

## Investigation Approach

The transactions table was queried using multiple filtering conditions to narrow down transactions requiring investigation.

The following SQL concepts were used during the investigation:

- WHERE
- AND
- OR
- IN
- NOT IN
- BETWEEN
- LIKE
- ILIKE
- IS NULL
- IS NOT NULL
- ABS()

The investigation included:

- Identifying pending, failed and reversed transactions
- Filtering transactions by transaction type
- Identifying transactions that had not yet been posted
- Filtering transactions within a specific date and time range
- Searching transaction descriptions using LIKE and ILIKE
- Filtering transactions based on transaction amount
- Combining multiple conditions to identify transactions that may require customer follow-up

---

## Key Learnings

- WHERE filters individual rows based on specified conditions.
- AND requires all specified conditions to be true.
- OR allows any of the specified conditions to be true.
- IN provides a cleaner way to match a value against multiple possible values.
- NOT IN can be used when excluding multiple known values.
- BETWEEN can be used to filter values within a specified range.
- LIKE performs case-sensitive pattern matching in PostgreSQL.
- ILIKE performs case-insensitive pattern matching in PostgreSQL.
- NULL represents an unknown or missing value and should be checked using IS NULL or IS NOT NULL rather than `= NULL`.
- ABS() can be used when filtering transaction magnitude regardless of whether the amount is positive or negative.
- When filtering TIMESTAMP values, the time component should be considered when defining the required date range.

---

## Outcome

The investigation successfully identified pending, failed and unposted transactions and demonstrated how multiple filtering conditions can be combined to narrow down transactions requiring attention.

The investigation also demonstrated how SQL filtering can be used to support production troubleshooting and customer-support investigations.