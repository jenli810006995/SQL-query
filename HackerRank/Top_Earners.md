We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.

Solution(My SQL):
```
select months*salary, count(*) from employee
group by months*salary
order by months*salary desc
limit 1
;
```

Solution(SQL Server):
```
select concat((select max(months*salary) from employee), ' ',
              (select count(*) from (select rank() over(order by months*salary desc) as rnk from employee) t where t.rnk = 1));
```

Link: https://www.hackerrank.com/challenges/earnings-of-employees/problem
