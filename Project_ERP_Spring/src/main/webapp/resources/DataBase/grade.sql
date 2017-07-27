create sequence seq_grade_idx start with 1 increment by 1
drop sequence seq_grade_idx

create table grade (
	g_idx			int,				-- grade idx
	g_level			int,				-- ��å ���
	g_position		varchar2(100)		-- ��å �̸�
)

drop table grade

-- �⺻Ű ����
alter table grade add constraint pk_grade_g_idx
	primary key(g_idx)
	
-- default data : ���,�븮,����,����,����,�̻�,��ǥ
insert into grade values(seq_grade_idx.nextVal,1,'���');
insert into grade values(seq_grade_idx.nextVal,2,'�븮');
insert into grade values(seq_grade_idx.nextVal,3,'����');
insert into grade values(seq_grade_idx.nextVal,4,'����');
insert into grade values(seq_grade_idx.nextVal,5,'����');
insert into grade values(seq_grade_idx.nextVal,6,'�̻�');
insert into grade values(seq_grade_idx.nextVal,7,'��ǥ');

delete from grade

select * from grade order by g_idx desc

commit

