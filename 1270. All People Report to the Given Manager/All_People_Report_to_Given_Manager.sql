select employee_id from employees
where manager_id in
(
  select employee_id from employees where manager_id in
  (
    select employee_id from employees where manager_id = 1
  )
)
and employee_id != manager_id;

-- Link: https://leetcode.com/problems/all-people-report-to-the-given-manager/
