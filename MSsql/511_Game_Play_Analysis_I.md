Table: Activity
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
```
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
Write an SQL query that reports the first login date for each player.

Solution:
```
with cte as
(
  select player_id, event_date, rank() over(partition by player_id order by event_date) as rnk
  from Activity
)

select player_id, event_date as first_login
from cte
where rnk = 1
```
```
Link: https://leetcode.com/problems/game-play-analysis-i/
```
