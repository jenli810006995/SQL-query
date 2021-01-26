select customer_number
from orders
group by 1
having count(order_number) >= all(select count(order_number) from orders group by customer_number)
;
-- Link: https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
