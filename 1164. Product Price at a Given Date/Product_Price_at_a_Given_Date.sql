select distinct p.product_id, ifnull(x.new_price, 10) as price
from
(
  select *, dense_rank() over(partition by product_id order by change_date desc) as rnk
  from products
  where change_date <= '2019-08-16'
)x
right join
products p
on x.product_id = p.product_id
and x.rnk = 1
group by 1
order by 2 desc;

-- Link: https://leetcode.com/problems/product-price-at-a-given-date/
