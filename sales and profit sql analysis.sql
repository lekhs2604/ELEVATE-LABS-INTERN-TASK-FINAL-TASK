use sales;
describe sales_analysis2;
select * from sales_analysis2;

select count(*) FROM sales_analysis2;

select * from sales_analysis2
	  where profit is null;
      
select sum(case when order_id is null then 1 else 0 end) as missing_count,
          sum(case when order_id is not null then 1 else 0 end) as non_missing_count
from sales_analysis2;

select
    order_id,
    category,
    sub_category,
	sum(Amount) AS Total_Sales,
    sum(profit) as profit_margin,
    round(sum(profit) / nullif(sum(amount),0) * 10, 2) as profit_margin_percent
from sales_analysis2
GROUP BY order_id, category,sub_category
ORDER BY profit_margin_percent asc;