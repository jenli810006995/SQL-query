Table: Boxes
```
+--------------+------+
| Column Name  | Type |
+--------------+------+
| box_id       | int  |
| chest_id     | int  |
| apple_count  | int  |
| orange_count | int  |
+--------------+------+
```
box_id is the primary key for this table.
chest_id is a foreign key of the chests table.
This table contains information about the boxes and the number of oranges and apples they contain. Each box may contain a chest, which also can contain oranges and apples. 

Table: Chests
```
+--------------+------+
| Column Name  | Type |
+--------------+------+
| chest_id     | int  |
| apple_count  | int  |
| orange_count | int  |
+--------------+------+
```
chest_id is the primary key for this table.
This table contains information about the chests we have, and the corresponding number if oranges and apples they contain.
 
Write an SQL query to count the number of apples and oranges in all the boxes. If a box contains a chest, you should also include the number of apples and oranges it has.
Return the result table in any order.

Solution(MySQL):
```
SELECT SUM(b.apple_count + IFNULL(a.apple_count, 0)) AS apple_count,
       SUM(b.orange_count + IFNULL(a.orange_count, 0)) AS orange_count
FROM Boxes b
LEFT JOIN Chests a
ON b.chest_id = a.chest_id
```
Link: https://leetcode.com/problems/count-apples-and-oranges/
