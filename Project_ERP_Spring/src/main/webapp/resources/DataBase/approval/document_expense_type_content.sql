create sequence seq_c_expense_idx
drop sequence seq_c_expense_idx
create table c_expense(
						c_expense_idx 			int,   			--계정문서중 하나의 내용 idx
						t_expense_idx 			int,   			--계정문서 idx
						c_expense_date      	date,      		--지출일
					 	c_expense_content		varchar2(50),	--내용
						c_expense_customer		varchar2(10),	--거래처
					 	c_expense_money			int,			--금액
					 	c_expense_mepay			varchar2(20),	--결제수단
					 	c_expense_et			varchar2(50),	--비고
					 	c_expense_proof			varchar2(100)	--증빙서류명	
)

alter table c_expense add constraint pk_c_expense_idx primary key (c_expense_idx)

drop table c_expense

alter table c_expense add constraint fk_t_expense_idx foreign key (t_expense_idx) references t_expense(t_expense_idx)
alter table c_expense drop constraint fk_t_expense_idx 

insert into c_expense values(seq_c_expense_idx.nextVal,1,sysdate,'','',0,'','','')

select d.*, t.*, c.* from d_expense d 
inner join t_expense t on d.d_expense_idx = t.d_expense_idx 
inner join C_EXPENSE c on t.t_expense_idx = c.t_expense_idx

commit

