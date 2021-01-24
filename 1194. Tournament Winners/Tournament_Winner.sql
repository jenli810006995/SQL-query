select group_id, player as player_id
from
(
  select group_id, player, dense_rank() over(partition by group_id order by total_score desc, player) as rnk
  from
  (
    select player, p.group_id, sum(score) as total_score
    from
    (
      select first_player as player, first_score as score
      from matches
      union all
      select second_player as player, second_score as score
      from matches
    ) m1
    right join players p
    on m1.player = p.player_id
    group by 1, 2
  ) m2
) m3
where rnk = 1
group by 1, 2
order by 2;

-- Link: https://leetcode.com/problems/tournament-winners/
