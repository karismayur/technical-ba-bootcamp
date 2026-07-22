# Incident: High Value Customer Report Difficult to Maintain

## Background

The Fraud and Risk team requested a report showing customers with high account balances. The original SQL query used nested subqueries to calculate customer balances before joining them with customer information.

Although the query returned the correct results, it was difficult to read, debug, and extend when new business requirements were introduced.

## Investigation

Reviewed the existing SQL and identified that customer balance calculations were embedded inside nested subqueries.

As additional requirements (such as filtering by balance thresholds or joining with other datasets) were added, the query became increasingly difficult to maintain.

## Resolution

Replaced the nested subquery with a Common Table Expression (CTE).

Created a temporary table (`customer_totals`) that calculated the total balance for each customer, then joined it with the `customers` table to generate the final report.

This separated the calculation logic from the reporting logic, making the query easier to understand and modify.

## SQL Concepts Used

- Common Table Expressions (CTEs)
- SUM()
- GROUP BY
- INNER JOIN
- WHERE

## Outcome

- Improved query readability.
- Simplified future enhancements.
- Reduced maintenance effort for reporting queries.