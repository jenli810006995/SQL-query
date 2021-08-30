The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.
```
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
```
The Department table holds all departments of the company.
```
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
```
Write a SQL query to find employees who have the highest salary in each of the departments. 
For the above tables, your SQL query should return the following rows (order of rows does not matter).
```
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
```
Solution:
```
select d.name as Department,
       e.name as Employee,
       Salary
from Employee e
right join Department d
on e.DepartmentId = d.Id
where (e.Salary, e.DepartmentId) in
(select max(salary) as salary, DepartmentId from Employee
group by DepartmentId)
```
Comment: Use right join to make sure we only output employees having departments

```
Link: https://leetcode.com/problems/department-highest-salary/
```
