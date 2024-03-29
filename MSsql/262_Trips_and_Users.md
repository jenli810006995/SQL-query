Table: Trips
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| Id          | int      |
| Client_Id   | int      |
| Driver_Id   | int      |
| City_Id     | int      |
| Status      | enum     |
| Request_at  | date     |     
+-------------+----------+
```
Id is the primary key for this table.
The table holds all taxi trips. Each trip has a unique Id, while Client_Id and Driver_Id are foreign keys to the Users_Id at the Users table.
Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).

Table: Users
```
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| Users_Id    | int      |
| Banned      | enum     |
| Role        | enum     |
+-------------+----------+
```
Users_Id is the primary key for this table.
The table holds all users. Each user has a unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).
Status is an ENUM type of (‘Yes’, ‘No’).

Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03".
The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.
Return the result table in any order. Round Cancellation Rate to two decimal points.

Solution:
```
select t.Request_at as Day, 
cast((select cast(count(*) as float) from Trips join Users on Trips.Client_Id = Users.Users_Id
and Request_at = t.Request_at and Status != 'completed' and Banned = 'No')/(select cast(count(*) as float) from Trips join Users on Trips.Client_Id = Users.Users_Id
and Request_at = t.Request_at and Banned = 'No') as decimal(16,2)) as 'Cancellation Rate'
from Trips t
where t.Request_at between '2013-10-01' and '2013-10-03'
group by t.Request_at

```
```
Link: https://leetcode.com/problems/trips-and-users/
```
