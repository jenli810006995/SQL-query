select spend_date, 'both' as platform, sum(case when type = 2 then amount else 0 end) as total_amount,
       count(distinct case when type = 2 then user_id else null end) as total_users
 from
 (
 select *, count(platform) over(partition by spend_date, user_id) as type
 from spending
 ) t
 group by 1
 union 
 select spend_date, 'desktop' as platform, sum(case when type = 1 and platform = 'desktop' then amount else 0 end) as total_amount,
       count(distinct case when type = 1 and platform = 'desktop' then user_id else null end) as total_users
 from
 (
 select *, count(platform) over(partition by spend_date, user_id) as type
 from spending
 ) t
 group by 1
 union
 select spend_date, 'mobile' as platform, sum(case when type = 1 and platform = 'mobile' then amount else 0 end) as total_amount,
       count(distinct case when type = 1 and platform = 'mobile' then user_id else null end) as total_users
 from
 (
 select *, count(platform) over(partition by spend_date, user_id) as type
 from spending
 ) t
 group by 1
 
 -- Link: https://leetcode.com/problems/user-purchase-platform/
