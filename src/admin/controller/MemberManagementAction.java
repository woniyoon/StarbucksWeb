package admin.controller;

import java.util.List;

import javax.servlet.http.*;

import org.json.*;

import admin.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;

public class MemberManagementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			super.setViewPage("/WEB-INF/admin/member_management.jsp");
		} else {
			String filterCondition = request.getParameter("filter_condition");			
			System.out.println(filterCondition);
			
			InterAdminDAO dao = new AdminDAO();
			
			List<MemberVO> memberList = dao.getAllMembers(filterCondition);
			
			JSONArray jArray = new JSONArray();
			
			for(MemberVO mvo : memberList) {
				JSONObject obj = new JSONObject();
				obj.put("member_seq", mvo.getMember_seq());
				obj.put("userid", mvo.getUserid());
				obj.put("name", mvo.getName());
				obj.put("email", mvo.getEmail());
				obj.put("gender", mvo.getGender());
				obj.put("point", mvo.getPoint());
				obj.put("status", mvo.getStatus());
				obj.put("birthdate", mvo.getBirthyyyy()+"/"+mvo.getBirthmm()+"/"+mvo.getBirthdd());
				obj.put("hp", mvo.getHp1()+"-"+mvo.getHp2()+"-"+mvo.getHp3());
				obj.put("registerday", mvo.getRegisterday());
				obj.put("age", 30);
			
				jArray.put(obj);
			}
			
			
			request.setAttribute("json", jArray);
			super.setViewPage("/WEB-INF/order/result.jsp");
		}
			
	}

}
