-- Assessment_Q2.sql

WITH Transactions_Per_Month AS (
    SELECT 
        owner_id,
        COUNT(id) / COUNT(DISTINCT DATE_TRUNC('month', created_at)) AS avg_transactions_per_month
    FROM 
        savings_savingsaccount
    GROUP BY 
        owner_id
), Frequency_Categories AS (
    SELECT 
        owner_id,
        CASE 
            WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
            WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM 
        Transactions_Per_Month
)
SELECT 
    frequency_category,
    COUNT(owner_id) AS customer_count,
    ROUND(AVG(avg_transactions_per_month), 2) AS avg_transactions_per_month
FROM 
    Frequency_Categories
GROUP BY 
    frequency_category;


