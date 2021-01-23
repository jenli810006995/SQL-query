select s.student_id, s.student_name
from
(
  select student_id, (score = max(score) over(partition by exam_id)) + (score = min(score) over(partition by exam_id)) as quiet
  from exam
) e
join
student s
on e.student_id = s.student_id
group by student_id
having sum(quiet) = 0
;

-- Link: https://leetcode.com/problems/find-the-quiet-students-in-all-exams/
