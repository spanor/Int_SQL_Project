EXPLAIN analyze
SELECT customerkey,
		orderdate,
		sum(netprice*quantity/exchangerate)
FROM sales
GROUP BY customerkey,
		orderdate
		

EXPLAIN ANALYZE
SELECT c.customerkey,
		s.orderdate,
		c.givenname,
		c.surname,
		p.productname,
		s.orderkey,
		extract(YEAR FROM orderdate) AS year
FROM sales s 
INNER JOIN customer c ON c.customerkey = s.customerkey
INNER JOIN product p ON p.productkey = s.productkey

		

		
