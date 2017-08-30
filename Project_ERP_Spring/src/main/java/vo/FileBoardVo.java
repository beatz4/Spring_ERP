package vo;

public class FileBoardVo {

	int idx;
	String title;
	String write_id;
	String write_date;
	int readhit;
	String ip;
	
	public FileBoardVo() {
		// TODO Auto-generated constructor stub
	}
	
	public FileBoardVo(String title, String write_id, String write_date, int readhit, String ip) {
		super();
		this.title = title;
		this.write_id = write_id;
		this.write_date = write_date;
		this.readhit = readhit;
		this.ip = ip;
	}
	
	public FileBoardVo(String title, String write_date, int readhit, String ip) {
		super();
		this.title = title;
		this.write_date = write_date;
		this.readhit = readhit;
		this.ip = ip;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
