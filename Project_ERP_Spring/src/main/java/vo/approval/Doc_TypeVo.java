package vo.approval;

public class Doc_TypeVo {

	int doc_idx, idx;
	String doc_title, regdate;

	public int getDoc_idx() {
		return doc_idx;
	}

	public void setDoc_idx(int doc_idx) {
		this.doc_idx = doc_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getDoc_title() {
		return doc_title;
	}

	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}

	public String getRegdate() {
		return regdate.substring(2, 10).replaceAll("-", ".");
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
