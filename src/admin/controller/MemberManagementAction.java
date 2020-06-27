package admin.controller;

import java.util.List;

import javax.servlet.http.*;

import admin.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;

public class MemberManagementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterAdminDAO dao = new AdminDAO();
		
		List<MemberVO> memberList = dao.getAllMembers();
		
		request.setAttribute("memberList", memberList);
		
		super.setViewPage("/WEB-INF/admin/member_management.jsp");
	}

}
