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

- Gross transaction volume (ABS)
- Net transaction value (SUM)

Ask before assuming.
