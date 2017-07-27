create sequence seq_menu_idx start with 1 increment by 1
drop sequence seq_menu_idx

create table main_menu (
	m_idx			int,			-- index
	m_name			varchar2(200)	-- 메뉴 이름 
)

drop table main_menu

alter table main_menu add constraint pk_main_menu_idx
	primary key(m_idx)

-- 메인 메뉴 data
insert into main_menu values( seq_menu_idx.nextVal, '업무연락');
insert into main_menu values( seq_menu_idx.nextVal, '전자결재');
insert into main_menu values( seq_menu_idx.nextVal, '자료실');
insert into main_menu values( seq_menu_idx.nextVal, '쪽지함');
insert into main_menu values( seq_menu_idx.nextVal, '시스템관리');

select * from main_menu order by m_idx

commit

select * from main_menu where m_idx < (select count(*) from main_menu) order by m_idx

select count(*) from main_menu;