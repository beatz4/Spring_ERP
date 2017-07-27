-- 조직 구성 sql

-- 시퀀스 생성
create sequence seq_company_idx START WITH 1 INCREMENT BY 1
drop sequence seq_company_idx

-- 시퀀스 초기화 : 증가값과 nextVal를 이용해 0으로 맞추어준다
select seq_company_idx.nextval from dual
ALTER SEQUENCE seq_company_idx INCREMENT BY 1

-- 테이블 생성
create table company (
	idx				int,					-- 일련 번호
	name			varchar2(100),			-- 조직(팀) 이름
	parent_idx		int,					-- 상부 조직의 인덱스 ( 4-1 이면 4번이 된다 ) tree구조를 위함
	description		varchar2(500)			-- 설명
);

-- 테이블 삭제
drop table company

-- 기본키 생성
alter table company add constraint pk_company_idx primary key(idx) 

-- sample data
insert into company values( seq_company_idx.nextVal,
								'대표',
								null,					-- 대표자의 상부 조직은 없으므로 null을 준다.
								'대표자명단');

									
-- 모든 데이터 삭제
delete from company;
									
-- 데이터 조회
select * from company order by idx

-- commit
commit
