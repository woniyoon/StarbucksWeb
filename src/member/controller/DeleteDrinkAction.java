package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberDAO;

public class DeleteDrinkAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 	
		MemberDAO mdao = new MemberDAO();

		String[] favoriteMenuSeq = request.getParameterValues("favorite");
		
		for(String r : favoriteMenuSeq) { 
			System.out.println(r); 
		}
		
		int sum = 0;
		
		
		for(int i=0; i<favoriteMenuSeq.length; i++) {
		  
		  try { 
			  
			  int n = mdao.menuDelete(favoriteMenuSeq[i]); 
			  sum += n;
		  
		  } 
		  catch (Exception e) { 
			  e.printStackTrace(); 
		  }
		  
		  if(sum == favoriteMenuSeq.length) {
			  
			  response.sendRedirect("myMenu.sb");
			  
		  }
		  
		}
		 		
		
	}

}
