select player_id, device_id
from
(
  select player_id, device_id, rank() over(partition by player_id order by event_date) as rnk
  from activity
) x
where rnk = 1;

-- Link: https://leetcode.com/problems/game-play-analysis-ii/

