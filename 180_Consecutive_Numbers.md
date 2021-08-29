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
The query result format is in the following example:

Logs table:
```
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
```
Result table:
```
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
```
1 is the only number that appears consecutively for at least three times.

Solution:
```
select distinct l1.num as ConsecutiveNums from logs l1, logs l2, logs l3
where l1.num = l2.num and l1.num = l3.num
and l1.id = l2.id - 1 and l1.id = l3.id - 2
;
```
```
Link: https://leetcode.com/problems/consecutive-numbers/
```
