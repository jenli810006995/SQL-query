Table: Products
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
```
(product_id, change_date) is the primary key of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 
Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Solution:
```
-- first, create a temp table to find each product_id's latest change_date
with cte as
(
  select product_id, new_price from
    (
      select *, rank() over(partition by product_id order by change_date desc) as rnk
      from Products
      where change_date <= '2019-08-16'
    ) t -- this part is the product_id and price BEFORE the change
  where rnk = 1 -- so we got the latest price for the product_id BEFORE the change
)

-- now, join this cte with the original table
-- becoz duplicates product_id, we select distinct product_id

select t1.product_id, case when new_price is null then old_price else new_price end as price
from
(
  select distinct product_id, 10 as old_price
  from Products
) t1
left join cte
on t1.product_id = cte.product_id

-- because the question does not say the change is before or after '2019-08-16'
-- we just to see if there is no change date before '2019-08-16' then it should be 10
  
```
```
Link: https://leetcode.com/problems/product-price-at-a-given-date/
```
