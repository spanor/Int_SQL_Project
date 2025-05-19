		
	WITH customer_ltv AS (
		SELECT customerkey,
				cleaned_name,
				sum(net_revenue) AS total_ltv
		FROM cohort_analysis ca 
		GROUP BY customerkey,
				cleaned_name
	), 
		customer_segments AS (
	
    SELECT 
    	percentile_cont(0.25) WITHIN GROUP (ORDER BY total_ltv) AS ltv_25_percentile,
    	percentile_cont(0.75) WITHIN GROUP (ORDER BY total_ltv) AS ltv_75_percentile
    FROM customer_ltv
    ),
    	customer_values AS (
    SELECT c.*,
    	CASE 
    		WHEN total_ltv < ltv_25_percentile THEN '1- Low value'
    		WHEN total_ltv <= ltv_75_percentile THEN '2- Medium value'
    		ELSE '3- Higher value'
    	END AS customer_segement 
    FROM customer_ltv c,
    	 customer_segments cs
    )
    
    SELECT customer_segement,
    		sum(total_ltv) AS total_ltv,
    		count(customerkey) AS customer_count,
    		sum(total_ltv)/count(customerkey) AS avg_ltv
    FROM customer_values
    GROUP BY customer_segement 
    ORDER BY customer_segement 