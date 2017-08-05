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
	parent_idx		int not null,					-- 상부 조직의 인덱스 ( 4-1 이면 4번이 된다 ) tree구조를 위함
	description		varchar2(500)			-- 설명
);

-- 테이블 삭제
drop table company

-- 기본키 생성
alter table company add constraint pk_company_idx primary key(idx) 

-- sample data

-- 1
insert into company values( seq_company_idx.nextVal,
								'대표',
								0,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'대표자명단');
-- 2							
insert into company values( seq_company_idx.nextVal,
								'부대표',
								1,					-- 대표자 index : 1
								'부대표명단');

-- 3
insert into company values( seq_company_idx.nextVal,
								'영업부',
								0,					-- 대표 index(1) + 부대표 index(2) : 12
								'영업부서');
								
-- 4
insert into company values( seq_company_idx.nextVal,
								'개발부',
								0,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'개발부서');
								
-- 5
insert into company values( seq_company_idx.nextVal,
								'경영지원부',
								0,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'경영지원부서');

-- 0:대표, 3:영업부, 4:개발부, 5:경영지원부
insert into company values( seq_company_idx.nextVal,
								'영업부서1',
								3,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'영업1팀');
insert into company values( seq_company_idx.nextVal,
								'영업부서2',
								3,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'영업2팀');   
								
insert into company values( seq_company_idx.nextVal,
								'개발부1',
								4,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'개발1팀');
insert into company values( seq_company_idx.nextVal,
								'개발부2',
								4,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'개발2팀');
								
insert into company values( seq_company_idx.nextVal,
								'경영지원부1',
								5,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'경영1팀');
insert into company values( seq_company_idx.nextVal,
								'경영지원부2',
								5,					-- 대표자의 상부 조직은 없으므로 0을 준다.
								'경영2팀');



									
-- 모든 데이터 삭제
delete from company;
									
-- 데이터 조회
select * from company order by idx

-- commit
commit
