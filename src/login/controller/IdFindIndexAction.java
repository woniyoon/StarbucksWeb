package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class IdFindIndexAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/login/idFindIndex.jsp");

	}

}
