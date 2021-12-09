login.sql

	create table m_login(
	id varchar2(50) not null,
	pw varchar2(50) not null,
	logType varchar2(50) not null
	);
	
	drop table m_login purge;
  	drop sequence m_login_seq;

  	s	select regdate, publisher, sum(price) as price from m_account where regdate > to_char(sysdate-365,'YYYY-MM-DD') group by regdate,publisher order by regdate
select count(booktype) from m_account where booktype='소설';
  	=======================================================================================
member.sql

CREATE TABLE  "M_MEMBER" 
   (	"NUM" NUMBER(7,0), 
	"ID" VARCHAR2(50) NOT NULL ENABLE, 
	"PW" VARCHAR2(50) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"BIRTH" VARCHAR2(50) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(50) NOT NULL ENABLE, 
	"PHONE" VARCHAR2(20) NOT NULL ENABLE, 
	"JOINDATE" VARCHAR2(50) NOT NULL ENABLE, 
	"GRADE" VARCHAR2(50), 
	"COMPLAIN" NUMBER(7,0), 
	"CASH" NUMBER(35,0), 
	 PRIMARY KEY ("NUM") ENABLE
   ) ;


SELECT * FROM M_MEMBER ORDER BY NUM
	create sequence m_member_seq increment by 1 start with 1 nocycle nocache;
	
	insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'test', 'test', 'test', '001205', '여', '01038600249', '16.12.05');
    
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'tsolsol', 'eunsol93', '탁은솔', '940419', '여', '01041918842', '16.03.07');
    
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'jeahwang', 'jeahwang', '장재황', '930307', '남', '01038600249', '16.04.19');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'sick', '1234', '장대식', '831125', '남', '01046876495', '16.11.25');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'kye', '1234', '김영은', '920624', '여', '01012345678', '16.06.24');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'jys', '1234', '정용설', '921218', '여', '01087654321', '16.12.18');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'tyr', '1234', '서예린', '950401', '여', '01014785236', '16.04.01');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'dool', '234', '둘리', '640530', '여', '01096325874', '16.05.30');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'kim', '234', '도우너킴', '600208', '여', '01032146598', '16.02.08');
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate)
   values(m_member_seq.nextval, 'chi', '234', '또치', '520816', '여', '01075321598', '16.08.16');
	
	
	
	

	 drop table m_member purge;
    	 drop sequence m_member_seq;
=======================================================================================
myBook.sql

	create table m_mybook(
	num number(7) primary key,
	id varchar2(50) not null,
	bookName varchar2(50) not null,
	imgName varchar2(50) not null,
	pageNum number(20) not null,
	endDate number(30) not null
	);
	
	create sequence m_mybook_seq increment by 1 start with 1 nocycle nocache;
	
	drop table m_mybook purge;
   	drop sequence m_mybook_seq;

   	-- 결제내역(구매내역)
create table m_payment(
	num 		number(8)	primary key,
	id			varchar2(100)	not null,
	img			varchar2(100)	not null,
	bookname	varchar2(100)	not null,
	price		number(8)		not null,
	publisher	varchar2(100)	not null,
	buyDate		varchar2(100)	not null
);

	create sequence m_pay_seq increment by 1 start with 1 nocycle nocache;

-- 캐쉬충전
create table m_cash(
	num 		number(8)	primary key,
	id			varchar2(100)	not null,
	cashType	varchar2(100)	not null,
	price		number(8)		not null,
	cashDate	varchar2(100)	not null
);
create sequence m_cash_seq increment by 1 start with 1 nocycle nocache;

-- 리뷰
create table m_review(
	num 		number(8)	primary key,
	id			varchar2(100)	not null,
	img			varchar2(100)	not null,
	bookname	varchar2(100)	not null,
	review		varchar2(200)	not null,
	star		number(2)		not null,
	recommend	number(6)		not null,
	complain    number(6)		not null,
	reviewDate	varchar2(100)	not null
);
create sequence m_review_seq increment by 1 start with 1 nocycle nocache;
-- 장바구니
create table m_cart(
	num 		number(8)	primary key,
	id			varchar2(100)	not null,
	img			varchar2(100)	not null,
	bookname	varchar2(100)	not null,
	publisher	varchar2(100)	not null,
	price		number(8)		not null
);
create sequence m_cart_seq increment by 1 start with 1 nocycle nocache;


create table m_board(
	num 		number(9) primary key,
	id 			varchar2(100) not null,
	boardtype 	varchar2(100) not null,
	title 		varchar2(100) not null,
	content		varchar2(100) not null,
	regdate 	date not null,
	receive 	varchar2(100) not null,
	groupnum	number(8) ,
	replynum	number(5) ,
	count		number(5),
	bookname	varchar2(100)
);

create sequencem_board_seq increment by 1 start with 1 nocycle nocache;

