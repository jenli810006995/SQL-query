Table: Failed
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| fail_date    | date    |
+--------------+---------+
```
Primary key for this table is fail_date.
Failed table contains the days of failed tasks.
Table: Succeeded
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| success_date | date    |
+--------------+---------+
```
Primary key for this table is success_date.
Succeeded table contains the days of succeeded tasks.

A system is running one task every day. Every task is independent of the previous tasks. The tasks can fail or succeed.

Write an SQL query to generate a report of period_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.

period_state is 'failed' if tasks in this interval failed or 'succeeded' if tasks in this interval succeeded. Interval of days are retrieved as start_date and end_date.

Order result by start_date.

Solution(MSSql):
```
with t as
(
  select fail_date, row_number() over(order by fail_date) as fd
  from failed
  where fail_date between '2019-01-01' and '2019-12-31'
), 
t2 as(
  select success_date, row_number() over(order by success_date) as sd
  from succeeded
  where success_date between '2019-01-01' and '2019-12-31'
)

select 'failed' as period_state, min(t.fail_date) as start_date,
max(t.fail_date) as end_date
from t
group by datediff(day, t.fail_date, fd)
union all
select 'succeeded' as period_state, min(t2.success_date) as start_date,
max(t2.success_date) as end_date
from t2
group by datediff(day, t2.success_date, sd)
order by start_date
;
```
Link: https://leetcode.com/problems/report-contiguous-dates/
