Given the the schema presented below find two actors who cast together the most and list titles of only those movies they were casting together. Order the result set alphabetically by the movie title.

```
Table film_actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | smallint                    | not null
film_id     | smallint                    | not null
...
Table actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | integer                     | not null 
first_name  | character varying(45)       | not null
last_name   | character varying(45)       | not null
...
Table film
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
film_id     | integer                     | not null
title       | character varying(255)      | not null
...
The desired output:
first_actor | second_actor | title
------------+--------------+--------------------
John Doe    | Jane Doe     | The Best Movie Ever
...
first_actor - Full name (First name + Last name separated by a space)
second_actor - Full name (First name + Last name separated by a space)
title - Movie title
Note: actor_id of the first_actor should be lower then actor_id of the second_actor

```
Solution:

```
select 
    concat(a1.first_name, ' ', a1.last_name) as second_actor,
    concat(a2.first_name, ' ', a2.last_name) as first_actor,
    f.title
from (
    select 
        r1.actor_id as actor_a_id, 
        r2.actor_id as actor_b_id,
        count(r1.film_id) as casted_together,
        array_agg(r1.film_id) as film_ids
    from film_actor r1 
    join film_actor r2 
        on r1.film_id = r2.film_id
        and r1.actor_id > r2.actor_id
    join film f
        on r1.film_id = f.film_id
    group by r1.actor_id, r2.actor_id
    order by casted_together desc
    limit 1
    ) s
join actor a1 on a1.actor_id = s.actor_a_id
join actor a2 on a2.actor_id = s.actor_b_id
join film f on f.film_id = any(s.film_ids)

```
Link: https://www.codewars.com/kata/5818bde9559ff58bd90004a2/train/sql
