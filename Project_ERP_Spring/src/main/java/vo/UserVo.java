package vo;

import java.io.Serializable;

public class UserVo implements Serializable {

	int idx;
	int g_idx;
	String name;
	String regnumber;
	String address;
	String email;
	String phone;
	String id;
	String password;
	String regdate;

	// 직급
	String g_position;
	int g_level;

	// 소속 그룹
	int c_idx;
	String c_name;
	
	//Jsonconverter 쓰기위한 constructor
	public UserVo() {
		// TODO Auto-generated constructor stub
	}
	
	//approval_line 담을 constructor
	public UserVo(int idx, int g_idx, String name, String g_position, int g_level, String c_name, int c_idx) {
		super();
		this.idx = idx;
		this.g_idx = g_idx;
		this.name = name;
		this.g_position = g_position;
		this.g_level = g_level;
		this.c_name = c_name;
		this.c_idx = c_idx;
	}



	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getG_idx() {
		return g_idx;
	}

	public void setG_idx(int g_idx) {
		this.g_idx = g_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegnumber() {
		return regnumber;
	}

	public void setRegnumber(String regnumber) {
		this.regnumber = regnumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	// Grade 관련 Data
	public String getG_position() {
		return g_position;
	}

	public void setG_position(String g_position) {
		this.g_position = g_position;
	}

	public int getG_level() {
		return g_level;
	}

	public void setG_level(int g_level) {
		this.g_level = g_level;
	}
}
