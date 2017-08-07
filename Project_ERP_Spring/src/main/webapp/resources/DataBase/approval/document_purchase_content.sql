create sequence seq_c_purchase_idx

create table c_purchase(
						c_purchase_idx int,   			--�Ϸù�ȣ
						t_purchase_idx int,    			--��������(����)�Ϸù�ȣ
						c_purchase_name varchar2(100), 	--ǰ��
						c_purchase_unit varchar2(50), 	--����
						c_purchase_uprice int,        	--�ܰ�
						c_purchase_quantity int,    	--����
						c_purchase_price   int,      	--�ѱݾ�
						c_purchase_et   varchar2(100) 	--���
)


alter table c_purchase add constraint pk_c_purchase_idx primary key (c_purchase_idx)

alter table c_purchase add constraint fk_t_purchase_idx foreign key (t_purchase_idx) references t_purchase(t_purchase_idx)

drop table c_purchase