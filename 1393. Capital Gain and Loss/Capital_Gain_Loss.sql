select stock_name, sum(if(operation ='Buy', -price, price)) as capital_gain_loss
from stocks
group by 1
;
-- Link: https://leetcode.com/problems/capital-gainloss/
