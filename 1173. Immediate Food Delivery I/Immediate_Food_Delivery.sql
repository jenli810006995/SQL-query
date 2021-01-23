select round(100*(sum(case when customer_pref_delivery_date = order_date then 1 else 0 end)/count(distinct delivery_id)),2) as immediate_percentage
from delivery
;

-- Link: https://leetcode.com/problems/immediate-food-delivery-i/
