Table: Student
```
+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| student_id          | int     |
| student_name        | varchar |
+---------------------+---------+
```
student_id is the primary key for this table.
student_name is the name of the student.
 
Table: Exam
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| exam_id       | int     |
| student_id    | int     |
| score         | int     |
+---------------+---------+
```
(exam_id, student_id) is the primary key for this table.
Student with student_id got score points in exam with id exam_id.
 
A "quite" student is the one who took at least one exam and didn't score neither the high score nor the low score.

Write an SQL query to report the students (student_id, student_name) being "quiet" in ALL exams.

Don't return the student who has never taken any exam. Return the result table ordered by student_id.

Solution:
```
with cte as 
(
  select e.student_id, s.student_name, score, rank() over(partition by exam_id order by score) as rnk1, rank() over(partition by exam_id order by score desc) as rnk2
  from Exam e
  left join Student s
  on e.student_id = s.student_id
)

select distinct student_id, student_name
from cte
where student_id not in (select student_id from cte where rnk1=1 or rnk2=1)
group by student_id
order by student_id
```
```
Link: https://leetcode.com/problems/find-the-quiet-students-in-all-exams/
```
