select id, name
from students
where department_id not in
(
  select id from departments
)
;
-- Link: https://leetcode.com/problems/students-with-invalid-departments/
