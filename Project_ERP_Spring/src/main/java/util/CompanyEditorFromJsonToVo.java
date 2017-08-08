package util;

import java.beans.PropertyEditorSupport;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class CompanyEditorFromJsonToVo extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		// TODO Auto-generated method stub
		// super.setAsText(text);
		
		System.out.println(text);
		
		try {
			JSONObject json = (JSONObject)new  JSONParser().parse(text);
			
			JSONArray jsonArray = (JSONArray) json.get("root");
			
			for(Object ob : jsonArray){
				JSONObject item = (JSONObject) ob;
				Long id = (Long)item.get("id");
				Long pId = (Long)item.get("pId");
				String name = (String)item.get("name");
				
				if( pId != 0 ) {
					// int length = CustomUtil.getLengthOfInteger(pId);
				}
				
				System.out.printf("id : %d  name  :  %s\n",id,name);
			}
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		/*ObjectMapper mapper = new ObjectMapper();
		CompanyVo value = null;
		
		try {
			List<TreeVo> tree_list = mapper.readValue(text, TypeFactory.defaultInstance().
					constructCollectionType(List.class, TreeVo.class));
			
			System.out.println(tree_list.size());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		/*
		System.out.println(text);
		
		CompanyVo[] myObjects = mapper.readValue(text, CompanyVo[].class);
		
		try {
			value = new CompanyVo();
			JsonNode root = mapper.readTree(text);
			
			int pId = root.path("pId").asInt();
			int id = root.path("id").asInt();
			String name = root.path("name").asText();
			
			System.out.println(id);
			System.out.println(pId);
			System.out.println(name);
			System.out.println("------editor--------");
			
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
		*/
	}
}
