# JIRA-1048 Missing Transactions

## Incident Summary

**Reported by:** Emma (Product Manager)

Customers reported that some transactions were not appearing in the mobile application after a recent release.

---

## Scope & Impact

The initial scope was unknown. The investigation questions were intended to determine whether the issue was:

- affecting all customers or a subset
- limited to specific transaction types
- device or platform specific
- related to a specific release
- regional or time-dependent

---

## Initial Questions Asked

1. Did the issue begin immediately after the latest release?
2. Does the previous version of the application display the transactions correctly?
3. Are all transaction types missing or only certain types?
4. Is the issue affecting all users or only a subset?
5. Does the issue occur during a specific time window?
6. Are specific devices or operating systems affected?
7. Is the issue limited to one region or occurring globally?
8. Does the issue affect transactions of certain amounts?
9. Is there any common pattern among affected users?
10. Can the issue be reproduced internally?

---

## Investigation Approach

To begin narrowing down the problem, the transactions table was queried.

The following SQL concepts were used during the investigation:

- SELECT
- WHERE
- COUNT
- ORDER BY
- LIMIT
- DISTINCT
- Timestamp filtering

The investigation also discussed how UPDATE and DELETE statements should be executed safely in production. Records were first queried to verify the intended rows before making changes.

---

## Key Learnings

- Never use UPDATE or DELETE without first verifying the affected rows.
- LIMIT should almost always be combined with ORDER BY when retrieving a specific subset of records.
- DISTINCT is useful for quickly identifying unique or unexpected values.
- Numeric columns should be compared using numbers, not strings.
- Negative transaction amounts represent withdrawals/debits in the dataset; a more negative value represents a larger withdrawal.
- Timestamp filters should use an appropriate date and time when investigating time-specific issues.
- UPDATE 0 or DELETE 0 is not necessarily an error—it simply means no rows matched the condition.

---

## Outcome

This was a simulated production investigation, so no production root cause was available to confirm.

The investigation demonstrated a structured approach to narrowing a transaction-visibility issue using business questions, SQL analysis and production-safety considerations.