WITH yearly_cohort AS (
	SELECT customerkey,
			extract(YEAR FROM min(orderdate) OVER (PARTITION BY customerkey)) AS cohort_year
	FROM sales  
)

SELECT 
		cohort_year,
		extract(YEAR FROM orderdate) AS purchase_year,
		sum(quantity*netprice/exchangerate) AS net_revenue
FROM sales s 
LEFT JOIN yearly_cohort y ON y.customerkey = s.customerkey 
GROUP BY y.cohort_year, purchase_year
ORDER BY y.cohort_year, purchase_year 
