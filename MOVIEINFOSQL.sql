create database if not exists movie_database;
use movie_database;

drop table if exists MOVIE_INFO;
create table MOVIE_INFO(

	M_NAME_KOR varchar(50),		#영화제목(한글) (PK)
	M_NAME_ENG varchar(50),		#영화제목(영어)
	M_RUNNINGTIME int,			#러닝타임
	M_DIRECTOR varchar(50),		#감독
	M_AGE int,					#관람가
	M_GENRE varchar(50),		#장르
	M_ACTOR1 varchar(50),		#배우1
	M_ACTOR2 varchar(50),		#배우2
	M_POSTER varchar(50),		#포스터 파일명
	primary key (M_NAME_KOR)
);

insert into MOVIE_INFO values('토르','thor',120,'망치맨',12,'판타지','상욱이횽','예솔','thor.jpg');
insert into MOVIE_INFO values('범죄도시','crime city',130,'돌린마리살인마',19,'스릴러','가나다','마바사','crime_city.jpg');
insert into MOVIE_INFO values('저스티스리그','justiceLeague',200,'마블',12,'액션','슈퍼맨','배트맨','justiceLeague.jpg');

select * from MOVIE_INFO;