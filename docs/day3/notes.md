# Day 3 Notes

## WHERE

Filters rows based on specified conditions.

## AND

Returns rows where all conditions are true.

## OR

Returns rows where at least one condition is true.

## IN

Cleaner alternative to multiple OR conditions when checking whether a value matches one of several possible values.

## NOT IN

Used to exclude rows matching a list of specified values.

## BETWEEN

Checks whether a value falls within a specified range.

Be careful when filtering TIMESTAMP columns.

'2026-07-03' means '2026-07-03 00:00:00'.

When filtering a full day, make sure the end of the required time period is included.

## LIKE

Used for pattern matching.

% = any number of characters.

LIKE is case-sensitive in PostgreSQL.

## ILIKE

Performs case-insensitive pattern matching in PostgreSQL.

Useful when the case of the stored value is unknown.

## NULL

NULL means "unknown" or "missing", not zero or an empty string.

Never compare NULL using =.

Correct:

IS NULL

IS NOT NULL

## ABS()

Returns the absolute value of a number.

Useful when comparing transaction magnitude regardless of whether the transaction is a debit or credit.

## BA Perspective

Filtering should be driven by the business question being investigated.

When investigating a production issue:

1. Identify what makes a record relevant to the issue.
2. Translate those conditions into SQL filters.
3. Start with a broad query and narrow the results as needed.
4. Validate that the results match the business definition of the issue.
5. Avoid assuming that a transaction status alone represents a customer-impacting problem.