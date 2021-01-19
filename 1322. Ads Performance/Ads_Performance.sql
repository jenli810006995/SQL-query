select a.ad_id, round(ifnull((c.total_clicks/(c.total_clicks + v.total_views))*100,0),2) as ctr
from ads a
join
(
  select ad_id, sum(case when action = 'Clicked' then 1 else 0 end) as total_clicks
  from ads
  group by 1
) c
on a.ad_id = c.ad_id
join
(
  select ad_id, sum(case when action = 'Viewed' then 1 else 0 end) as total_views
  from ads
  group by 1
) v
on a.ad_id = v.ad_id
group by 1
order by 2 desc, 1 asc;

-- Link: https://leetcode.com/problems/ads-performance/
