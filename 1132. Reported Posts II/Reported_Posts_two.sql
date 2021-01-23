select round(100*(avg(rate)),2) as average_daily_percent
from 
(
  select a.action_date, (sum(a.action_date <= r.remove_date and a.post_id = r.post_id)/count(distinct a.post_id)) rate
  from 
  (
    select distinct post_id, action_date, action, extra from actions
    where extra = 'spam'
  )a, removals r
  group by 1
) x

-- Link: https://leetcode.com/problems/reported-posts-ii/
