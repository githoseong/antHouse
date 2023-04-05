create table calendar (
	idx int not null auto_increment, 
	primary key(idx),
	mid varchar(20) not null,
	name varchar(20) not null,
	wDate datetime default now(),	
	title varchar(20) not null,
	content text,
	myDate varchar(50) not null
);

show tables;

