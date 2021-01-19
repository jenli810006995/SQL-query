select distinct l1.num as ConsecutiveNums from Logs l1, Logs l2, Logs l3
where l1.num = l2.num and l1.num = l3.num
and l1.Id = l2.Id - 1 and l1.Id = l3.Id - 2
;
-- Link: https://leetcode.com/problems/consecutive-numbers/
