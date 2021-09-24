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
Solution: Break out to department_avg and compay_avg then it would be easier to put them together
```
with dep_average as
(
  select left(pay_date, 7) as pay_month,
    department_id,
    avg(amount) as dep_avg
  from salary s
  inner join
  employee e
  on s.employee_id = e.employee_id
  group by left(pay_date, 7), department_id
)
,
com_avg as
(
  select left(pay_date, 7) as pay_month,
  avg(amount) as com_avg
  from salary
  group by left(pay_date, 7)  
)

--select * from dep_average

select d.pay_month, d.department_id,
       case when dep_avg > com_avg then 'higher'
            when dep_avg = com_avg then 'same'
            else 'lower' end as comparison
from dep_average d
left join com_avg c
on d.pay_month = c.pay_month
order by pay_month desc

```
[Link](https://leetcode.com/problems/average-salary-departments-vs-company/)
