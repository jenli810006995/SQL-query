select d.name as department, e.name as employee, salary
from department d join employee e on d.id = e.departmentid
where (e.salary, e.departmentid) in
(select max(salary), departmentid from employee group by departmentid)
;
-- Link: https://leetcode.com/problems/department-highest-salary/
