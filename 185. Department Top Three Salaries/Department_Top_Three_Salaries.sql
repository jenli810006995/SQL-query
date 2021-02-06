select d.name as department, e.name as employee, salary
from department d join employee e on d.id = e.departmentid
where 3 > (select count(distinct e2.salary) from employee e2 where e2.salary > e.salary and e2.departmentid = e.departmentid)
;

-- Link: https://leetcode.com/problems/department-top-three-salaries/
