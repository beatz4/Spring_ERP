--시퀀스 생성
create sequence e_app_idx
drop sequence e_app_idx

drop table e_app
--전자결재 DB테이블 생성
create table e_app (
					eap_idx	     int,			     --전자결재 문서번호
					eap_docu     int,                --서류번호
					eap_line_idx int,                --결재선
					idx          int,                --사원번호
                    eap_title    varchar2(100),      --제목
                    eap_content  clob,               --내용
                    eap_st_date  date,               --신청날짜
                    eap_ap_date  date,               --결재날짜
					eap_ed_date  date,               --마감날짜
					eap_file     varchar2(100),      --첨부파일
					eap_ap_idx   int                 --결재할사원번호
)
--개인키설정
alter table e_app add constraint pk_e_app_eap_idx primary key (eap_idx) 

--다른 테이블의 개인키와 연결
alter table e_app add constraint fk_e_app_idx foreign key (idx) references user_manager(idx) 
alter table e_app add constraint fk_e_app_eap_line_idx foreign key (eap_line_idx) references eap_line (eap_line_idx)
--샘플데이터 추가

