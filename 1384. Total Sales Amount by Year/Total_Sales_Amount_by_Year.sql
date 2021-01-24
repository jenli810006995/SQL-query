-- This solution is by using My SQL Server, it would not work for MySQL nor Oracle

select A.product_id, product_name, year as report_year, year_sales as total_amount
from
(
  select product_id, (datediff(day, period_start, case when period_end > '2018-12-31' then '2018-12-31' else period_end end) + 1) * average_daily_sales as year_sales,
    '2018' as year
    from sales
    where period_start <= '2018-12-31'
    union
  select product_id, (datediff(day, case when period_start < '2019-01-01' then '2019-01-01' else period_start end, case when period_end <= '2019-12-31' then period_end else '2019-12-31' end) + 1) * average_daily_sales as year_sales, 
    '2019' as year
    from sales
    where period_start <= '2019-12-31' and period_end > '2018-12-31'
    union
     select product_id, (datediff(day, case when period_start < '2020-01-01' then '2020-01-01' else period_start end, case when period_end <= '2020-12-31' then period_end else '2020-12-31' end) + 1) * average_daily_sales as year_sales, 
    '2020' as year
    from sales
    where period_start <= '2020-12-31' and period_end > '2019-12-31'
) A
join product p
on A.product_id = p.product_id
order by product_id, year
;

-- Link: https://leetcode.com/problems/total-sales-amount-by-year/
