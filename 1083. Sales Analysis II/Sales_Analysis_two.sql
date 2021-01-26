select distinct s.buyer_id
from
sales s, product p
where s.product_id = p.product_id
and p.product_name like 'S8'
and s.buyer_id not in
(
  select s.buyer_id
  from sales s, product p
  where s.product_id = p.product_id
  and p.product_name like 'iPhone'
)
group by 1;

-- Link: https://leetcode.com/problems/sales-analysis-ii/
