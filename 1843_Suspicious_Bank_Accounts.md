Table: Accounts
```
+----------------+------+
| Column Name    | Type |
+----------------+------+
| account_id     | int  |
| max_income     | int  |
+----------------+------+
```
account_id is the primary key for this table.
Each row contains information about the maximum monthly income for one bank account.

Table: Transactions
```
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| transaction_id | int      |
| account_id     | int      |
| type           | ENUM     |
| amount         | int      |
| day            | datetime |
+----------------+----------+
```
transaction_id is the primary key for this table.
Each row contains information about one transaction.
type is ENUM ('Creditor','Debtor') where 'Creditor' means the user deposited money into their account and 'Debtor' means the user withdrew money from their account.
amount is the amount of money depositied/withdrawn during the transaction.
 
Write an SQL query to report the IDs of all suspicious bank accounts.
A bank account is suspicious if the total income exceeds the max_income for this account for two or more consecutive months. The total income of an account in some month is the sum of all its deposits in that month (i.e., transactions of the type 'Creditor').
Return the result table in ascending order by transaction_id.

Solution(MySQL):
```
WITH cte AS 
(
  SELECT t.account_id, YEAR(day)*12+MONTH(day) AS month,
         (CASE WHEN SUM(amount) > a.max_income THEN 1 ELSE 0 END) AS exceed
  FROM Transactions t
  JOIN Accounts a
  ON t.account_id = a.account_id
  WHERE type = 'Creditor'
  GROUP BY YEAR(day)*12+MONTH(day), t.account_id
)

SELECT DISTINCT c1.account_id
FROM cte c1, cte c2
WHERE c1.account_id = c2.account_id
AND c1.month - c2.month = 1 AND c1.exceed = 1 AND c2.exceed = 1

```

Link: https://leetcode.com/problems/suspicious-bank-accounts/
