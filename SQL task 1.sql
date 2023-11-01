create table customers (
	customer_id varchar(200),
	customer_unique_id varchar(200),
	customer_zip_code_prefix int,
	customer_city varchar(200),
	customer_state varchar(200)
);

create table geolocation (
	geoloc_zip_code_prefix varchar(200),
	geoloc_lat varchar(200),
	geoloc_lng varchar(200),
	geoloc_city varchar(200),
	geoloc_state varchar(200)
);

create table order_item (
	order_id varchar(200),
	order_item_id int,
	product_id varchar(200),
	seller_id varchar(200),
	shipping_limit_date timestamp,
	price float8,
	freight_value float8
);


create table reviews (
	review_id varchar(200),
	order_id varchar(200),
	review_score int, 
	review_comment_title varchar(200),
	review_comment_message text,
	review_creation_date timestamp,
	review_answer timestamp
);

create table payments (
	order_id varchar(200),
	payment_sequential int,
	payment_type varchar(200),
	payment_installment int,
	payment_value float8
);

create table orders (
	order_id varchar(200),
	customers_id varchar(200),
	order_status varchar(200),
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivered_date timestamp
);

create table products (
	product_id varchar(200),
	product_category_name varchar(200),
	product_name_length int,
	product_description_length int,
	product_photos_qty int,
	product_weight_g int,
	product_length_cm int,
	product_height_cm int,
	product_width_cm int
);

create table sellers (
	seller_id varchar(200),
	seller_zip_code int,
	seller_city varchar(200),
	seller_state varchar(200)
);

copy customers(
	customer_id,
	customer_unique_id,
	customer_zip_code_prefix,
	customer_city,
	customer_state)
from 'D:\Mini project\Dataset\customers_dataset.csv'
csv header;

copy geolocation (
	geoloc_zip_code_prefix,
	geoloc_lat,
	geoloc_lng,
	geoloc_city,
	geoloc_state)
from 'D:\Mini project\Dataset\geolocation_dataset.csv'
csv header;

copy payments (
	order_id,
	payment_sequential,
	payment_type,
	payment_installment,
	payment_value)
from 'D:\MiniProject1\Dataset\order_payments_dataset.csv'
csv header;

copy order_item (
	order_id,
	order_item_id,
	product_id ,
	seller_id,
	shipping_limit_date,
	price,
	freight_value)
from 'D:\Mini project\Dataset\order_items_dataset.csv'
delimiter ','
csv header;

copy reviews (
	review_id,
	order_id,
	review_score, 
	review_comment_title,
	review_comment_message,
	review_creation_date,
	review_answer timestamp)
from 'D:\Mini project\Dataset\order_reviews_dataset.csv'
csv header;

copy orders (
	order_id,
	customers_id,
	order_status,
	order_purchase_timestamp,
	order_approved_at,
	order_delivered_carrier_date,
	order_delivered_customer_date,
	order_estimated_delivered_date)
from 'D:\Mini project\Dataset\orders_dataset.csv'
delimiter ','
csv header;

copy products (
	product_id,
	product_category_name,
	product_name_length,
	product_description_length,
	product_photos_qty,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm)
from 'D:\Mini project\Dataset\product_dataset.csv'
csv header;


copy sellers (
	seller_id,
	seller_zip_code,
	seller_city,
	seller_state)
from 'D:\Mini project\Dataset\order_items_dataset.csv'
csv header;

alter table products add constraint pk_products primary key (product_id);
alter table sellers add constraint pk_sellers primary key (seller_id);
alter table customers add constraint pk_customers primary key (customer_id);
alter table orders add constraint pk_orders primary key (order_id);
alter table geolocation add constraint pk_geolocation primary key (geoloc_zip_code_prefix);