create table signup (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	pwd varchar(200) not null,
	name varchar(20) not null,
	mail varchar(30) not null,
	tel varchar(20) not null,
	level char(2) default 1,
	del char(2) default 0,
	todayCnt int default 0,
	totalCnt int default 0,
	startDate datetime default now(),		
  	lastDate datetime default now(),
  	photo varchar(100) default '사진없음'
);