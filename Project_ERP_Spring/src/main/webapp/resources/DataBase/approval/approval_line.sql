create sequence seq_a_line_idx 

create table a_line (
						a_line_idx 			int,           --결재선idx
						idx          		int,           --결재선 만든 사원번호
						idx_one				int,           --결재 최하위
						idx_two             int,           --두번째 결재자
						idx_three           int,           --세번째 결재자
						idx_four           	int,           --최종결재자
                        a_line_name 		varchar2(100), --결재선명
                        a_line_regdate      date           --생성일자
)

select * from A_LINE
select * from 

--app_line_view 생성
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
--개인키 설정
alter table a_line add constraint pk_a_line_idx primary key (a_line_idx)

--외부키 연결
alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

--시퀀스 삭제및 테이블 삭제
drop sequence seq_a_line_idx 
drop table a_line

insert into a_line values(seq_a_line_idx.nextVal, 3, '내결제선', sysdate);
