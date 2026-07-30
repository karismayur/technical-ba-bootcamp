# Incident: Latest Customer Transaction Report

## Background

Operations requested a report showing the latest transaction for every customer.

An initial approach using MAX(created_at) returned only the latest timestamp but not the full transaction details.

## Investigation

Reviewed the query and determined that GROUP BY aggregated the data, making it impossible to return the complete transaction row.

## Resolution

Implemented a window function using ROW_NUMBER() with PARTITION BY customer_id and ORDER BY created_at DESC.

Filtered for row_num = 1 to return the complete latest transaction for each customer.

## SQL Concepts Used

- ROW_NUMBER()
- PARTITION BY
- ORDER BY
- Common Table Expressions (CTEs)

## Outcome

- Returned complete transaction records.
- Eliminated complex self-joins.
- Simplified future reporting queries.