select d.pay_month, department_id, case when dep_avg > com_avg then 'higher' when dep_avg < com_avg then 'lower' else 'same' end as comparison
from
(
  select date_format(pay_date, '%Y-%m') as pay_month, department_id, avg(amount) as dep_avg
  from salary s
  join employee e
  on s.employee_id = e.employee_id
  group by department_id, pay_month
) d
join
(
  select date_format(pay_date, '%Y-%m') as pay_month, avg(amount) as com_avg
  from salary
  group by pay_month
) s
on d.pay_month = s.pay_month
;
-- Link: https://leetcode.com/problems/average-salary-departments-vs-company/
