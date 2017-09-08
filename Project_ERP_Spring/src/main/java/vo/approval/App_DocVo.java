package vo.approval;

public class App_DocVo {

	int app_d_idx, idx, next_idx, doc_idx, a_line_idx, app_one, app_two, app_three, app_four, d_condition;
	String app_d_edate, app_document_title, company_name, user_name, app_one_date, app_two_date, app_three_date, app_four_date, doc_title, c_name, name;
	
	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDoc_title() {
		return doc_title;
	}

	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}

	public String getApp_document_title() {
		return app_document_title;
	}

	public void setApp_document_title(String app_document_title) {
		this.app_document_title = app_document_title;
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

	public String getApp_one_date() {
		
		if(app_one_date != null){
			
			return app_one_date.substring(0, 10);
		}
		return app_one_date;
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

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getApp_d_idx() {
		return app_d_idx;
	}

	public void setApp_d_idx(int app_d_idx) {
		this.app_d_idx = app_d_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getDoc_idx() {
		return doc_idx;
	}

	public void setDoc_idx(int doc_idx) {
		this.doc_idx = doc_idx;
	}

	public int getA_line_idx() {
		return a_line_idx;
	}

	public void setA_line_idx(int a_line_idx) {
		this.a_line_idx = a_line_idx;
	}

	public String getApp_d_edate() {
		return app_d_edate;
	}

	public void setApp_d_edate(String app_d_edate) {
		this.app_d_edate = app_d_edate;
	}

}
