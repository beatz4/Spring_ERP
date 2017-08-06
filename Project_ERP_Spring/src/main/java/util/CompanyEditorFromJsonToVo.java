package util;

import java.beans.PropertyEditorSupport;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import vo.CompanyVo;

public class CompanyEditorFromJsonToVo extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		// TODO Auto-generated method stub
		// super.setAsText(text);
		
		ObjectMapper mapper = new ObjectMapper();
		
		CompanyVo value = null;
		
		try {
			value = new CompanyVo();
			JsonNode root = mapper.readTree(text);
			
			int pId = root.path("pId").asInt();
			int id = root.path("id").asInt();
			String name = root.path("id").asText();
			
			// pId가 0일 경우(부모가 없을 경우)는 0
			if (pId != 0) {
				int start = CustomUtil.getLengthOfInteger(pId);
				int end = CustomUtil.getLengthOfInteger(id);
				id = CustomUtil.subinteger(id, pId == 0 ? 0 : start, end);
			}
			
			value.setIdx(id);
			value.setParent_idx(pId);
			value.setName(name);
			value.setDescription(name); // 일단 name과 동일하게
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		setValue(value);
	}
}
