create sequence seq_t_purchase_idx

create table t_purchase(
						t_purchase_idx int,    --�Ϸù�ȣ
						d_purchase_idx int,    --�����Ϸù�ȣ
						t_purchase_title varchar2(100) --��������

)

alter table t_purchase add constraint pk_t_purchase_idx primary key (t_purchase_idx) 

alter table t_purchase add constraint fk_d_purchase_idx foreign key (d_purchase_idx) references d_purchase(d_purchase_idx)