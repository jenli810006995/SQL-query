select uni.unique_id, e.name
from employeeuni uni
right join
employees e
on uni.id = e.id
;
-- Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
