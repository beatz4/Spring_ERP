--������ ����
create sequence e_app_idx
drop sequence e_app_idx

drop table e_app
--���ڰ��� DB���̺� ����
create table e_app (
					eap_idx	     int,			     --���ڰ��� ������ȣ
					eap_docu     int,                --������ȣ
					eap_line_idx int,                --���缱
					idx          int,                --�����ȣ
                    eap_title    varchar2(100),      --����
                    eap_content  clob,               --����
                    eap_st_date  date,               --��û��¥
                    eap_ap_date  date,               --���糯¥
					eap_ed_date  date,               --������¥
					eap_file     varchar2(100),      --÷������
					eap_ap_idx   int                 --�����һ����ȣ
)
--����Ű����
alter table e_app add constraint pk_e_app_eap_idx primary key (eap_idx) 

--�ٸ� ���̺��� ����Ű�� ����
alter table e_app add constraint fk_e_app_idx foreign key (idx) references user_manager(idx) 
alter table e_app add constraint fk_e_app_eap_line_idx foreign key (eap_line_idx) references eap_line (eap_line_idx)
--���õ����� �߰�

