Table: Users
```
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |
+----------------+---------+
```
user_id is the primary key of this table.
This table has the info of the users of an online shopping website where users can sell and buy items.
Table: Orders
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| item_id       | int     |
| buyer_id      | int     |
| seller_id     | int     |
+---------------+---------+
```
order_id is the primary key of this table.
item_id is a foreign key to the Items table.
buyer_id and seller_id are foreign keys to the Users table.
Table: Items
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| item_id       | int     |
| item_brand    | varchar |
+---------------+---------+
```
item_id is the primary key of this table.
 
Write an SQL query to find for each user, whether the brand of the second item (by date) they sold is their favorite brand. If a user sold less than two items, report the answer for that user as no.
It is guaranteed that no seller sold more than one item on a day.

Solution(MySQL):
```
SELECT user_id AS seller_id,
(
  CASE WHEN favorite_brand = 
  (
    SELECT i.item_brand
    FROM Orders o LEFT JOIN Items i
    ON o.item_id = i.item_id
    WHERE o.seller_id = u.user_id
    ORDER BY o.order_date
    LIMIT 1 OFFSET 1
  ) THEN 'yes' ELSE 'no' END
)   AS '2nd_item_fav_brand'
FROM Users u

```
```
Link: https://leetcode.com/problems/market-analysis-ii/
```
