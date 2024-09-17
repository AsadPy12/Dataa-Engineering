-- LEFT JOIN: return all rows from the left table and matching rows from the right table. If the right table does not have corresponding rows, use NULL for the column values from the right table.

Select
	brand_id, 
	product_name,
	model_year,
	discount,
	p.list_price
From production.products p
Left Join sales.order_items o ON p.product_id = o. product_id And p.list_price = o.list_price
Where p.list_price > 6000
Order By list_price, discount

SELECT
    product_name,
    order_id
FROM
    production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id
ORDER BY
    order_id;

Select
    p.product_name,
	p.product_id,
	o.order_id,
	os.order_id
From production.products p
Left join sales.order_items o On p.product_id = o.product_id
Left Join sales.orders os On o.order_id = os.order_id

Select   
	s.store_id,
	s.quantity,
	ss.store_name,
	o.order_date,
	s.product_id
From production.stocks s
Left Join sales.stores ss On s.store_id = ss.store_id
Left Join sales.orders o On s.store_id = o.store_id

-- Remaining Part 












































