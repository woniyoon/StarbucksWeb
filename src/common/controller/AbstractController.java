package common.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public abstract class AbstractController implements InterCommand {

	private boolean isRedirect = false;
	private String viewPage;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getViewPage() {
		return viewPage;
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	
	////////////////////////////////////////////////
	// 로그인 유무를 검사해서 로그인 했으면 true 를 리턴해주고
	// 로그인 안 했으면 false 를 리턴해주도록 한다.
	protected boolean checkLogin(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null)
			return true;
		else
			return false;
	}
	
}