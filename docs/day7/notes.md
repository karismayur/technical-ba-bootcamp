# Day 7 - Common Table Expressions (CTEs)

## What is a CTE?

A CTE (Common Table Expression) is a temporary table that exists only during the execution of a query.

Syntax:

WITH cte_name AS (
    SELECT ...
)

SELECT ...
FROM cte_name;

## Why use a CTE?

- Improves readability
- Breaks large queries into logical steps
- Can be joined like a normal table
- Easier to maintain than nested subqueries

## Mental Model

Nested Subquery

Main Query
    ↓
Temporary Table

CTE

Create Temporary Table
    ↓
Main Query

A CTE is simply a named temporary table.