drop database haiti;
create database haiti;
use haiti;
SET foreign_key_checks = 0;  /*turn off constraint checking */
#
# mission_trip Table
#
drop table if exists mission_trip;
create table if not exists mission_trip (
mission_trip_id int(11) not null,
trip_year      varchar(4) not null,
trip_month     varchar(50) not null,
mission_type   varchar(20),
begin_date     datetime,
end_date       datetime,
add_dt         datetime,
update_ts      timestamp,
primary key (mission_trip_id));
insert into mission_trip(mission_trip_id, trip_year, trip_month,
                        mission_type, begin_date, end_date, add_dt)
values (1, '2013', 'October', 
        'Medical', '2013-10-12', '2013-10-19', current_timestamp);
insert into mission_trip(mission_trip_id, trip_year, trip_month,
                        mission_type, begin_date, end_date, add_dt)
values (2, '2014', 'March', 
        'Medical', '2014-03-01', '2014-03-10', current_timestamp);
commit;
insert into mission_trip(mission_trip_id, trip_year, trip_month,
                        mission_type, begin_date, end_date, add_dt)
values (3, '2014', 'October', 
        'Medical', '2014-09-27', '2014-10-04', current_timestamp);
commit;
insert into mission_trip(mission_trip_id, trip_year, trip_month,
                        mission_type, begin_date, end_date, add_dt)
values (4, '2015', 'March', 
        'Medical', '2015-03-14', '2015-03-21', current_timestamp);
insert into mission_trip(mission_trip_id, trip_year, trip_month,
                        mission_type, begin_date, end_date, add_dt)
values (5, '2015', 'October', 
        'Medical', '2015-10-10', '2015-03-17', current_timestamp);
commit;
#
# team_member Table
#
drop table if exists team_member;
create table if not exists team_member (
team_member_id int(11) not null,
first_name     varchar(30) not null,
last_name      varchar(50) not null,
phone_number   varchar(30) not null,
email          varchar(100),
home_church    varchar(100),
address1       varchar(100),
address2       varchar(100),
city           varchar(30),
state          varchar(30),
zipcode        varchar(15),
country        varchar(50),
medical_fl     bool,
elder_fl       bool,
add_dt         datetime,
update_ts      timestamp,
primary key (team_member_id));

insert into team_member(team_member_id, first_name, last_name, 
                        phone_number, email, 
                        home_church, address1,
                        city, state, zipcode, country, 
                        medical_fl,elder_fl, add_dt)
values (1, 'Jeff', 'Thompson', '319-400-3960', 'thompsonja@aol.com', 
        'Grace Community Downtown', '203 Friendship Street', 
        'Iowa City', 'IA', '52245', 'USA', 
         false, true, current_timestamp);
insert into team_member(team_member_id, first_name, last_name, 
                        phone_number, email, home_church, address1, 
                        city, state, zipcode, country, 
                        medical_fl, elder_fl, add_dt)
values (2, 'Dan', 'Bovenmeyer', '319-621-3425', 'danb@graceb3.org',
        'Grace Community Downtown', '2819 Brookside Drive', 
        'Iowa City', 'IA','52245', 'USA', 
         false, true, current_timestamp);
insert into team_member(team_member_id, first_name, last_name, 
                        phone_number, email, 
                        home_church, address1, 
                        city, state, zipcode, country, 
                        medical_fl, elder_fl, add_dt)
values (3, 'Matt', 'Anderson', '319-530-9270', 'mcanderson@live.com',
        'Grace Community North Liberty', '2106 Peaceful Valley Pkwy', 
        'Waunakee', 'WI','53562', 'USA', 
        true, false, current_timestamp);
insert into team_member(team_member_id, first_name, last_name, 
                        phone_number, email, home_church, address1, 
                        city, state, zipcode, country, 
                        medical_fl, elder_fl, add_dt)
values (4, 'Kim', 'Anderson', '319-330-3208', 'sweetander@hotmail.com',
        'Grace Community North Liberty', '2106 Peaceful Valley Pkwy', 
        'Waunakee', 'WI','53597', 'USA', 
        false, false, current_timestamp);
insert into team_member(team_member_id, first_name, last_name, 
                        phone_number, email, home_church, address1, 
                        city, state, zipcode, country, 
                        medical_fl, elder_fl, add_dt)
values (5, 'Dave', 'Kirk', '319-541-7275', 'davek@graceb3.org',
        'Grace Community North Liberty', '1550 Sadler Dr.', 
        'North Liberty', 'IA','52317', 'USA', 
        false, true, current_timestamp);
commit;
#
# mission_team Table
#
drop table if exists mission_team;
create table if not exists mission_team (
mission_team_id int(11) not null auto_increment,
mission_trip_id int(11) not null,
team_member_id  int(11) not null,
medical_team_fl bool,
add_dt         datetime,
update_ts      timestamp,
primary key (mission_team_id)
);
insert into mission_team (mission_trip_id, team_member_id, medical_team_fl, add_dt)
values (2, 1, 0, current_timestamp); 
commit;
#
# Pastor Table
#
drop table if exists pastor;
create table if not exists pastor (
pastor_id int(11) not null,
first_name     varchar(30) not null,
last_name      varchar(50) not null,
church_name    varchar(100),
phone_number   varchar(30),
address1       varchar(100),
address2       varchar(100),
city           varchar(30),
denomination   varchar(50),
skype_team_flag bool, 
add_dt         datetime,
update_ts      timestamp,
primary key (pastor_id));

insert into pastor (pastor_id, first_name, last_name, church_name, 
                    phone_number, address1, city, 
                    denomination, skype_team_flag, add_dt)
