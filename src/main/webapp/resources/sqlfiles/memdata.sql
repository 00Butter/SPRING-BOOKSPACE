=========================================================================================================================   
   

-- 새로운 mem
    insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'testtest', 'testtest8', '테스트', '001205', 'woman', '010-3860-0249', '16/11/20', '동네책방', 0);
    
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'rlaenffl', 'rlaenffl1', '김둘리', '640503', 'man', '010-9578-1225', '16/05/03', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'ehdnsjzla', 'ehdnsjzla1', '도우너킴', '551211', 'woman', '010-1122-3344', '16/12/11', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'akdlzhf', 'akdlzhf1', '마이콜', '950506', 'man', '010-6548-2222', '16/05/06', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'wkdeotlr', 'wkdeotlr1', '장대식', '000716', 'man', '010-9514-7562', '16/07/16', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'wjddydtjf', 'wjddydtjf1', '정용설', '450725', 'man', '010-5555-9999', '16/07/25', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'rladuddms', 'rladuddms1', '김영은', '921123', 'woman', '010-5465-7895', '16/11/23', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'tjdPfls', 'tjdPfls1', '서예린', '390324', 'woman', '010-9999-5578', '16/03/24', '동네책방', 0);
   
   insert into M_MEMBER(num, id, pw, name, birth, gender, phone, joindate, grade, cash)
   values(m_member_seq.nextval, 'xkrdmsthf', 'xkrdmsthf1', '탁은솔', '930307', 'woman', '010-3860-0249', '16/03/07', '동네책방', 0);
   update m_member set complain =0 where complain is null
   -- 여기까지
   
   -- 이건 새로운 login
   insert into m_login values('system','system','admin')

   insert into m_login(id, pw, logType) values('testtest', 'testtest8', 'mem');
   insert into m_login(id, pw, logType) values('rlaenffl', 'rlaenffl1', 'mem');
   insert into m_login(id, pw, logType) values('ehdnsjzla', 'ehdnsjzla1', 'mem');
   insert into m_login(id, pw, logType) values('akdlzhf', 'akdlzhf1', 'mem');
   insert into m_login(id, pw, logType) values('wkdeotlr', 'wkdeotlr1', 'mem');
   insert into m_login(id, pw, logType) values('wjddydtjf', 'wjddydtjf1', 'mem');
   insert into m_login(id, pw, logType) values('rladuddms', 'rladuddms1', 'mem');
   insert into m_login(id, pw, logType) values('tjdPfls', 'tjdPfls1', 'mem');
   insert into m_login(id, pw, logType) values('xkrdmsthf', 'xkrdmsthf1', 'mem');
   -- 여기까지
=========================================================================================================================
-- 구매내역
--  > insert into m_payment values(m_payment_seq.nextval, '아이디', '이미지', '책이름', 가격, '출판사', 구매날짜);
insert into m_payment values(m_pay_seq.nextval, 'tjdPfls', '교황의 역사.png', '교황의 역사', 19800, '(주)금성출판사', sysdate);
insert into m_payment values(m_pay_seq.nextval, 'tjdPfls', '마호메트.png', '마호메트', 7700, '(주)금성출판사', sysdate);

-- 캐쉬충전내역
--  > insert into m_cash values(m_cash_seq.nextval, '아이디', '충전 선택', 충전금액, 충전날짜);
insert into m_cash values(m_cash_seq.nextval, 'tjdPfls', '핸드폰 결제', 10000, sysdate);
insert into m_cash values(m_cash_seq.nextval, 'tjdPfls', '카드 결제', 5000, sysdate);


-- 리뷰
--  > insert into m_review values(m_review_seq.nextval, '아이디', '이미지', '책이름', '리뷰', 별점, 추천수, 신고수, 작성날짜);
insert into m_review values(m_review_seq.nextval, 'tjdPfls', '교황의 역사.png', '교황의 역사', '조금 지루하기는 하지만 그런데로 볼만해요. 근데 가격에 비해 크게 얻는건 없는것같네요.', '3', '0', '0', to_char(sysdate,'YYYY-MM-DD'));
insert into m_review values(m_review_seq.nextval, 'tjdPfls', '마호메트.png' , '마호메트', '-', '0', '0', '0', '-');
-- 장바구니
--  > insert into m_cart values(m_cart_seq.nextval, '아이디', '이미지', '책이름', '출판사', 가격);
insert into m_cart values(m_cart_seq.nextval, 'tjdPfls', '절대쌍교.png', '절대쌍교', '(주)금성출판사', 7700);
insert into m_cart values(m_cart_seq.nextval, 'tjdPfls', '난중일기.png', '난중일기', '(주)금성출판사', 5000);
insert into m_cart values(m_cart_seq.nextval, 'tjdPfls', '손자병법.png', '손자병법', '(주)금성출판사', 7700);
insert into m_cart values(m_cart_seq.nextval, 'tjdPfls', '레테의 연가.png', '레테의 연가', '(주)금성출판사', 9000);
=========================================================================================================
--> 출판사


insert into m_pub values(m_pub_seq.nextval,'goldstar','1234567p@','(주)금성출판사','1231231231','푸르넷','010-9699-1000','서울시마포구만리쟤옛길 23','국민','23232323',null);
insert into m_pub values(m_pub_seq.nextval,'rkskek','rkskek1111','(주)가나다출판사','3423123232','가나다','010-2222-2222','경기도 고양시 덕양구 북한동','하나','122198002',null);
insert into m_pub values(m_pub_seq.nextval,'readybook','23231qqq','(주)리디북스','4545223421','정용설','010-9699-1000','경기도 성남시 분당구 판교로256번길 7','국민','768745642',null);
insert into m_pub values(m_pub_seq.nextval,'ppuss','0000222ww','(주)올림푸스','5768634235','강하나','010-8988-7676','서서울특별시 구로구 디지털로 300 지밸리비즈플라자 20층 ','농협','90076734',null);
insert into m_pub values(m_pub_seq.nextval,'notenote','nn3332mm','(주)문학수첩','1237834542','장대식','010-1112-4343','서울특별시 금천구 가산디지털1로 131','신한','11234567',null);
insert into m_pub values(m_pub_seq.nextval,'paradise','1212pppp','(주)낙원출판사','1167733452','서예린','010-6656-2321','경기도 성남시 분당구 대왕판교로644번길 12 엔씨소프트','신한','9900767345',null);
insert into m_pub values(m_pub_seq.nextval,'bookandbook','book3333','(주)북앤북스','9787544456','탁은솔','010-6788-1233','경기도 성남시 분당구 판교로228번길 15 판교세븐벤처밸리1','하나','345111400',null);
 insert into m_login(id, pw, logType) values('goldstar', '1234567p@', 'pub');
 insert into m_login(id, pw, logType) values('rkskek', 'rkskek1111', 'pub');
 insert into m_login(id, pw, logType) values('readybook', '23231qqq', 'pub');
 insert into m_login(id, pw, logType) values('ppuss', '0000222ww', 'pub');
 insert into m_login(id, pw, logType) values('notenote', 'nn3332mm', 'pub');
 insert into m_login(id, pw, logType) values('paradise', '1212pppp', 'pub');
 insert into m_login(id, pw, logType) values('bookandbook', 'book3333', 'pub');  
 
-->통계데이터 









	select * from m_board  order by groupnum desc, replynum asc



