select product_name, year, price
from product p
right join sales s
on p.product_id = s.product_id
;
-- Link: https://leetcode.com/problems/product-sales-analysis-i/
