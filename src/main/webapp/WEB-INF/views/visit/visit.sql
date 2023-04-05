create table visit (
	idx int not null auto_increment, 
	content text not null,					
	writeDate datetime default now(),			
	mid varchar(20) not null,					
	name varchar(20) not null,		
	level char(2) default 1,
	primary key(idx)
);