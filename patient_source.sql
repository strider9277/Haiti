use haiti;
drop table patient_source;
create table patient_source
(first_name varchar(40),
 last_name varchar(40),
 date_of_birth varchar(20),
 gender varchar(10),
 city varchar(20),
 zip_code varchar(5),
 home_phone varchar(20),
 medical_history varchar(20),
 church varchar(20),
 believer varchar(1),
 medication varchar(1),
 allergies varchar(1),
 other varchar(1));
 