Given two tables as below, write a query to display the comparison result (higher/lower/same) of the average salary of employees in a department to the company's average salary.
 

Table: salary
```
| id | employee_id | amount | pay_date   |
|----|-------------|--------|------------|
| 1  | 1           | 9000   | 2017-03-31 |
| 2  | 2           | 6000   | 2017-03-31 |
| 3  | 3           | 10000  | 2017-03-31 |
| 4  | 1           | 7000   | 2017-02-28 |
| 5  | 2           | 6000   | 2017-02-28 |
| 6  | 3           | 8000   | 2017-02-28 |
``` 
The employee_id column refers to the employee_id in the following table employee. 
```
| employee_id | department_id |
|-------------|---------------|
| 1           | 1             |
| 2           | 2             |
| 3           | 2             |
 
```
So for the sample data above, the result is:
``` 
| pay_month | department_id | comparison  |
|-----------|---------------|-------------|
| 2017-03   | 1             | higher      |
| 2017-03   | 2             | lower       |
| 2017-02   | 1             | same        |
| 2017-02   | 2             | same        |
```

Solution:
```
select department_salary.pay_month, department_id, 
case when department_salary.dep_avg > company_salary.com_avg then 'higher'
     when department_salary.dep_avg < company_salary.com_avg then 'lower'
     else 'same' end as comparison
from
(
  select avg(amount) as dep_avg, department_id, left(pay_date, 7) as pay_month
  from salary
  join employee
  on salary.employee_id = employee.employee_id
  group by department_id, left(pay_date, 7)
) department_salary
join
(
select avg(amount) as com_avg,
left(pay_date, 7) as pay_month
from salary
group by left(pay_date, 7)
) company_salary
on department_salary.pay_month = company_salary.pay_month
;

```
Link: https://leetcode.com/problems/average-salary-departments-vs-company/
