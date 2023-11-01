-- Active: 1691744869990@@127.0.0.1@5432@E-commerce project@public
--- no 1 annual customer activity growth
WITH mau as 
(
select tahun,
round(avg(maus),1 ) as avg_mau
from (
    select extract(year from order_purchase_timestamp) as tahun,
    extract(month from order_purchase_timestamp) as bulan,
    count(DISTINCT c.customer_id) as maus
    from orders o
    left join customers c 
    on o.customers_id = c.customer_id
    GROUP BY 1,2) sub1
GROUP BY 1
),
new_cust as(
select extract(year from first_buy) as tahun,
count(1) as new_customer
from (
select c.customer_unique_id,
min(o.order_purchase_timestamp) as first_buy
from customers c
left join orders o
on c.customer_id = o.customers_id
GROUP BY 1)sub2
GROUP BY 1
),
repeat_cust as (
    select tahun,
count(DISTINCT customer_unique_id) as repeat_customer
from(select 
extract(year from o.order_purchase_timestamp ) as tahun,
c.customer_unique_id,
count(1) as freq_buy
from customers c
left join orders o 
on c.customer_id = o.customers_id
GROUP BY 1,2
having count(1) > 1)sub3
GROUP BY 1
),
avg_order_freq as (
select tahun,
round(avg(freq_order),2) as avg_customer_order
from (select 
extract(year from o.order_purchase_timestamp) as tahun,
c.customer_unique_id,
count(1) as freq_order
from customers c
left join orders o 
on c.customer_id = o.customers_id
GROUP BY 1,2)sub4
GROUP BY 1
)
select mau.tahun,
mau.avg_mau,
new_cust.new_customer,
repeat_cust.repeat_customer,
avg_order_freq.avg_customer_order
from mau
join new_cust on new_cust.tahun = mau.tahun
join repeat_cust on repeat_cust.tahun = mau.tahun
join avg_order_freq on avg_order_freq.tahun = mau.tahun ;

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
;

--- task 4 

select 
payment_type,
count (order_id) as payment_usage 
from payments
GROUP BY 1;

-- detail information payment type
with payment_use as (
select 
extract(year from order_purchase_timestamp) as year,
py.payment_type,
count(2) as payment_usage
from payments py
left JOIN orders o 
on py.order_id = o.order_id
where py.payment_type != 'not_defined'
GROUP BY 1,2
) --- karena tahun 2016 memiliki keterbatasan data maka hanya akan menghitung dari tahun 2017 dan 2018 saja.
select 
payment_type,
sum(case when year = '2016' then payment_usage else 0 end ) as year_2016,
sum(case when year = '2017' then payment_usage else 0 end ) as year_2017,
sum(case when year = '2018' then payment_usage else 0 end ) as year_2018,
sum(payment_usage) as total_payment_usage
from payment_use 
GROUP BY 1
order by 4 desc;
