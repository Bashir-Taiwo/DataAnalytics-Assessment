-- Assessment_Q3.sql

WITH Last_Transaction AS (
    SELECT 
        s.id AS plan_id,
        s.owner_id,
        'Savings' AS type,
        MAX(s.created_at) AS last_transaction_date
    FROM 
        savings_savingsaccount s
    GROUP BY 
        s.id, s.owner_id

    UNION ALL

    SELECT 
        p.id AS plan_id,
        p.owner_id,
        'Investment' AS type,
        MAX(p.created_at) AS last_transaction_date
    FROM 
        plans_plan p
    GROUP BY 
        p.id, p.owner_id
)
SELECT 
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATE_PART('day', CURRENT_DATE - last_transaction_date) AS inactivity_days
FROM 
    Last_Transaction
WHERE 
    DATE_PART('day', CURRENT_DATE - last_transaction_date) >= 365;
