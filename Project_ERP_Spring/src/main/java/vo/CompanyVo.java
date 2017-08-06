/*
조직 구성 vo
 */

package vo;

import java.io.Serializable;

public class CompanyVo implements Serializable {
	
	int idx;
	int parent_idx;
	String name;
	String description;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getParent_idx() {
		return parent_idx;
	}

	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
