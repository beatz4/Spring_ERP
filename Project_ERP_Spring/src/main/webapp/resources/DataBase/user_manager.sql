-- 시퀀스 생성
create sequence seq_user_idx START WITH 1 INCREMENT BY 1
drop sequence seq_user_idx

-- 시퀀스 초기화 : 증가값과 nextVal를 이용해 0으로 맞추어준다
select seq_user_idx.nextval from dual
ALTER SEQUENCE seq_user_idx INCREMENT BY 1

-- 테이블 생성
create table user_manager (
	idx			int,					-- 일련 번호 (사번)
	name		varchar2(100),			-- 이름
	regnumber	varchar2(100),			-- 주민번호 (-포함)
	id			varchar2(100),			-- 아이디
	password	varchar2(100),			-- 비밀번호
	address		varchar2(500),			-- 주소
	email		varchar2(100),			-- 이메일
	phone		varchar2(200),			-- 전화번호
	regdate		date,					-- 가입 일자
	g_idx		int,					-- 외래키 (grade)
	c_idx		int						-- 외래키 (company : 소속 조직(팀))
)

update user_manager set 
 		    name =  '홍길동',
 			regnumber = '990101-1122112',
 			password = '1111',
 			address = '대한민국',
 			email = 'admin@erp.com',
 			phone = '010-000-1111',
 			g_idx = 4,
 			c_idx = 1
 			where idx= 4


-- 테이블 삭제
drop table user_manager

-- 기본키 생성
alter table user_manager add constraint pk_user_manager_idx primary key(idx) 

-- sample data
insert into user_manager values( seq_user_idx.nextVal,
									'관리자',
									'990101-1122112',
									'admin',
									'admin',
									'서울특별시강남구',
									'admin@erp.com',
									'010-000-1111',
									sysdate,
									1,
									1);

insert into user_manager values( seq_user_idx.nextVal,
									'테스트',
									'990101-1122112',
									'test',
									'test',
									'대한민국',
									'admin@erp.com',
									'010-000-1111',
									sysdate,
									4,
									1);
									
insert into user_manager values( seq_user_idx.nextVal,
									'유저1',
									'990101-1122112',
									'user1',
									'1111',
									'대한민국',
									'admin@erp.com',
									'010-000-1111',
									sysdate,
									4,
									1)
									
									
-- 모든 데이터 삭제
delete from user_manager;
									
-- 데이터 조회
select * from user_manager order by idx

-- commit
commit

-- view 조회
select * from user_view order by idx desc

-- view 삭제
drop view user_view

-- 외래키 view
create or replace view user_view
as
	select
	   u.*,
	   g.g_level, g.g_position, c.name c_name
   from user_manager u left outer join company c on c.idx = u.c_idx
		left outer join grade g on u.g_idx = g.g_idx