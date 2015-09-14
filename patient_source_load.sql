use haiti;
truncate table patient_source;
load data infile 'c:\\Haiti\\haitidata.csv'
into table patient_source 
fields terminated by ','
LINEs TERMINATED BY '\r'
ignore 1 lines;
commit;