select w1.id from weather w1, weather w2
where w1.temperature > w2.temperature
and datediff(w1.recorddate, w2.recorddate) = 1
;
-- Link: https://leetcode.com/problems/rising-temperature/
