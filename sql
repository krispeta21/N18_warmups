-- Return to Window Functions!
-- BASIC SYNTAX
-- SELECT <aggregator> OVER(PARTITION BY <col1> ORDER BY <col2>)
-- PARTITION BY (like GROUP BY) a column to do the aggregation within particular category in <col1>
-- Choose what order to apply the aggregator over (if it's a type of RANK)
-- Example SELECT SUM(sales) OVER(PARTITION BY department)
-- Feel free to google RANK examples too.



-- Return a list of all customers, RANKED in order from highest to lowest total spendings
-- WITHIN the country they live in.
-- HINT: find a way to join the order_details, products, and customers tables


-- Return the same list as before, but with only the top 3 customers in each country.


c.customerID, country, total, rank 




WITH order_total AS (
SELECT order_id, SUM(product_id*unit_price * quantity) AS total
FROM
order_details
GROUP BY
order_id)

SELECT customers.customer_id, customers.country, order_total.order_id, order_total.total 
FROM 
order_total 
JOIN 
orders 
ON
order_total.order_id=orders.order_id
JOIN
customers 
ON
customers.customer_id = orders.customer_id
LIMIT 50;



 customer_id |  country  | order_id |      total       
-------------+-----------+----------+------------------
 SUPRD       | Belgium   |    11038 | 50202.9999237061
 CACTU       | Argentina |    10782 |            387.5
 FAMIA       | Brazil    |    10725 | 14123.7998123169
 GOURL       | Brazil    |    10423 |            56260
 TORTU       | Mexico    |    10518 | 158437.200302124
 WANDK       | Germany   |    10356 | 61715.9994506836
 FURIB       | Portugal  |    10963 |             4080
 WHITC       | USA       |    10596 | 94454.3023071289
 ROMEY       | Spain     |    10282 | 5504.40018081665







