package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberDAO;

public class DeleteDrinkAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String seq = request.getParameter("seq");
		
		System.out.println("확인용 : "+seq);
		
		String[] seqArr = seq.split(",");
		
		MemberDAO mdao = new MemberDAO();
		
		int sum = 0;
		
		for(int i=0; i<seqArr.length; i++) {
			
			try {
				
				int n = mdao.menuDelete(seqArr[i]);
				sum += n;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(sum == seqArr.length) {
				
				response.sendRedirect("myMenu.sb");
				
			}
			
		}
		
		
	}

}
