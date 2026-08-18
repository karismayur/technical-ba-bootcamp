# Day 2 Notes

## Aggregate Functions

COUNT() → Number of rows

SUM(column) → Total of a numeric column

AVG(column) → Average value

MAX(column) → Largest value

MIN(column) → Smallest value

## GROUP BY

Used to create groups before aggregate calculations.

## HAVING

Filters groups after aggregation.

WHERE filters rows.

HAVING filters groups.

## ABS()

Returns the absolute value of a number.

Useful when comparing transaction magnitude regardless of whether the transaction is a debit or credit.

For example:

- -500 → ABS(-500) = 500
- 300 → ABS(300) = 300

## Negative Transaction Amounts

In this dataset, negative amounts represent outgoing transactions.

For withdrawals, the most negative value represents the largest withdrawal.

For example:

- -500 is a larger withdrawal than -100
- MIN(amount) can therefore be used to identify the largest withdrawal when filtering for negative amounts.

## SQL Execution Order

FROM

↓

WHERE

↓

GROUP BY

↓

HAVING

↓

SELECT

↓

ORDER BY

## Interview Notes

Always clarify the business meaning before writing SQL.

Example:

"Moves the most money"

Could mean:

- Gross transaction volume → SUM(ABS(amount))
- Net transaction value → SUM(amount)

Ask before assuming.

## BA Perspective

Aggregate queries should answer a specific business question.

Before interpreting the result, clarify:

1. What is being measured?
2. At what level should the data be grouped?
3. Are positive and negative amounts being treated differently?
4. Does the database result represent the actual business outcome?

A database record should not automatically be treated as proof of a customer-impacting issue.