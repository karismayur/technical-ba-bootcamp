# Day 3 Notes

## WHERE

Filters rows before grouping.

## AND

Returns rows where all conditions are true.

## OR

Returns rows where at least one condition is true.

## IN

Cleaner alternative to multiple OR conditions.

## BETWEEN

Checks whether a value falls within a range.

Be careful when filtering TIMESTAMP columns.
'2026-07-03' means '2026-07-03 00:00:00'.

## LIKE

Pattern matching.

% = any number of characters.

LIKE is case-sensitive in PostgreSQL.

ILIKE is case-insensitive.

## NULL

NULL means "unknown", not zero or an empty string.

Never compare NULL using =.

Correct:

IS NULL

IS NOT NULL