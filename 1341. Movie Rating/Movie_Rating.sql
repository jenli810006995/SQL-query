(
  select u.name as results
  from users u
  join
  movie_rating mr
  on u.user_id = mr.user_id
  group by results
  order by count(rating) desc, results
  limit 1
)
union all
(
  select m.title as results
  from movies m
  join movie_rating mr
  on m.movie_id = mr.movie_id
  where date_format(created_at, '%Y-%m') = '2020-02'
  group by results
  order by avg(rating) desc, results
  limit 1
)
-- Link: https://leetcode.com/problems/movie-rating/
