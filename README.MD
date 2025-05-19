# Intermediate SQL - Sales Analysis  

## Overview 
{insert overview here}

## Business Questions

1. **Customer Segmentation**: Who are our most valuable customers?
2. **Cohort Analysis**: How do different customer groups generate revenue?
3. **Retention Analysis**: What is the retention rate of our customers?

## Analysis Approach 

### 1. Customer Segmentation Analysis
- Categorize customers based on lifetime value LTV
- Categorize customers into High, Medium, Low value segments
- Calculated key metrics: total revenue and percentage of customers in each segment

Query: [customer_segmentation.sql](\1_query.sql)

**Visualization**

![Category of values](\\C:\Users\Nora\AppData\Roaming\DBeaverData\workspace6\Int_SQL_Project\images\Pie_Chart_of_Category_Values.png)

**Key Findings**
- High-value segment 25% of customers drives 66% of revenues (135.4mi$)
- Medium-value segment 50% of customers drives 32% of revenues (66.2mi$)
- Low-value segment 25% of customers drives 2% of revenues (4.1mi$)

**Business Insights**
- High value (66% of revenues)- Offer exclusive experiences. Offer VIP loyalty tier. Gather feedback & co-create.
- Medium value (32% of revenues)- Offer personalized recommendations. Provide mid-tier loyalty benefits. Offer early access & previews. 
- Low value (2% of revenues)- Upsell with targeted discounts. Enroll in basic loyalty program. Provide educational content.

{repeat for each analysis approach}

### 2. Cohort Analysis  
- Tracked revenue and customer count per cohort
- Cohorts were grouped by year for first purchase
- Analyzed customer retention at a cohort level 

Query: [2_query.sql](\2.cohort_analysis.sql)

**Visualization**

![Cohort_analysis](\\C:\Users\Nora\AppData\Roaming\DBeaverData\workspace6\Int_SQL_Project\images\Cohort_analysis.png)

**Key Findings**
- Revenue per customer is showing a decreasing over the time 
    - 2022-2024 cohorts are consistently performing worse than earlier cohorts
    - NOTE: Although net revenue is increasing, this is likely due to a larger customer base rather than improved retention or spending per customer

**Business Insights**
- Recent cohorts from 2022 to 2024 show weaker performance, signaling a decline in customer quality or retention strategies.

- The growth in net revenue is not driven by higher customer value but rather by expanding the customer base.

- Without improvements in retention or spend per user, current growth may not be sustainable long-term.

## Analysis Approach 

- Customer Status Segmentation: Customers were segmented into 'Active' and 'Churned' groups to assess retention performance.

- Proportional Analysis: A pie chart was used to visually represent the proportion of active vs. churned customers.

- Retention Benchmarking: The active customer percentage (9.5%) was benchmarked against the churn rate (90.5%) to highlight retention efficiency.

### 1. Retention Analysis


Query: [3.project_retention_analysis.sql](\3.project_retention_analysis.sql)

**Visualization**

![Customer_churn_cohort_year](\\C:\Users\Nora\AppData\Roaming\DBeaverData\workspace6\Int_SQL_Project\images\\Customer_churn_cohort_year.png)

**Key Findings**

- High Churn Rate: 90.5% of customers have churned, indicating a serious retention issue.

- Low Active User Base: Only 9.5% of customers remain active, showing weak customer lifecycle engagement.

- Retention Imbalance: The disproportionate churn vs. active ratio suggests systemic weaknesses in customer experience or value proposition.

**Business Insights**

- Urgent Retention Strategy Needed: The high churn rate signals the need for a robust retention plan including re-engagement campaigns and customer feedback loops.

- Customer Journey Optimization: With only 9.5% retained, reviewing onboarding, product usage, and support services could uncover drop-off pain points.

- Segment-Based Loyalty Programs: Tailored incentives for at-risk segments may help prevent further churn and re-activate dormant users.

## Strategic Recommendations
- {insert strategic recommendations here}

## Technical Details
- **Database**: PostgreSQL
- **Schema**: {insert schema name here}
- **Tables**: {insert table names here} 
- **ETL Process**: {insert ETL process here}    
- **Data Sources**: {insert data sources here}  
- **Tools Used**: {insert tools used here}  
- **Version Control**: {insert version control here}    
- **Deployment**: {insert deployment here}     
- **Testing**: {insert testing here}    
- **Documentation**: {insert documentation here}    
