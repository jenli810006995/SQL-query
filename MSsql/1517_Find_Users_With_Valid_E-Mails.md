Table: Users
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+
```
user_id is the primary key for this table.
This table contains information of the users signed up in a website. Some e-mails are invalid.
 
Write an SQL query to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where: 

The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.' and/or dash '-'. The prefix name must start with a letter.
The domain is '@leetcode.com'.
Return the result table in any order.

Solution(MSSql):
```
select * from Users
where left(mail, 1) like '[a-zA-Z]%'
and right(mail, 13) like '@leetcode.com'
and left(mail, len(mail) - 13) not like '%[^A-Za-z0-9_.-]%';

```
Link: https://leetcode.com/problems/find-users-with-valid-e-mails/
