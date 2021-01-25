with recursive a as
(
  select v.user_id, v.visit_date, count(amount) as trans_counts
  from visits v
  left join transactions t
  on v.user_id = t.user_id
  and v.visit_date = t.transaction_date
  group by 1, 2
), 
b as
(
  select 0 as transactions_count
  union all
  select transactions_count + 1 from b
  where transactions_count < (select max(trans_counts) from a)
)

select transactions_count, count(a.trans_counts) as visits_count
from b
left join a
on a.trans_counts = b.transactions_count
group by 1
order by 1
;

-- Link: https://leetcode.com/problems/number-of-transactions-per-visit/
