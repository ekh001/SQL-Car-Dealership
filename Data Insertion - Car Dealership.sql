
------------------------------------------------------------------------------------------------------------

--insert data into customer
insert into customer(
	customer_id,
	cu_first_name,
	cu_last_name,
	phone_number,
	billiing_info
) values (
	2,
	'Harry',
	'Styles',
	'987-654-3210',
	'5994-3581-6482-5498 123 04/23'
);

--Insert data into salesperson
insert into salesperson(
	salesperson_id,
	sp_first_name,
	sp_last_name
) values (
	2,
	'Ji-cheol',
	'Gong'
);

--insert data into car: 
insert into car (
	serial_number,
	car_make,
	car_model,
	vehicle_price,
	customer_id,
	salesperson_id
) values (
	987654321,
	'Porsche',
	'911',
	2.50,
	2,
	2
);

--insert data into invoice: 
insert into invoice (
	upc,
	total_sales_price,
	salesperson_id
) values (
	2,
	2.50,
	2
);

--Insert data into mechanic:
insert into mechanic(
	mechanic_id,
	me_first_name,
	me_last_name,
	serial_number
) values (
	2,
	'Yoongi',
	'Min',
	987654321
);

--Insert data into service:
insert into service(
	service_id,
	service_price,
	service_ticket,
	serial_number 
) values (
	2,
	'$88.63',
	'A',
	987654321
);

--Insert data into service records:
insert into service_records(
	record_id,
	service_id,
	customer_id,
	mechanic_id,
	serial_number 
) values (
	2,
	2,
	2,
	2,
	987654321
);

select * from customer

--Stored function to add static sales tax
create or replace procedure salestax(
	customer INTEGER,
	salesTaxAmount DECIMAL
)
language plpgsql
as $$
begin
	update invoice
	set total_sales_price = total_sales_price + salesTaxAmount;
	commit;
end;
$$

call salestax(1, 2.00);

select * from invoice
--------------------------------------------------------------------------------

--Stored function to add customers
create or replace function add_customer(_customer_id INTEGER, _cu_first_name VARCHAR, _cu_last_name VARCHAR, _phone_number VARCHAR, _billing_info VARCHAR)
returns void
as $MAIN$
begin
	insert into customer(customer_id, cu_first_name, cu_last_name, phone_number, billing_info)
	values (_customer_id, _cu_first_name, _cu_last_name, _phone_number, _billing_info);
end;
$MAIN$
language plpgsql;

select add_customer(4, 'Danny', 'Devito', '523-536-2103', '4444-7777-7777-4444 444 01/32');
select * from customer;

--drop function add_customer(_customer_id INTEGER, _cu_first_name VARCHAR, _cu_last_name VARCHAR, _phone_number VARCHAR, _billiing_info VARCHAR);
