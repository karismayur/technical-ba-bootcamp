# Day 1 Notes

## Topics

- CREATE TABLE
- INSERT
- SELECT
- WHERE
- COUNT
- ORDER BY
- LIMIT
- DISTINCT
- UPDATE
- DELETE

## Lessons Learned

- Always use ORDER BY with LIMIT.
- SELECT before UPDATE or DELETE.
- Numbers don't require quotes.
- VARCHAR values require quotes.
- DELETE 0 rows is not an error.
- For negative transaction amounts, the numerically smallest value represents the largest absolute transaction amount. Use ABS() when comparing transaction magnitude regardless of debit/credit direction.
- When filtering TIMESTAMP columns, use an appropriate date and time value for the business scenario.

## BA Perspective

SQL should be used to answer a defined business question rather than simply retrieve data.

Before running a query in a production investigation:

1. Clarify the business problem.
2. Identify the relevant entities and fields.
3. Start with read-only queries.
4. Validate the results before proposing any data change.