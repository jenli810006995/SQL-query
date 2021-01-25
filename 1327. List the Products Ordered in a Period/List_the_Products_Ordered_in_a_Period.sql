select p.product_name, x.quantity as unit
from
products p
left join
(
  select *, sum(unit) as quantity
  from orders
  where date_format(order_date, '%Y-%m') = '2020-02'
  group by 1
)x
on p.product_id = x.product_id
where x.quantity >= 100
group by 1
;
-- Link:https://leetcode.com/problems/list-the-products-ordered-in-a-period/
