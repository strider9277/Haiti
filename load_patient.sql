use haiti;
insert into haiti.patient (first_name,
					 last_name,
                     birth_date,
                     gender_id,
                     home_phone,
                     home_village,
                     add_dt)
SELECT first_name, 
       last_name, 
       str_to_date(date_of_birth, '%m/%d/%RRRR') birth_date,
       gender_id,
       home_phone,
       city as home_village,
       current_date as add_dt
FROM haiti.patient_source ps, gender g
      where ps.gender = g.gender_code;
commit;
set foreign_key_checks = 1;

## fix birth_date
update patient set birth_date = (birth_date - interval 100 year)
  where birth_date > current_date();
commit;