package notice.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import notice.model.InterNoticeDAO;
import notice.model.NoticeDAO;

public class LocationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterNoticeDAO dao = new NoticeDAO();
		
		List<HashMap<String, String>> storeMapList = dao.selectStoreMap();
		
		JSONArray jsonArr = new JSONArray();
		
		if(storeMapList.size() > 0) {
			// storeMapList 데이터가 존재한다면
			
			for(HashMap<String, String> storeMap : storeMapList) {
				JSONObject jsonObj = new JSONObject();
				
				String store_id = storeMap.get("STORE_ID");
				String store_sequence = storeMap.get("STORE_SEQUENCE");
				String store_name = storeMap.get("STORE_NAME");
				String address = storeMap.get("ADDRESS");
				String url = storeMap.get("URL");
				double latitude = Double.parseDouble(storeMap.get("LATITUDE"));
				double longitude = Double.parseDouble(storeMap.get("LONGITUDE"));
				int zIndex = Integer.parseInt(storeMap.get("ZINDEX"));
				
				jsonObj.put("store_id", store_id);
				jsonObj.put("store_sequence", store_sequence);
				jsonObj.put("store_name", store_name);
				jsonObj.put("address", address);
				jsonObj.put("url", url);
				jsonObj.put("latitude", latitude);
				jsonObj.put("longitude", longitude);
				jsonObj.put("zIndex", zIndex);
				
				jsonArr.put(jsonObj);
				
			}
		} 
		
		String json = jsonArr.toString(); // 문자열로 바꿔준다.
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");

		
	}

}
