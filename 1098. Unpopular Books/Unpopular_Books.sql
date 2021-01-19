select b.book_id, b.name
from books b
left join
orders o
on b.book_id = o.book_id
where available_from < date_sub('2019-06-23', interval 1 month)
group by 1
having sum(case when dispatch_date >= date_sub('2019-06-23', interval 1 year) then quantity else 0 end) < 10;

-- Link: https://leetcode.com/problems/unpopular-books/
