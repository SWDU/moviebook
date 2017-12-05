create database if not exists movie_database;
use movie_database;

drop table if exists MOVIE_SCHEDULE;
create table MOVIE_SCHEDULE(

	M_NUM int NOT NULL auto_increment,	#상영영화번호 (PK)
	M_NAME_KOR varchar(50),				#영화제목(한글)
	THEATER int,						#상영관
	M_TIME int,							#상영시간
	M_DATE varchar(50),					#상영날짜
	LEFT_SEAT int,						#남은 좌석수
	primary key (M_NUM)
);

insert into MOVIE_SCHEDULE values(0,'토르',1,1240,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'토르',1,1340,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'토르',1,1440,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'토르',1,1240,'2017.11.30',156);
insert into MOVIE_SCHEDULE values(0,'토르',2,1240,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'범죄도시',3,1240,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'범죄도시',3,1340,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'범죄도시',3,1440,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'범죄도시',3,1240,'2017.11.30',156);
insert into MOVIE_SCHEDULE values(0,'범죄도시',4,1240,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'저스티스리그',5,1240,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'저스티스리그',5,1340,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'저스티스리그',5,1440,'2017.11.29',156);
insert into MOVIE_SCHEDULE values(0,'저스티스리그',5,1240,'2017.11.30',156);
insert into MOVIE_SCHEDULE values(0,'저스티스리그',6,1240,'2017.11.29',156);

select * from MOVIE_SCHEDULE;