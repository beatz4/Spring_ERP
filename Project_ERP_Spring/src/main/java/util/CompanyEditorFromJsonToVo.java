package util;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import vo.CompanyVo;
import vo.CompanyVoArray;

public class CompanyEditorFromJsonToVo extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		// TODO Auto-generated method stub
		// super.setAsText(text);
		
 		List<CompanyVo> list = new ArrayList<CompanyVo>();
		
		try {
			JSONObject json = (JSONObject)new  JSONParser().parse(text);
			JSONArray jsonArray = (JSONArray) json.get("root");
			
			getListCompanyVoFromObject(jsonArray, list);
			/*
			Debug 용
			for( CompanyVo vo : list ) {
				System.out.printf("id : %d pId : %d name : %s\n", vo.getId(), vo.getParent_idx(), vo.getName());
			}
			*/
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// CompanyVoArray type으로 넘겨준다.
		CompanyVoArray list_company = new CompanyVoArray();
		list_company.setList_company(list);
		setValue(list_company);
	}
	
	// Json Object로부터 CompanyVo로 세팅하여 반환한다.
	public void getListCompanyVoFromObject( JSONArray jsonArray, List<CompanyVo> list ) {
		 
		if( jsonArray == null )
			return;
		
		for(Object ob : jsonArray) {
			JSONObject item = (JSONObject) ob;
			
			Long id = (Long)item.get("id");
			Long pId = (Long)item.get("pId");
			String name = (String)item.get("name");
			String description = name;		// 우선 name과 동일하게 해준다
			Boolean isParent = (Boolean)item.get("isParent");
			
			CompanyVo vo = new CompanyVo();
			vo.setId(CustomUtil.toIntegerFromLong(id));
			vo.setParent_idx(pId==null ? 0 : CustomUtil.toIntegerFromLong(pId));
			vo.setName(name);
			vo.setDescription(description);
			list.add(vo);
			
			if( isParent ) {
				JSONArray children = (JSONArray) item.get("children");
				getListCompanyVoFromObject( children, list );
			}
		}
	}
}
