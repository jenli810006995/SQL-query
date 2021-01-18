-- the sales price in the sales table has been multiplied with quantity

select seller_id
from
(
  select seller_id, rank() over(order by sum(price) desc) as rnk
  from sales s join product p
  on s.product_id = p.product_id
  group by 1
) x
where rnk = 1;

--Link: https://leetcode.com/problems/sales-analysis-i/
