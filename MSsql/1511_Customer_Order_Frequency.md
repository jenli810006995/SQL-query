Table: Customers
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| country       | varchar |
+---------------+---------+
```
customer_id is the primary key for this table.
This table contains information of the customers in the company.
 
Table: Product
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| description   | varchar |
| price         | int     |
+---------------+---------+
```
product_id is the primary key for this table.
This table contains information of the products in the company.
price is the product cost.
 
Table: Orders
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_id    | int     |
| order_date    | date    |
| quantity      | int     |
+---------------+---------+
```
order_id is the primary key for this table.
This table contains information on customer orders.
customer_id is the id of the customer who bought "quantity" products with id "product_id".
Order_date is the date in format ('YYYY-MM-DD') when the order was shipped.
 
Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.
Return the result table in any order.

Solution:
```
select c.customer_id, c.name
from Customers c
left join
(
  select customer_id, left(order_date, 7) as date,
  sum(price * quantity) as total, rank() over(partition by customer_id order by left(order_date, 7)) as rank
  from Orders o
  join
  Product p
  on o.product_id = p.product_id
  where left(order_date, 7) = '2020-06' or left(order_date, 7) = '2020-07'
  group by customer_id, left(order_date, 7)
  having sum(price * quantity) >= 100
) t
where rank = 2
;

```
Link: https://leetcode.com/problems/customer-order-frequency/
