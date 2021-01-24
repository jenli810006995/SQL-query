select activity_date as day, count(distinct user_id) as active_users
from activity where datediff('2019-07-27', activity_date) < 30 -- bc '2019-07-27' is the end date, inclusively
group by 1
;
-- Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