values (1, 'Pastor', 'Layans', 'Luly Church', 
         NULL,     NULL,   'Luly', 
         'None',     true,      current_timestamp); 
insert into pastor (pastor_id, first_name, last_name, church_name, 
                    phone_number, address1, city, 
                    denomination, skype_team_flag, add_dt)
values (2, 'Pastor', 'Joussaint', 'Williamson Church', 
         NULL,     NULL,   'Williamson', 
         'None',      true,      current_timestamp); 
commit;
#
# patient Table
#
drop table if exists patient;
create table if not exists patient (
patient_id      int(11) not null auto_increment,
first_name      varchar(30) not null,
last_name       varchar(50),
birth_date      date,
age             smallint,
gender_id      int(11),
home_phone     varchar(30),
home_address1   varchar(100),
home_address2   varchar(100),
home_village    varchar(30),
believer_fl     bool,
pastor_id       int(11),
repeat_visit_fl bool,
medications     varchar(200),
allergies       varchar(200),
add_dt          datetime,
update_ts       timestamp,
primary key (patient_id));
#
# clinic Table
#
drop table if exists clinic;
create table if not exists clinic (
clinic_id       int(11) not null,
mission_trip_id int(11),
city           varchar(30) not null,
clinic_date    date,
location       varchar(200),       
add_dt         datetime,
update_dt      timestamp,
primary key (clinic_id));

insert into clinic (clinic_id, mission_trip_id, city, clinic_date, location, add_dt)
values (1, 4, 'Luly', '2015-03-16', 'Old School', current_timestamp); 
commit;

drop table if exists clinic_session;

create table if not exists clinic_session 
  (
    clinic_session_id  int(11) not null,
    mission_trip_id    int(11) not null,
    clinic_id          int(11) not null,
    patient_id         int(11) not null,
    repeat_patient_fl  bool,
    mteam_primary      int(11),
    mteam_secondary    int(11),
    dteam_primary      int(11) not null,
    dteam_secondary    int(11),
    prayer_request     varchar(500),
    diagnosis          varchar(500), 
    comments_fl        bool,     
    session_start_time datetime,
    session_end_time   datetime,
    add_dt             datetime,
    update_ts          timestamp,
    primary key (clinic_session_id)
   );

insert into clinic_session (clinic_session_id,                  
                            mission_trip_id, 
                            clinic_id,
                            patient_id, 
                            repeat_patient_fl,
                            mteam_primary,
							dteam_primary,
                            diagnosis,
							comments_fl,
                            session_start_time,
                            session_end_time,  
                            add_dt)
   values (1,         
           2,   
           1, 
           1,
           true,
           4,
           1,
           'malnourish',
           false,
           '2015-03-16 13:01:01',
		   '2015-03-16 16:01:01', 
           current_timestamp); 
commit;

##
## session_comment
##
drop table if exists session_comment;
create table if not exists session_comment
  (
    session_comment_id int(11) not null,
    clinic_session_id  int(11) not null,
    mteam_member_id       int(11),
    dteam_member_id       int(11),
	patient_id         int(11) not null,
    medical_flag       bool,
    comment_text       varchar(200),
    display_order      int(3) not null,
    add_dt             datetime,
    update_ts          timestamp,
    primary key (session_comment_id)
   );
commit;

drop table if exists patient_source;
create table if not exists patient_source
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
#
# Gender Dimension Table
#

drop table if exists gender;
create table if not exists gender
(gender_id      int(11) not null,
 gender_code    varchar(10),
 gender_display varchar(10), 
 gender_desc    varchar(50),
 display_order  int(3)   not null,
 add_dt         datetime not null,
 update_ts      timestamp,
 primary key (gender_id)
 );
 insert into gender (gender_id, 
                     gender_code, 
                     gender_display, 
                     gender_desc,
                     display_order,
                     add_dt) 
values
 (1, 'U', 'Unknown', 'Unknown Gender', 1, current_timestamp);
 insert into gender (gender_id, 
                     gender_code, 
                     gender_display, 
                     gender_desc,
                     display_order,
                     add_dt) 
values
 (2, 'Male', 'Male', 'Male Gender', 2, current_timestamp);
insert into gender (gender_id, 
                     gender_code, 
                     gender_display, 
                     gender_desc,
                     display_order,
                     add_dt) 
values
 (3, 'Female', 'Female', 'Female Gender', 3, current_timestamp);
commit;
#
# Referential constraints
#
## RI for clinic
alter table clinic add foreign key
clinic_idx_1 (mission_trip_id)
references mission_trip(mission_trip_id) ;
##RI for Patient
alter table patient add foreign key
patient_idx_1 (gender_id)
references gender(gender_id) ;
## RI for clinic_session
alter table clinic_session add foreign key
clinic_session_idx_1 (mission_trip_id)
references mission_trip(mission_trip_id) ;
#
alter table clinic_session add foreign key
clinic_session_idx_2 (clinic_id)
references clinic(clinic_id) ;
## RI for mission_team
alter table mission_team add foreign key
mission_team_idx_1 (mission_trip_id)
references mission_trip(mission_trip_id) ;
alter table mission_team add foreign key
mission_team_idx_2 (team_member_id)
references team_member(team_member_id) ;
# RI for comments
alter table session_comment add foreign key
session_comment_idx_1 (clinic_session_id)
references clinic_session(clinic_session_id) ;
alter table session_comment add foreign key
session_comment_idx_2 (mteam_member_id)
references mission_team(team_member_id) ;
alter table session_comment add foreign key
session_comment_idx_3 (dteam_member_id)
references mission_team(team_member_id) ;
alter table session_comment add foreign key
session_comment_idx_4 (patient_id)
references patient(patient_id) ;


SET foreign_key_checks = 1; /*turn on constraint checking */


