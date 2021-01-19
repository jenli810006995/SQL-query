select distinct viewer_id as id
from views
group by viewer_id, view_date
having count(distinct article_id) >= 2
order by 1
;
-- Link: https://leetcode.com/problems/article-views-ii/
