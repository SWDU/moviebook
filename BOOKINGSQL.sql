create database if not exists movie_database;
use movie_database;

drop table if exists BOOKING;
create table BOOKING(

	B_NUM int NOT NULL auto_increment,	# 예매번호 (PK)
	U_NUM int,							# 회원번호
	M_NUM int,							# 상영영화정보
	SEAT int,							# 좌석
	primary key (B_NUM)
);