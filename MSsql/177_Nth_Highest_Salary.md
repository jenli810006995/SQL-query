Write a SQL query to get the nth highest salary from the Employee table.
```
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.
```
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
```

Solution:
```
create function getNthHighestSalary(n int) returns int
begin
    set n = n - 1;
    return(select distinct Salary from Employee order by Salary desc limit 1 offset n);
end
```
```
Link: https://leetcode.com/problems/nth-highest-salary/
```
