select username, activity, startDate, endDate
from
(
  select distinct username, activity, startDate, endDate, dense_rank() over(partition by username order by startDate desc) as rnk,
  count(activity) over(partition by username) as cnt
  from useractivity
) x
where x.rnk = 2
or x.cnt = 1
;

-- Link: https://leetcode.com/problems/get-the-second-most-recent-activity/
