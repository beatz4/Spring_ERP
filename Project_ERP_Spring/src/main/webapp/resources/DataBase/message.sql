-- 시퀸스 생성
create sequence seq_message_idx
-- 시퀸스 삭제
drop sequence seq_message_idx

-- 테이블 생성
create table message(
	idx			int,					--일련번호
	msg_idx		int,					--외래키(회원)
	send_id		varchar2(100),			--보낸사람
	recv_id		varchar2(100),			--받는사람
	title		varchar2(200),			--제목
	content		varchar2(3000),			--내용
	send_date	varchar2(100),			--보낸날짜
	recv_date	varchar2(100),			--받은날짜
	send_state	varchar2(10),			--읽었는지 여부
	msg_box		varchar2(10),			--보관함 구분
	ip			varchar2(100)			--ip
)
-- 테이블 삭제
drop table message

-- 기본키 생성
alter table message add constraint pk_message_idx primary key(idx)

--외래키 설정
-- user가 삭제 되면 message도 자동으로 같이 삭제해주기 위한 외래키
alter table message add constraint fk_message_idx foreign key(msg_idx) references user_manager(idx) on delete cascade

-- sample data
insert into message values( seq_message_idx.nextVal,
							2,
							'admin',
							'test',
							'안녕하신가',
							'test 제대로안하나',
							'보낸날짜',
							'받은날짜',
							'미수신',
							'box',
							'127.0.0.4');
							
insert into message values( seq_message_idx.nextVal,
							3,
							'test',
							'admin',
							'안녕하신가',
							'admin 제대로안하나',
							'보낸날짜',
							'받은날짜',
							'미수신',
							'box',
							'127.0.0.3');

-- 모든 데이터 삭제
delete from message;
							
-- message테이블 조회
select * from message where recv_id='test' and msg_box='box' order by idx desc

-- commit
commit

-- Paging처리하기 위한 SQL
select *
from
	(
		select
			rank() over(order by idx desc) rank,
			m.*
		from
			(select * from message where recv_id='test' and msg_box='nobox')m
	)	
	where rank between 1 and 10

--전체레코드수
select nvl(count(*),0) from message where recv_id='test' and msg_box='nobox'

-- poplist 페이징
select *
from
	(
		select
			rank() over(order by idx ) rank,
			p.*
		from
			(select * from user_view)p
	)	
	where rank between 1 and 10

--전체레코드수
select nvl(count(*),0) from user_view























