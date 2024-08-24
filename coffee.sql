SELECT * FROM coffee_shop_sales;

select
month(transaction_date) AS month,
round( count(unit_price * transaction_qty)) AS total_sales,
(count(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty),1)

 over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty),1)
 over(order by month(transaction_date))*100 as month_increasing_percentage
 from
 coffee_shop_sales
 where
 month(transaction_date) IN (4,5)
 group by
 month(transaction_date);