package order.controller;

import java.util.*;

import javax.servlet.http.*;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.*;

public class GetPointsAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(!super.checkLogin(request)) {
			
		} else {
			MemberVO mvo = (MemberVO) request.getSession().getAttribute("loginuser");
			InterMemberDAO dao = new MemberDAO();
			HashMap<String, String> paramap = new HashMap<>();
			paramap.put("userid", mvo.getUserid());
			
			int points = dao.checkPoints(paramap);
			
			JSONObject jsobj = new JSONObject();
			jsobj.put("point", points);
			
			request.setAttribute("json", jsobj);
			super.setViewPage("/WEB-INF/order/result.jsp");
		}
	}

}
