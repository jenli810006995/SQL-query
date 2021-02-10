select id, company, salary
from
(
  select id, company, salary, row_number() over(partition by company order by salary) as rno,
  count(*) over(partition by company) as cnt
  from employee
) x
where rno in (ceil(cnt/2), cnt/2 + 1)
;

-- Link: https://leetcode.com/problems/median-employee-salary/

