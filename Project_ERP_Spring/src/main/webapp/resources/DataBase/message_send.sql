-- 시퀸스 생성
create sequence seq_message_send_idx START WITH 1 INCREMENT BY 1
-- 시퀸스 삭제
drop sequence seq_message_send_idx

-- 시퀸스 초기화 : 증가값과 nextVal를 이용해 0으로 맞추어준다
select seq_message_send_idx.nextval from dual
alter sequence seq_message_send_idx increment by 1

-- 테이블 생성
create table message_send(
	idx			int,				--일련번호
	msg_idx		int,				--외래키
	send_id		varchar2(100),		--보낸사람
	recv_id		varchar2(100),		--받는사람
	title		varchar2(200),		--제목
	content		varchar2(3000),		--내용
	send_date	varchar2(100),		--보낸날짜
	recv_date	varchar2(100),		--받은날짜
	send_state	varchar2(10),		--읽었는지 여부
	msg_box		varchar2(10),		--보관함 구분
	ip			varchar2(100)		--ip
)
-- 테이블 삭제
drop table message_send

-- 기본키 생성
alter table message_send add constraint pk_message_send_idx primary key(idx)

--외래키
alter table message_send add constraint fk_message_send_idx foreign key(msg_idx) references user_manager(idx) on delete cascade

-- sample data
insert into message_send values( seq_message_send_idx.nextVal,
							2,
							'admin',
							'test',
							'안녕하신가',
							'test 제대로안하나',
							'보낸날짜',
							'받은날짜',
							'미수신',
							'nobox',
							'127.0.0.4');
							
insert into message_send values( seq_message_send_idx.nextVal,
							3,
							'test',
							'admin',
							'안녕하신가',
							'admin 제대로안하나',
							'보낸날짜',
							'받은날짜',
							'미수신',
							'nobox',
							'127.0.0.3');

-- 모든 데이터 삭제
delete from message_send;
							
-- message테이블 조회
select * from message_send

-- commit
commit

