-- Checking data in database

use BikeStores
select * from sales.customers
select * from sales.orders
select * from sales.staffs
select * from production.products
select * from production.stocks
select * from sales.order_items
select * from sales.stores


select * from sales.customers where state = 'TX'