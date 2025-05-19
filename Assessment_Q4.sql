-- Assessment_Q4.sql

WITH Customer_Data AS (
    SELECT 
        u.id AS customer_id,
        u.name,
        DATE_PART('month', AGE(CURRENT_DATE, u.signup_date)) AS tenure_months,
        COUNT(s.id) AS total_transactions,
        SUM(s.confirmed_amount) / 100 AS total_value
    FROM 
        users_customuser u
    LEFT JOIN savings_savingsaccount s ON u.id = s.owner_id
    GROUP BY 
        u.id, u.name, u.signup_date
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions / GREATEST(tenure_months, 1)) * 12 * 0.001 * total_value, 2) AS estimated_clv
FROM 
    Customer_Data
ORDER BY 
    estimated_clv DESC;
