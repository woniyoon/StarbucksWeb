package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMyMenuDAO;
import member.model.MemberVO;
import member.model.MenuVO;
import member.model.MyMenuDAO;

public class MyMenuAction extends AbstractController { 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
	//	System.out.println("loginUser : " + loginuser.getUserid());
		
		InterMyMenuDAO pdao = new MyMenuDAO();
		
		List<MenuVO> menuList = pdao.selectMyMenu(loginuser.getUserid());
		//List<MenuVO> menuList = pdao.selectMyMenu("test");
		
//		System.out.println("menuList size  : " + menuList.size());
		
		request.setAttribute("menuList", menuList);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/member/myMenu.jsp");
		
	}

}
