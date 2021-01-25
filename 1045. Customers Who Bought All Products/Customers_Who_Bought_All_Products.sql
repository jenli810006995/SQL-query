select customer_id
from
(
  select c.customer_id, c.product_key
  from customer c
  left join
  product p
  on c.product_key = p.product_key
) x
group by 1
having count(distinct product_key) = (select count(*) from product)
;
-- Link: https://leetcode.com/problems/customers-who-bought-all-products/
