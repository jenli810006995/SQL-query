Table: Logs
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
```
id is the primary key for this table.
 
Write an SQL query to find all numbers that appear at least three times consecutively.
Return the result table in any order.

Solution:
```
select distinct l1.num as ConsecutiveNums from Logs l1, Logs l2, Logs l3
where l1.id = l2.id -1 and l1.id = l3.id -2
and l1.num = l2.num and l2.num = l3.num
```
```
Link: https://leetcode.com/problems/consecutive-numbers/
```
