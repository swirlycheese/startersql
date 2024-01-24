CREATE DATABASE CUSTOMERS;
USE CUSTOMERS;

CREATE TABLE CUSTOMER 
(
customer_id int not null,
first_name varchar(50) not null,
last_name varchar(40) null,
constraint pk_customer primary key
(customer_id)
);

CREATE TABLE address 
(
address_id int not null,
building_number varchar(55) not null,
street varchar(55) not null,
city varchar(65),
constraint pk_address primary key
(address_id)
);

create table email_address(
email_address_id int not null, 
email_address_customer_id int,
email_address varchar(55) not null,
constraint pk_email_address primary key (email_address_id)
);
