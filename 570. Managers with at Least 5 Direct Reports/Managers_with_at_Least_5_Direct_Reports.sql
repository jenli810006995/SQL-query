select name from employee
where id in
(
  select managerid from employee
  group by 1
  having count(*) >= 5
)
group by 1
;
-- Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
