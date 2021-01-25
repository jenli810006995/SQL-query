select st.student_id, st.student_name, sb.subject_name, count(e.subject_name) as attended_exams
from students st
join subjects sb
left join examinations e
on st.student_id = e.student_id
and sb.subject_name = e.subject_name
group by 1, 3
order by 1
;
-- Link: https://leetcode.com/problems/students-and-examinations/

