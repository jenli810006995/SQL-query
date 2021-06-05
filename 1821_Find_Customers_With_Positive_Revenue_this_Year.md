Table: Customers
```
+--------------+------+
| Column Name  | Type |
+--------------+------+
| customer_id  | int  |
| year         | int  |
| revenue      | int  |
+--------------+------+
```
(customer_id, year) is the primary key for this table.
This table contains the customer ID and the revenue of customers in different years.
Note that this revenue can be negative.
Write an SQL query to report the customers with postive revenue in the year 2021.
Return the result table in any order.

Solution(MySQL):
```
SELECT Customer_id
FROM 
(
SELECT * FROM 
Customers
WHERE year = '2021'
) x
WHERE revenue > 0
;
```
Link: https://leetcode.com/problems/find-customers-with-positive-revenue-this-year/
