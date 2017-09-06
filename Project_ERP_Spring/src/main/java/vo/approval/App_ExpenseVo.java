package vo.approval;

public class App_ExpenseVo {
	
	int d_expense_idx, idx, app_d_idx, next_idx;
	String d_expense_regdate, d_expense_title, d_expense_date, d_expense_acnumber, d_expense_acname, d_expense_tpay, ip, d_expense_total;
	int t_expense_idx, app_one, app_two, app_three, app_four, d_condition;
	String t_expense_title, app_one_date, app_two_date, app_three_date, app_four_date;
	
	public String getApp_one_date() {
		return app_one_date.substring(0, 10);
	}

	public void setApp_one_date(String app_one_date) {
		this.app_one_date = app_one_date;
	}

	public String getApp_two_date() {
		
		if(app_two_date != null){
			return app_two_date.substring(0, 10);
		}
		return app_two_date;
	}

	public void setApp_two_date(String app_two_date) {
		this.app_two_date = app_two_date;
	}

	public String getApp_three_date() {
		
		if(app_three_date != null){
			return app_three_date.substring(0, 10);
		}
		return app_three_date;
	}

	public void setApp_three_date(String app_three_date) {
		this.app_three_date = app_three_date;
	}

	public String getApp_four_date() {
		if(app_four_date != null){
			return app_four_date.substring(0, 10);
		}
		return app_four_date;
	}

	public void setApp_four_date(String app_four_date) {
		this.app_four_date = app_four_date;
	}

	public int getNext_idx() {
		return next_idx;
	}

	public void setNext_idx(int next_idx) {
		this.next_idx = next_idx;
	}

	public int getApp_one() {
		return app_one;
	}

	public void setApp_one(int app_one) {
		this.app_one = app_one;
	}

	public int getApp_two() {
		return app_two;
	}

	public void setApp_two(int app_two) {
		this.app_two = app_two;
	}

	public int getApp_three() {
		return app_three;
	}

	public void setApp_three(int app_three) {
		this.app_three = app_three;
	}

	public int getApp_four() {
		return app_four;
	}

	public void setApp_four(int app_four) {
		this.app_four = app_four;
	}

	public int getD_condition() {
		return d_condition;
	}

	public void setD_condition(int d_condition) {
		this.d_condition = d_condition;
	}

	public int getD_expense_idx() {
		return d_expense_idx;
	}

	public void setD_expense_idx(int d_expense_idx) {
		this.d_expense_idx = d_expense_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getApp_d_idx() {
		return app_d_idx;
	}

	public void setApp_d_idx(int app_d_idx) {
		this.app_d_idx = app_d_idx;
	}

	public String getD_expense_total() {
		return d_expense_total;
	}

	public void setD_expense_total(String d_expense_total) {
		this.d_expense_total = d_expense_total;
	}

	public String getD_expense_regdate() {
		return d_expense_regdate.substring(2, 10).replaceAll("-", ".");
	}

	public void setD_expense_regdate(String d_expense_regdate) {
		this.d_expense_regdate = d_expense_regdate;
	}

	public String getD_expense_title() {
		return d_expense_title;
	}

	public void setD_expense_title(String d_expense_title) {
		this.d_expense_title = d_expense_title;
	}

	public String getD_expense_date() {
		return d_expense_date.substring(0, 10);
	}

	public void setD_expense_date(String d_expense_date) {
		this.d_expense_date = d_expense_date;
	}

	public String getD_expense_acnumber() {
		return d_expense_acnumber;
	}

	public void setD_expense_acnumber(String d_expense_acnumber) {
		this.d_expense_acnumber = d_expense_acnumber;
	}

	public String getD_expense_acname() {
		return d_expense_acname;
	}

	public void setD_expense_acname(String d_expense_acname) {
		this.d_expense_acname = d_expense_acname;
	}

	public String getD_expense_tpay() {
		return d_expense_tpay;
	}

	public void setD_expense_tpay(String d_expense_tpay) {
		this.d_expense_tpay = d_expense_tpay;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getT_expense_idx() {
		return t_expense_idx;
	}

	public void setT_expense_idx(int t_expense_idx) {
		this.t_expense_idx = t_expense_idx;
	}

	public String getT_expense_title() {
		return t_expense_title;
	}

	public void setT_expense_title(String t_expense_title) {
		this.t_expense_title = t_expense_title;
	}

}
