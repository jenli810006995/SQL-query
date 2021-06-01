Table: Tasks
```
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| task_id        | int     |
| subtasks_count | int     |
+----------------+---------+
```
task_id is the primary key for this table.
Each row in this table indicates that task_id was divided into subtasks_count subtasks labelled from 1 to subtasks_count.
It is guaranteed that 2 <= subtasks_count <= 20. 

Table: Executed
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| task_id       | int     |
| subtask_id    | int     |
+---------------+---------+
```
(task_id, subtask_id) is the primary key for this table.
Each row in this table indicates that for the task task_id, the subtask with ID subtask_id was executed successfully.
It is guaranteed that subtask_id <= subtasks_count for each task_id.
 
Write an SQL query to report the IDs of the missing subtasks for each task_id.
Return the result table in any order.

Solution(My SQL):
```
WITH RECURSIVE id AS
(
  SELECT task_id, subtasks_count, 1 AS subtask_id
  FROM Tasks
  UNION ALL
  SELECT task_id, subtasks_count, subtask_id + 1 as subtask_id
  FROM 
  id
  WHERE subtask_id < (SELECT MAX(subtasks_count) FROM Tasks)
)

SELECT id.task_id, id.subtask_id
FROM id
LEFT JOIN
Executed e ON id.task_id = e.task_id
AND id.subtask_id = e.subtask_id
WHERE e.subtask_id IS NULL
AND id.subtasks_count >= id.subtask_id

```
Link: https://leetcode.com/problems/find-the-subtasks-that-did-not-execute/
