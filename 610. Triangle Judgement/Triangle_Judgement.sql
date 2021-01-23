select *, case when x + y > z and y + z > x and x + z > y then 'Yes' else 'No' end as 'triangle' from triangle
;
-- Link: https://leetcode.com/problems/triangle-judgement/
