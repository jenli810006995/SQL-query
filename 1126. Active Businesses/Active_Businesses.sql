select e.business_id
from
events e
right join
(
  select event_type, avg(occurences) as average
  from events
  group by event_type
) a
on e.event_type = a.event_type
where e.occurences > a.average
group by 1
having count(*) > 1
;

-- Link: https://leetcode.com/problems/active-businesses/
