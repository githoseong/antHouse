show databases;
use practice;
create table ask (
	idx int not null auto_increment,
	primary key(idx),
	mid varchar(30) not null,
	name varchar(30) not null,
	title varchar(100) not null,
	content text not null,
	askDate datetime default now(),	
	answer char(2) default '0',
	part char(5),             -- 문의, 신고
	del char(2) default '0'
);

create table askAnswer (
	idx int not null auto_increment,
	primary key(idx),
	answerIdx int not null,
	mid varchar(30) not null,
	content text not null,
	answerDate datetime default now(),	
	foreign key(answerNo) references ask(idx) on delete cascade on update cascade
);