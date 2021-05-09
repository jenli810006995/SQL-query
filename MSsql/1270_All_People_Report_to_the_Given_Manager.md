Table: Employees
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| employee_name | varchar |
| manager_id    | int     |
+---------------+---------+
```
employee_id is the primary key for this table.
Each row of this table indicates that the employee with ID employee_id and name employee_name reports his work to his/her direct manager with manager_id
The head of the company is the employee with employee_id = 1.
 
Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

The indirect relation between managers will not exceed 3 managers as the company is small.

Return result table in any order without duplicates.

Solution(MSSql):
```
select main.employee_id from Employees as main
left join Employees t1 on main.manager_id = t1.employee_id
left join Employees t2 on t1.manager_id = t2.employee_id
where main.employee_id != 1 and t2.manager_id = 1
;
```
Link: https://leetcode.com/problems/all-people-report-to-the-given-manager/
