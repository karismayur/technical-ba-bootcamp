## LEFT JOIN

INNER JOIN returns only matching rows.

LEFT JOIN returns all rows from the left table and matching rows from the right table.

If no matching row exists, the right-side columns become NULL.

Pattern:

LEFT JOIN child_table
ON parent.id = child.parent_id

WHERE child.id IS NULL

Use this to find:

- Customers with no accounts
- Accounts with no transactions
- Products never ordered
- Employees without managers



## Concepts Learned

- Scalar subqueries
- IN subqueries
- NOT IN subqueries
- Difference between JOIN and Subquery
- WHERE vs HAVING
- SQL execution order
- Aggregate filtering using subqueries

## Key Takeaways

- Use JOIN when data from multiple tables is required.
- Use subqueries when another query is needed to filter data.
- WHERE filters rows.
- HAVING filters groups.