# DataAnalytics-Assessment
SQL Proficiency Assessment - Data Analyst.

Turning raw data into strategic business insights.

---

## 📍 Project Overview  
This project leverages SQL to extract actionable insights from customer, transaction, and account data. The queries are structured to identify high-value customers, segment users by transaction frequency, detect inactive accounts, and estimate Customer Lifetime Value (CLV). The goal is to transform raw data into strategic insights for marketing, finance, and operations teams.

---

## 📦 Dataset Structure  
**Tables and Key Columns:**  
- `users_customuser`: Customer demographic and contact information (`id`, `name`, `signup_date`)  
- `savings_savingsaccount`: Deposit transactions (`id`, `owner_id`, `confirmed_amount`, `transaction_date`)  
- `plans_plan`: Customer plans, including savings and investment (`id`, `owner_id`, `is_regular_savings`, `is_a_fund`, `last_transaction_date`)  
- `withdrawals_withdrawal`: Withdrawal transactions (`id`, `owner_id`, `amount_withdrawn`, `transaction_date`)  

---

## ✅ Data Flow Diagram  
A simple flowchart visually representing the data relationships and query structure can be added here. 

---

## 🔍 Key Insights & Business Impact  

- **High-Value Customers with Multiple Products:** Identified cross-selling opportunities by pinpointing customers with both savings and investment plans, representing potential revenue expansion points.  
- **Transaction Frequency Analysis:** Segmented customers into High, Medium, and Low Frequency categories to inform targeted engagement strategies, increasing retention and reactivation rates.  
- **Account Inactivity Alert:** Flagged inactive accounts to reduce potential revenue loss from dormant accounts, providing opportunities for targeted reactivation campaigns.  
- **Customer Lifetime Value (CLV) Estimation:** Estimated CLV to prioritize high-value customers for loyalty programs, maximizing customer profitability.

---

## ✅ Problem-Solution Approach  

### **1. Identifying High-Value Customers with Multiple Products 💼**  
**Business Problem:** The sales team wants to identify customers with both funded savings and investment plans to prioritize for cross-selling.  
**Solution Approach:**  
- Aggregated deposit amounts and counted distinct plans to identify customers with multiple products.  
- Sorted results by total deposits to prioritize top customers for targeted outreach.  

**Optimization Considerations:**  
- Implement indexing on `owner_id` and `confirmed_amount` for faster query execution.  

---

### **2. Transaction Frequency Analysis 📊**  
**Business Problem:** Finance aims to segment users based on transaction frequency to tailor promotional offers.  
**Solution Approach:**  
- Calculated average monthly transactions and segmented users into three categories based on transaction volume.  
- Highlighted customers with high transaction volumes for potential loyalty program offers.  

**Scalability Considerations:**  
- Partition data by `transaction_date` to handle high-volume datasets effectively.  

---

### **3. Account Inactivity Alert 🚨**  
**Business Problem:** Operations wants to identify dormant accounts with no inflow transactions for over a year to mitigate potential churn.  
**Solution Approach:**  
- Merged savings and investment data to identify inactive accounts, calculating inactivity days based on the last transaction date.  
- Provides a structured alert mechanism for reactivation strategies.  

**Performance Optimization:**  
- Consider implementing materialized views for frequent monitoring of inactivity alerts.  

---

### **4. Customer Lifetime Value (CLV) Estimation 💰**  
**Business Problem:** Marketing seeks to estimate CLV to prioritize high-value customers for retention efforts.  
**Solution Approach:**  
- Applied a simplified CLV formula based on transaction volume and tenure, offering a baseline for revenue potential estimation.  

**Future Enhancements:**  
- Incorporate advanced CLV modeling, including seasonal transaction patterns and transaction value variability.  

---

## 🛠️ Challenges & Solutions  

- **Data Inconsistencies:** Addressed potential null values and outliers by using conditional aggregation and COALESCE functions.  
- **Query Optimization:** Implemented indexing and query restructuring to reduce execution time, particularly for large datasets.  
- **Scalability:** Structured queries to be adaptable for datasets exceeding millions of records, using CTEs and window functions.

---

## Next Steps & Recommendations  

1. **Data Integration:** Include withdrawal data in CLV calculations for a more comprehensive profitability analysis.  
2. **Predictive Analysis:** Develop predictive models using historical transaction data to anticipate future CLV and potential churn.  
3. **Customer Segmentation:** Extend transaction frequency analysis to include segmentation by demographics, investment products, or transaction value.  
4. **Enhanced Reporting:** Implement visual dashboards to communicate insights effectively to business stakeholders.  
5. **Performance Monitoring:** Set up automated alerts for inactive accounts and high CLV customers to facilitate proactive business actions.  

---

## 📌 Conclusion  
This project provides a structured approach to identifying high-value customers, segmenting users, and estimating CLV using SQL queries. By aligning data analysis with business objectives, the insights derived can drive targeted marketing, reduce churn, and increase overall customer profitability. 
