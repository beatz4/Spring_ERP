create sequence seq_menu_idx start with 1 increment by 1
drop sequence seq_menu_idx

create table main_menu (
	m_idx			int,			-- index
	m_name			varchar2(200)	-- �޴� �̸� 
)

drop table main_menu

alter table main_menu add constraint pk_main_menu_idx
	primary key(m_idx)

-- ���� �޴� data
insert into main_menu values( seq_menu_idx.nextVal, '��������');
insert into main_menu values( seq_menu_idx.nextVal, '���ڰ���');
insert into main_menu values( seq_menu_idx.nextVal, '�ڷ��');
insert into main_menu values( seq_menu_idx.nextVal, '������');
insert into main_menu values( seq_menu_idx.nextVal, '�ý��۰���');

select * from main_menu order by m_idx

commit

select * from main_menu where m_idx < (select count(*) from main_menu) order by m_idx

select count(*) from main_menu;