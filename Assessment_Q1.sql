-- solution for Q1

SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(s.confirmed_amount) / 100.0, 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id AND s.confirmed_amount > 0
JOIN plans_plan p ON u.id = p.owner_id AND p.is_a_fund = 1
WHERE s.is_regular_savings = 1  -- Ensure it's a savings plan
GROUP BY u.id, u.name
HAVING COUNT(DISTINCT s.id) >= 1 AND COUNT(DISTINCT p.id) >= 1
ORDER BY total_deposits DESC;
