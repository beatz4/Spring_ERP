package vo;

public class MessageVo {

	int idx;
	int msg_idx;
	String send_id;
	String recv_id;
	String title;
	String content;
	String send_date;
	String recv_date;
	String send_state;
	String msg_box;
	String ip;

	public MessageVo(int msg_idx, String send_id, String recv_id, String title, String content, String send_date,
			String recv_date, String send_state, String msg_box, String ip) {
		super();
		this.msg_idx = msg_idx;
		this.send_id = send_id;
		this.recv_id = recv_id;
		this.title = title;
		this.content = content;
		this.send_date = send_date;
		this.recv_date = recv_date;
		this.send_state = send_state;
		this.msg_box = msg_box;
		this.ip = ip;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public MessageVo() {
		// TODO Auto-generated constructor stub
	}

	public int getMsg_idx() {
		return msg_idx;
	}

	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getRecv_id() {
		return recv_id;
	}

	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getRecv_date() {
		return recv_date;
	}

	public void setRecv_date(String recv_date) {
		this.recv_date = recv_date;
	}

	public String getSend_state() {
		return send_state;
	}

	public void setSend_state(String send_state) {
		this.send_state = send_state;
	}

	public String getMsg_box() {
		return msg_box;
	}

	public void setMsg_box(String msg_box) {
		this.msg_box = msg_box;
	}

}
