WITH customer_last_purchase AS (		
		SELECT customerkey,
				orderdate,
				cleaned_name,
				first_purchase_date,
				row_number() over(PARTITION BY customerkey ORDER BY orderdate desc) AS rn,
				cohort_year
		FROM cohort_analysis 
), churned_customers AS (

		SELECT customerkey,
				orderdate,
				cleaned_name,
				cohort_year,
				
	CASE 
		WHEN orderdate < (SELECT max(orderdate) FROM sales) - INTERVAL '6 months' THEN 'churned' 
		ELSE 'active' 
	END as customer_status 
FROM customer_last_purchase 
WHERE rn = 1 AND first_purchase_date < (SELECT max(orderdate) FROM sales) - INTERVAL '6 months'
)

		SELECT customer_status,
			   count(customerkey) AS num_customer,
			   sum(count(customerkey)) over(PARTITION BY cohort_year) AS total_customers,
			   round(count(customerkey)/(sum(count(customerkey)) over(PARTITION BY cohort_year)), 2) AS percentage_customers
		FROM churned_customers
		GROUP BY cohort_year, customer_status 
		ORDER BY cohort_year, customer_status 