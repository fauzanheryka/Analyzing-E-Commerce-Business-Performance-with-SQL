with rty as ( --total revenue year
SELECT 
extract (year from o.order_purchase_timestamp) as year,
round(sum(oi.price + oi.freight_value)) as revenue
from orders o 
join order_item oi 
on o.order_id = oi.order_id 
where o.order_status = 'delivered'
GROUP BY 1 
order by 1
),
co as( -- canceled order
select 
extract(year from order_purchase_timestamp) as year,
count(order_id) as canceled_order
from orders
where order_status = 'canceled'
GROUP BY 1
order by 1 asc
),
tp as( -- top product
select 
year,
most_top_product,
qty_top_product,
product_revenue
from(select 
extract(year from o.order_purchase_timestamp) as year,
p.product_category_name as most_top_product,
count(2) as qty_top_product,
round(sum(oi.price + oi.freight_value)) as product_revenue,
rank()over(PARTITION BY extract(year from o.order_purchase_timestamp) order by sum(oi.price + oi.freight_value) desc) as rank_product 
from orders o 
join order_item oi 
on o.order_id = oi.order_id
join products p 
on oi.product_id = p.product_id 
where order_status = 'delivered'
GROUP BY 1,2) as subq
where rank_product = 1
),
cp as ( -- canceled product
select 
year,
most_canceled_product,
qty_top_canceled_order
from(select 
extract(year from o.order_purchase_timestamp) as year,
p.product_category_name as most_canceled_product,
count(2) as qty_top_canceled_order,
rank()over(PARTITION BY extract(year from o.order_purchase_timestamp) order by count(2) desc) as rank_product 
from orders o 
join order_item oi 
on o.order_id = oi.order_id
join products p 
on oi.product_id = p.product_id 
where order_status = 'canceled'
GROUP BY 1,2) as subq
where rank_product = 1
)
select 
rty.year,
rty.revenue as year_total_revenue,
co.canceled_order as year_total_cancel_order,
tp.most_top_product,
tp.qty_top_product,
tp.product_revenue as top_product_revenue,
cp.most_canceled_product,
cp.qty_top_canceled_order
from rty
join co on rty.year = co.year 
join tp on rty.year = tp.year 
join cp on rty.year = cp.year 