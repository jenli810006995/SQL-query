
select min(log_id) as start_id, max(log_id) as end_id
from
(
  select log_id, rank() over(order by log_id) as rnk,
  log_id - rank() over(order by log_id) as rn
  from Logs
) x
group by rn
;

-- Link: https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
