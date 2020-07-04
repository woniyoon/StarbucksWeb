package admin.controller;

import javax.servlet.http.*;

import common.controller.AbstractController;

public class MenuManagementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setViewPage("/WEB-INF/admin/menu_management.jsp");
	}

}
