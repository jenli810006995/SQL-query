Table: Employee
```
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| Id           | int     |
| Name         | varchar |
| Salary       | int     |
| DepartmentId | int     |
+--------------+---------+
```
Id is the primary key for this table.
Each row contains the ID, name, salary, and department of one employee.
 
Table: Department
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Name        | varchar |
+-------------+---------+
```
Id is the primary key for this table.
Each row contains the ID and the name of one department. 

A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write an SQL query to find the employees who are high earners in each of the departments.
Return the result table in any order.

Solution:
```
select d.name as Department,
       e1.name as Employee,
       salary
from
Employee e1
join Department d
on e1.DepartmentId = d.Id
where 3 > (select count(distinct e2.salary) from employee e2
where e2.salary > e1.salary and e2.departmentid = e1.departmentid)
```
```
Link: https://leetcode.com/problems/department-top-three-salaries/
```
