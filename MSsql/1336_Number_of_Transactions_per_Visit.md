Table: Visits
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| visit_date    | date    |
+---------------+---------+
```
(user_id, visit_date) is the primary key for this table.
Each row of this table indicates that user_id has visited the bank in visit_date.
 
Table: Transactions
```
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| user_id          | int     |
| transaction_date | date    |
| amount           | int     |
+------------------+---------+
```
There is no primary key for this table, it may contain duplicates.
Each row of this table indicates that user_id has done a transaction of amount in transaction_date.
It is guaranteed that the user has visited the bank in the transaction_date.(i.e The Visits table contains (user_id, transaction_date) in one row)
 
A bank wants to draw a chart of the number of transactions bank visitors did in one visit to the bank and the corresponding number of visitors who have done this number of transaction in one visit.

Write an SQL query to find how many users visited the bank and didn't do any transactions, how many visited the bank and did one transaction and so on.

The result table will contain two columns:

transactions_count which is the number of transactions done in one visit.
visits_count which is the corresponding number of users who did transactions_count in one visit to the bank.
transactions_count should take all values from 0 to max(transactions_count) done by one or more users.

Order the result table by transactions_count.

Solution(MSSql):
```
select c.counts as transactions_count,
       count(a.transactions_count) as visits_count
       
from
(
  select distinct row_number() over(partition by user_id, transaction_date order by transaction_date) as counts
  from Transactions 
  union all
  select 0
) c
left join
(
  select count(transaction_date) as transactions_count
  from Visits v
  left join
  Transactions t
  on v.user_id = t.user_id
  and v.visit_date = t.transaction_date
  group by v.user_id, v.visit_date
) a
on c.counts = a.transactions_count
group by counts;
```
Link: https://leetcode.com/problems/number-of-transactions-per-visit/
