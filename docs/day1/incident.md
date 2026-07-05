

# JIRA-1048 Missing Transactions

## Incident Summary

**Reported by:** Emma (Product Manager)

Customers reported that some transactions were not appearing in the mobile application after a recent release.

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

The investigation also discussed how UPDATE and DELETE statements should be executed safely in production.

---

## Key Learnings

- Never use UPDATE or DELETE without first verifying the affected rows.
- LIMIT should almost always be combined with ORDER BY.
- DISTINCT is useful for quickly identifying unexpected values.
- Numeric columns should be compared using numbers, not strings.
- UPDATE 0 or DELETE 0 is not necessarily an error—it simply means no rows matched the condition.

---

## Outcome

No root cause was identified because this was a simulated production incident used for SQL practice.

The investigation successfully demonstrated how SQL can be used by a Technical Business Analyst to narrow down production issues.