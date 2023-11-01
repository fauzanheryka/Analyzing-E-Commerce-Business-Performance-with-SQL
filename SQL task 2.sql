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
    GROUP BY 1,2) tmp
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
GROUP BY 1)tmp2
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
having count(1) > 1)tmp3
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
GROUP BY 1,2)tmp4
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
join avg_order_freq on avg_order_freq.tahun = mau.tahun
;
	
