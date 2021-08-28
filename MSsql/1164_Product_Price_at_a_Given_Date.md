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

Solution(MSSql):

```
with t as
(
  select product_id, new_price
  from
  (
    select *,
          rank() over(partition by product_id order by change_date desc) as rnk
          from Products
    where change_date <= '2019-08-16'
  ) t
where rnk = 1
)

select t1.product_id, case when new_price is null then old_price else new_price end as price
from
(
  select distinct product_id, 10 as old_price
  from Products
) t1
left join t
on t1.product_id = t.product_id

```

Link: https://leetcode.com/problems/product-price-at-a-given-date/

```
08-28-2021

with t as 
(
select product_id, new_price
from
(
  select *, rank() over(partition by product_id order by change_date desc) as rnk
  from Products
  where change_date <= '2019-08-16'
) x
where rnk = 1
)

select t1.product_id, case when new_price is null then old_price else new_price end as price
from
(
  select dsitinct product_id, 10 as old_price
  from products
) t1
left join t
on t.product_id = t1.product_id
```

