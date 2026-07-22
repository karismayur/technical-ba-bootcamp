


-- Create a temporary table containing each customer's total balance.

WITH customer_totals AS (

    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id

)

SELECT *
FROM customer_totals;




-- Display each customer's name along with their total balance.

WITH customer_totals AS (

    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id

)

SELECT
    customers.first_name,
    customers.last_name,
    customer_totals.total_balance
FROM customers
JOIN customer_totals
ON customers.customer_id = customer_totals.customer_id;


-- Show the first name, last name, and total balance of customers whose total balance is greater than ₹20,000
WITH customer_totals AS (

    SELECT customer_id, SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id

)

SELECT customers.first_name, customers.last_name, customer_totals.total_balance
FROM customers JOIN customer_totals 
ON customers.customer_id = customer_totals.customer_id
WHERE customer_totals.total_balance > 20000;