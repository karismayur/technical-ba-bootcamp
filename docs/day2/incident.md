# JIRA-1072 - Duplicate Interac Transfers Investigation

## Priority
High

## Reported By
Emma (Product Manager)

## Incident Description
Several customers have reported duplicate Interac Transfer transactions.

Engineering has confirmed that duplicate payments were not sent to the payment processor.

The investigation aims to determine whether duplicate transaction records exist and assess the business impact.

## Investigation Questions

1. How many transactions exist for each transaction type?
2. How many transactions exist for each status?
3. Are duplicate transactions present?
4. Which account contains duplicate transactions?
5. What additional questions should be asked before confirming a defect?

## SQL Concepts Practiced

- GROUP BY
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- HAVING

## Outcome

Investigation confirmed one duplicate transaction group for an Interac Transfer.

Further discussion determined that duplicate transaction records do not necessarily indicate duplicate customer charges. Business validation with the payment gateway and transaction references would be required before classifying this as a production defect.