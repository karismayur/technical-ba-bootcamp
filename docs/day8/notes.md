# Day 8 - Window Functions

## Window Functions

Unlike GROUP BY, window functions do not reduce the number of rows.

Instead, they calculate values across related rows while preserving every row.

## ROW_NUMBER()

Assigns a unique sequential number.

Useful for:
- Latest transaction
- First purchase
- Removing duplicates

## RANK()

Assigns the same rank to ties.

Leaves gaps in ranking.

Example:

1
2
2
4

## DENSE_RANK()

Assigns the same rank to ties.

Does not leave gaps.

Example:

1
2
2
3

## PARTITION BY

Splits data into groups.

Ranking starts again for each partition.

## ORDER BY

Defines how rows are ranked inside each partition.