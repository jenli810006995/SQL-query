select product_name, unit
from
(
  select product_id, sum(unit) as unit
  from orders
  where date_format(order_date, '%Y-%m') = '2020-02'
  group by 1
) x
left join
products p
on x.product_id = p.product_id
where x.unit >= 100
group by 1
;

--Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
