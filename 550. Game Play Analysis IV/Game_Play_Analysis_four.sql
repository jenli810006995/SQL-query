select round(count(distinct t.player_id)/t1.total, 2) as fraction
from
(
  select player_id, device_id, event_date - lag(event_date, 1) over(partition by player_id order by event_date) as diff,
  dense_rank() over(partition by player_id order by event_date) as rnk
  from activity
) t,
(
  select count(distinct player_id) as total from activity
) t1
where t.diff = 1
and t.rnk = 2;

-- Link: https://leetcode.com/problems/game-play-analysis-iv/
