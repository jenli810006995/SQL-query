Table: Transactions
```
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| transaction_id | int      |
| day            | datetime |
| amount         | int      |
+----------------+----------+
```
transaction_id is the primary key for this table.
Each row contains information about one transaction.
Write an SQL query to report the IDs of the transactions with the maximum amount on their respective day. If in one day there are multiple such transactions, return all of them.
Return the result table in ascending order by transaction_id.

Solution(MySQL):
```
SELECT transaction_id
FROM
Transactions
WHERE (DATE(day), amount) IN
(
  SELECT DATE(day) AS day, MAX(amount) AS max_amt FROM
  Transactions
  GROUP BY 1
)
ORDER BY 1
;

```
Link: https://leetcode.com/problems/maximum-transaction-each-day/
