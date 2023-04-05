create table board (
	idx int not null auto_increment, 
	title varchar(100) not null,			
	content text not null,					
	writeDate datetime default now(),			
	readNum	int default 0,	/*조회수*/					
	good int default 0,		/*추천수*/						
	mid varchar(20) not null,					
	name varchar(20) not null,					
	primary key(idx)
);

create table boardReply (
	idx int not null auto_increment,  
	boardIdx int not null,            
	name varchar(20) not null,         
	wDate datetime default now(),	   
	content text not null,
	good int default 0,
	primary key(idx),                  /*주키(기본키)는 idx*/
	foreign key(boardIdx) references board(idx) on delete cascade on update cascade
);