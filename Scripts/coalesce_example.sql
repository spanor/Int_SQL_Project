
with sales_customer as ( 
        select customerkey,
            sum(netprice*quantity) as net_revenue
        from sales
        group by customerkey
     
)

select 
        avg(s.net_revenue) AS spending_customers,
        avg(coalesce(s.net_revenue, 1)) AS all_customers
from customer c
LEFT JOIN sales_customer s ON c.customerkey = s.customerkey

