Table: Employees
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
```
employee_id is the primary key for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

Solution(MySQL):
```
SELECT a.employee_id, a.name, COUNT(b.reports_to) AS reports_count, ROUND(AVG(b.age),0) AS average_age
FROM Employees a, Employees b
WHERE a.employee_id = b.reports_to
GROUP BY employee_id
ORDER BY employee_id
;
```
Link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
