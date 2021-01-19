select t.login_date, count(distinct user_id) as user_count
from
(
  select user_id, activity_date as login_date, rank() over(partition by user_id order by activity_date) as rnk
  from traffic 
  where activity = 'login'
)t
where datediff('2019-06-30', t.login_date) <= 90
and t.rnk = 1
group by 1
order by 1
;

-- Link: https://leetcode.com/problems/new-users-daily-count/
