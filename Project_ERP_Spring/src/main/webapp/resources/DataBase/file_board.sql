-- 시퀸스 생성
create sequence seq_file_board_idx;

-- 시퀸스 삭제
drop sequence seq_file_board_idx;

-- 테이블 생성
create table file_board(
	idx			int,				--일련번호
	title		varchar2(200),		--제목
	write_id	varchar2(100),		--작성자
	write_date	date,				--작성일자
	readhit		int,				--조회수
	ip			varchar2(100)		--작성자IP
);

-- 테이블 삭제
drop table file_board;

-- 기본키 생성
alter table file_board add constraint pk_file_board_idx primary key(idx);

-- sample data
insert into file_board values( seq_file_board_idx.nextVal,
							   '소프트웨어 자료',
							   'test',
							   '2017/08/29',
							   0,
							   '192.168.0.16'
								);
								
-- 모든 데이터 삭제
delete from file_board;

-- file_board테이블 조회
select * from file_board order by desc;

-- commit
commit
								
								
								
								
								
								
								
								