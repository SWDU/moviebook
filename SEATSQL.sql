create database if not exists movie_database;
use movie_database;

drop table if exists SEATS;
create table SEATS(

	M_NUM int,					# 스케쥴
	THEATER int,				# 상영관	(PK)
	SEAT int,					# 좌석 번호 (PK)
	FLAG int,					# 예매유무
	primary key (M_NUM,SEAT)

);