Table: Days
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| day         | date |
+-------------+------+
```
day is the primary key for this table.
 
Write an SQL query to convert each date in Days into a string formatted as "day_name, month_name day, year".
Return the result table in any order.

Solution(MySQL):
```
SELECT DATE_FORMAT(day, "%W, %M %e, %Y") AS day
FROM Days
```
Link: https://leetcode.com/problems/convert-date-format/
