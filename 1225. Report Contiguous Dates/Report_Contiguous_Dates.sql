select period_state, start_date, end_date
from
(
  select grp, period_state, min(date) as start_date, max(date) as end_date
  from
  (
  select 'failed' as period_state, fail_date as date, fail_date - interval(row_number() over(order by fail_date)) day as grp
  from failed
  where year(fail_date) = '2019'
  union all
  select 'succeeded' as period_state, success_date as date, success_date - interval(row_number() over(order by success_date)) day as grp
  from succeeded
  where year(success_date) = '2019'
) m
group by grp, period_state
) t
order by 2;

-- Link: https://leetcode.com/problems/report-contiguous-dates/
