package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberDAO;

public class DeleteFoodAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String no = request.getParameter("no");
		
		System.out.println("확인용 : "+no);
		
		
		String[] noArr = no.split(",");
		
		MemberDAO mdao = new MemberDAO();
		
		int sum = 0;
		
		for(int i=0; i<noArr.length; i++) {
			
			
		}
		
		
		
	}

}
