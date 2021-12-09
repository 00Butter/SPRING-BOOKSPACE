
drop table m_pub purge;
drop sequence m_pub_seq;

create table m_pub(
	num 		number(10) primary key,
	id		varchar2(100) not null,
	pw 		varchar2(100) not null,
	name 		varchar2(100) not null,
	license 	number(10) not null,
	employee 	varchar2(100) not null,
	phone 	varchar2(100) not null,
	address	varchar2(100) not null,
	bank 		varchar2(100) not null,
	banknum 	number(10) not null
	del			varchar2(20)
)

create sequence m_pub_seq increment by 1 start with 1 nocycle nocache;

insert into m_pub values(m_pub_seq.nextval,'goldstar','1234567p@','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'rkskek','rkskek1111','(주)가나다출판사','3423123232','가나다','010-2222-2222','서욷시강남구논현동 333동','하나','122198002',null);
insert into m_pub values(m_pub_seq.nextval,'rrrrrr','123123','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'rrrrrr','123123','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'goldstar','1234567p@','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'goldstar','1234567p@','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'goldstar','1234567p@','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'goldstar','1234567p@','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_login values('goldstar','1234567p@','pub')





insert into m_login values('goldstar','1234567p@','pub');
insert into m_login values('rkskek','rkskek1111','pub');

select * from m_pub

create table m_msgboard(
	num number(9) primary key,
	
);

//타입 pubqna, adminqna, pubmsg

create table m_board(
	num 		number(9) primary key,
	id 			varchar2(100) not null,
	boardtype 	varchar2(100) not null,
	title 		varchar2(100) not null,
	content		varchar2(100) not null,
	regdate 	varchar2(100) not null,
	receive 	varchar2(100) not null,
	groupnum	number(8),
	replynum	number(5),
	count		number(5),
	bookname	varchar2(100)
);

create sequence m_board_seq increment by 1 start with 1 nocycle nocache;

insert into m_board values(m_board_seq.nextval,'rkskek','pubmsg','환영합니다.','가입을 축하합니다!',to_char(sysdate,'YYYY-MM-DD'),'admin',0,0,0,null)

drop table m_bookreg purge;

create table m_bookreg(
	num			number(9) primary key,
	bookName	varchar2(100) not null,	
	maintype     varchar2(100) not null,
	subtype     varchar2(100) not null,
	writer		varchar2(100) not null,
	price		number(8) not null,
	img			varchar2(100) not null,
	publisher	varchar2(100) not null,
	state		varchar2(100) not null,
	conlist 	varchar2(100) not null,
	story		varchar2(1000) not null
);
	create sequence m_bookreg_seq increment by 1 start with 1 nocycle nocache;