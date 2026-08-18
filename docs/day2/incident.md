# JIRA-1072 - Duplicate Interac Transfers Investigation

## Priority

High

## Reported By

Emma (Product Manager)

## Incident Description

Several customers have reported duplicate Interac Transfer transactions.

Engineering has confirmed that duplicate payments were not sent to the payment processor.

The investigation aims to determine whether duplicate transaction records exist and assess the potential business impact.

---

## Investigation Questions

1. How many transactions exist for each transaction type?
2. How many transactions exist for each status?
3. Are duplicate transactions present?
4. Which account contains duplicate transactions?
5. Which transaction types have the highest transaction volume?
6. Which transaction types have the highest failed transaction volume?
7. What additional questions should be asked before confirming a defect?

---

## Investigation Approach

The transactions table was analyzed using aggregate queries to identify transaction patterns and potential duplicate records.

The following SQL concepts were used during the investigation:

- GROUP BY
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- HAVING
- ORDER BY
- ABS()

The investigation included:

- Counting transactions by transaction type
- Counting transactions by transaction status
- Identifying accounts with high transaction volumes
- Analyzing failed transactions by type and account
- Calculating transaction and spending totals
- Identifying duplicate transaction groups using account ID, transaction type, amount and creation timestamp
- Retrieving the full records associated with duplicate transaction groups

---

## Key Learnings

- GROUP BY is used to create groups before aggregate calculations.
- HAVING filters grouped results after aggregation.
- WHERE filters individual rows before grouping.
- Aggregate functions can answer different business questions depending on how the data is grouped and filtered.
- ABS() can be used when comparing transaction magnitude regardless of whether the transaction is a debit or credit.
- MIN() is useful for identifying the largest withdrawal when withdrawals are stored as negative amounts.
- Duplicate database records do not necessarily mean that a customer was charged twice.
- Transaction references and payment-processor records should be checked before classifying duplicate records as a customer-impacting payment defect.

---

## Outcome

The investigation identified one duplicate transaction group for an Interac Transfer.

The duplicate records were associated with the same account, transaction type, amount and creation timestamp.

However, duplicate database records alone did not confirm that the customer had been charged twice.

Further validation with the payment processor and transaction references would be required before classifying the issue as a production payment defect.