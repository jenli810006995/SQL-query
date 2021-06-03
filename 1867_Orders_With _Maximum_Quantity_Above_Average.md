Table: OrdersDetails
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| product_id  | int  |
| quantity    | int  |
+-------------+------+
```
(order_id, product_id) is the primary key for this table.
A single order is represented as multiple rows, one row for each product in the order.
Each row of this table contains the quantity ordered of the product product_id in the order order_id.
 
You are running an ecommerce site that is looking for imbalanced orders. 
An imbalanced order is one whose maximum quantity is strictly greater than the average quantity of every order (including itself).

The average quantity of an order is calculated as (total quantity of all products in the order) / (number of different products in the order). 
The maximum quantity of an order is the highest quantity of any single product in the order.

Write an SQL query to find the order_id of all imbalanced orders.
Return the result table in any order.

Solution(MySQL):
```
SELECT order_id
FROM OrdersDetails
GROUP BY order_id
HAVING MAX(quantity) > ALL
(
  SELECT (SUM(quantity)/COUNT(DISTINCT product_id)) AS avg_quant_order
  FROM OrdersDetails
  GROUP BY order_id
)
ORDER BY order_id

```
Link: https://leetcode.com/problems/orders-with-maximum-quantity-above-average/
