Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
but did not realize her keyboard's 0 key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

Solution(MySQL):
```
select ceil(avg(salary) - avg(replace(salary, '0', ''))) from employees;
```

Solution(SQL Server):
```
select cast(ceiling(avg(cast(salary as float)) - avg(cast(replace(salary, '0', '') as float))) as int) 
from employees;

```
Link: https://www.hackerrank.com/challenges/the-blunder/problem
