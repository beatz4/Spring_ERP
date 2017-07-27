package vo;

public class UserVo {
	
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
