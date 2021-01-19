select product_id,  round(sum(total_price)/sum(quantity), 2) as average_price
from
(
  select p.product_id, p.price, u.units as quantity, p.price * u.units as total_price
  from prices p
  left join
  unitssold u
  on p.product_id = u.product_id
  and u.purchase_date between p.start_date and p.end_date
) x
group by 1;

-- Link: https://leetcode.com/problems/average-selling-price/
