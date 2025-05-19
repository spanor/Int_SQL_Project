

CREATE OR REPLACE VIEW cohort_analysis AS 

WITH customer_revenue AS (
SELECT s.customerkey,
		s.orderdate,
		sum(netprice*quantity/exchangerate) AS net_revenue,
		count(orderkey) AS num_order,
		c.countryfull,
		c.givenname,
		c.surname
FROM sales s
LEFT JOIN customer c ON c.customerkey = s.customerkey 
GROUP BY s.customerkey,
		s.orderdate,
		 c.countryfull,
		c.givenname,
		c.surname
)

SELECT cr.*,
		min(cr.orderdate) OVER (PARTITION BY cr.customerkey) AS first_purchase_date,
		extract(YEAR FROM min(cr.orderdate) OVER (PARTITION BY cr.customerkey)) AS cohort_year
 FROM customer_revenue cr;
		

