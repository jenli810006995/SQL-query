Table: Department
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| revenue       | int     |
| month         | varchar |
+---------------+---------+
```
(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].

Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

Solution:
```
select id,
       max(case when month = 'Jan' then revenue else null end) as 'Jan_revenue',
       max(case when month = 'Feb' then revenue else null end) as 'Feb_revenue', 
       max(case when month = 'Mar' then revenue else null end) as 'Mar_revenue',
       max(case when month = 'Apr' then revenue else null end) as 'Apr_revenue',
       max(case when month = 'May' then revenue else null end) as 'May_revenue',
       max(case when month = 'Jun' then revenue else null end) as 'Jun_revenue',
       max(case when month = 'Jul' then revenue else null end) as 'Jul_revenue',
       max(case when month = 'Aug' then revenue else null end) as 'Aug_revenue',
       max(case when month = 'Sep' then revenue else null end) as 'Sep_revenue',
       max(case when month = 'Oct' then revenue else null end) as 'Oct_revenue',
       max(case when month = 'Nov' then revenue else null end) as 'Nov_revenue',
       max(case when month = 'Dec' then revenue else null end) as 'Dec_revenue'
from Department
group by id
order by id
```
```
Link: https://leetcode.com/problems/reformat-department-table/
```
