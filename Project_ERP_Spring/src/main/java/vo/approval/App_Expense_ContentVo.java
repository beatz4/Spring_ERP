package vo.approval;

public class App_Expense_ContentVo {

	int t_expense_idx;
	String t_expense_title;
	int d_expense_idx;
	int c_expense_idx;
	String c_expense_date, c_expense_content, c_expense_customer, c_expense_mepay, c_expense_et, c_expense_proof, c_expense_money;

	
	public String getT_expense_title() {
		return t_expense_title;
	}

	public void setT_expense_title(String t_expense_title) {
		this.t_expense_title = t_expense_title;
	}

	public int getD_expense_idx() {
		return d_expense_idx;
	}

	public void setD_expense_idx(int d_expense_idx) {
		this.d_expense_idx = d_expense_idx;
	}

	public int getT_expense_idx() {
		return t_expense_idx;
	}

	public void setT_expense_idx(int t_expense_idx) {
		this.t_expense_idx = t_expense_idx;
	}

	public int getC_expense_idx() {
		return c_expense_idx;
	}

	public void setC_expense_idx(int c_expense_idx) {
		this.c_expense_idx = c_expense_idx;
	}

	public String getC_expense_money() {
		return c_expense_money;
	}

	public void setC_expense_money(String c_expense_money) {
		this.c_expense_money = c_expense_money;
	}

	public String getC_expense_date() {
		return c_expense_date.substring(0, 10);
	}

	public void setC_expense_date(String c_expense_date) {
		this.c_expense_date = c_expense_date;
	}

	public String getC_expense_content() {
		return c_expense_content;
	}

	public void setC_expense_content(String c_expense_content) {
		this.c_expense_content = c_expense_content;
	}

	public String getC_expense_customer() {
		return c_expense_customer;
	}

	public void setC_expense_customer(String c_expense_customer) {
		this.c_expense_customer = c_expense_customer;
	}

	public String getC_expense_mepay() {
		return c_expense_mepay;
	}

	public void setC_expense_mepay(String c_expense_mepay) {
		this.c_expense_mepay = c_expense_mepay;
	}

	public String getC_expense_et() {
		return c_expense_et;
	}

	public void setC_expense_et(String c_expense_et) {
		this.c_expense_et = c_expense_et;
	}

	public String getC_expense_proof() {
		return c_expense_proof;
	}

	public void setC_expense_proof(String c_expense_proof) {
		this.c_expense_proof = c_expense_proof;
	}

}
