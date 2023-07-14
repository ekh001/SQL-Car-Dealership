--Primary Keys can't be empty or duplicated.
--Create tables without foreign keys first! All your "only primary keys" should be created first.

--Customer 
create table customer (
	customer_id SERIAL primary key,
	cu_first_name VARCHAR(150),
	cu_last_name VARCHAR(150),
	phone_number VARCHAR(100),
	billiing_info VARCHAR(150)
);

ALTER TABLE customer RENAME COLUMN billiing_info TO billing_info;


--Salesperson 
create table salesperson (
	salesperson_id SERIAL primary key,
	sp_first_name VARCHAR(150),
	sp_last_name VARCHAR(150)
);

--Car 
create table car (
	serial_number SERIAL primary key,
	car_make VARCHAR(150),
	car_model VARCHAR(150),
	vehicle_price NUMERIC(8,2),
	customer_id INTEGER not null,
	salesperson_id INTEGER not null,
	foreign key(customer_id) references customer(customer_id),
	foreign key(salesperson_id) references salesperson(salesperson_id)
);

--Sales invoice 
create table invoice (
	upc SERIAL primary key,
	total_sales_price NUMERIC(8,2),
	sales_date DATE default CURRENT_DATE,
	salesperson_id INTEGER not null,
	foreign key(salesperson_id) references salesperson(salesperson_id)
);

--Mechanic 
create table mechanic (
	mechanic_id SERIAL primary key,
	me_first_name VARCHAR(150),
	me_last_name VARCHAR(150),
	serial_number INTEGER not null, 
	foreign key(serial_number) references car(serial_number)
)

--Service 
create table service (
	service_id SERIAL primary key,
	service_price VARCHAR(150),
	service_ticket VARCHAR(150),
	serial_number INTEGER not null, 
	foreign key(serial_number) references car(serial_number)
)

--Service records 
create table service_records (
	record_id SERIAL primary key,
	service_id INTEGER not null,
	customer_id INTEGER not null,
	mechanic_id INTEGER not null,
	serial_number INTEGER not null, 
	foreign key(service_id) references service(service_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(serial_number) references car(serial_number)
)
