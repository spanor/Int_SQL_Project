SELECT  cohort_year,
		date_trunc('month', orderdate)::date AS month_year,
		count(DISTINCT customerkey) AS total_customers,
		sum(net_revenue) AS total_revenue,
		sum(net_revenue)/count(DISTINCT customerkey) AS customer_revenue
FROM cohort_analysis
WHERE first_purchase_date = orderdate 
GROUP BY cohort_year, month_year;