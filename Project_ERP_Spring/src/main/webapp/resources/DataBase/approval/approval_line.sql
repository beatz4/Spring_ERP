create sequence seq_a_line_idx 

create table a_line (
						a_line_idx 			int,           --���缱idx
						idx          		int,           --���缱 ���� �����ȣ
						idx_one				int,           --���� ������
						idx_two             int,           --�ι�° ������
						idx_three           int,           --����° ������
						idx_four           	int,           --����������
                        a_line_name 		varchar2(100), --���缱��
                        a_line_regdate      date           --��������
)

select * from A_LINE
select * from 

--app_line_view ����
create or replace view app_line_view_1
as
select a.idx, a.a_line_idx, a.idx_one, u.name user_name_one, u.g_level g_level_one, u.g_position g_position_one, u.c_name c_name_one    from USER_VIEW u inner join a_line a on u.idx = a.idx_one;
create or replace view app_line_view_2
as
select a.a_line_idx a_line_idx_two, a.idx_two, u.name user_name_two, u.g_level g_level_two, u.g_position g_position_two, u.c_name c_name_two    from USER_VIEW u inner join a_line a on u.idx = a.idx_two;
create or replace view app_line_view_3
as
select a.a_line_idx a_line_idx_three, a.idx_three, u.name user_name_three, u.g_level g_level_three, u.g_position g_position_three, u.c_name c_name_three  from USER_VIEW u inner join a_line a on u.idx = a.idx_three;
create or replace view app_line_view_4
as
select a.a_line_idx a_line_idx_four, a.idx_four, u.name user_name_four, u.g_level g_level_four, u.g_position g_position_four, u.c_name c_name_four from USER_VIEW u inner join a_line a on u.idx = a.idx_four;

create or replace view app_line_view
as
select * from
(select * from 
(select * from app_line_view_1 a left outer join app_line_view_2 b on a.a_line_idx = b.a_line_idx_two) c 
left outer join app_line_view_3 d on c.a_line_idx = d.a_line_idx_three) e 
left outer join app_line_view_4 f on e.a_line_idx = f.a_line_idx_four order by e.a_line_idx;

select * from app_line_view where a_line_idx=3

drop view app_line_view;
drop view app_line_view_1;
drop view app_line_view_2;
drop view app_line_view_3;
drop view app_line_view_4;

commit
--����Ű ����
alter table a_line add constraint pk_a_line_idx primary key (a_line_idx)

--�ܺ�Ű ����
alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

--������ ������ ���̺� ����
drop sequence seq_a_line_idx 
drop table a_line

insert into a_line values(seq_a_line_idx.nextVal, 3, '��������', sysdate);
