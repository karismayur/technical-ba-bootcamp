# Day 10 - Banking SQL Interview Problems

## Topics Practiced

- Business-oriented SQL problem solving
- LEFT JOIN for missing records
- CTEs
- DENSE_RANK()
- PARTITION BY
- Aggregation
- GROUP BY
- Ranking
- Banking analytics

## Key Learnings

- Choose SQL based on the business question, not the function.
- PARTITION BY is used when ranking within a group (e.g. per customer).
- No PARTITION BY is used when ranking across the entire dataset.
- LEFT JOIN + IS NULL is an effective way to identify missing related records.
- DENSE_RANK() returns all ties, while ROW_NUMBER() returns a single row.
- Avoid unnecessary joins and unnecessary GROUP BY clauses.