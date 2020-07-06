package common.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(
		description = "사용자가 웹에서 *.sb을 했을 경우 이 서블릿이 먼저 응답을 해주도록 한다", 
		urlPatterns = { "*.sb" }, 
		initParams = { 
		//		@WebInitParam(name = "propertyConfig", value = "/Users/woniyoon/Documents/myjsp/StarbucksWeb/WebContent/WEB-INF/Command.properties", description = "*.sb에 대한 클래스의 맵핑파일")
				@WebInitParam(name = "propertyConfig", value = "C:/myjsp/StarbucksWeb/WebContent/WEB-INF/Command.properties", description = "*.sb에 대한 클래스의 매핑파일")
		
		})
public class FrontController extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	Map<String, Object> cmdMap = new HashMap<String, Object>();
	
	
	public void init(ServletConfig config) throws ServletException {
		Properties pr = new Properties();
		FileInputStream fis = null;
				
		try {
			String props = config.getInitParameter("propertyConfig");
			System.out.println("[확인용] props : " + props);
		
			fis = new FileInputStream(props);
			
			pr.load(fis);
		
			/*
	          fis 객체를 사용하여 C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일의 내용을 읽어다가 
	          Properties 클래스이 객체인 pr 에 로드시킨다. 
	             그러면 pr 은 읽어온 파일(Command.properties)의 내용에서
	          = 을 기준으로 왼쪽은 key로 보고, 오른쪽은 value 로 인식한다.     
	       */
			
			Enumeration<Object> en = pr.keys();
			
		  /*
	          pr.keys(); 은 
	          C:/myjsp/MyMVC/WebContent/WEB-INF/Command.properties 파일의 내용물에서 
	          = 을 기준으로 왼쪽에 있는 모든 key 들만 가져오는 것이다.     
	      */
			
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				
				System.out.println("[확인용] key : " + key);
				System.out.println("[확인용] pr.getProperty(key) : " + pr.getProperty(key));

				String className = pr.getProperty(key);
				
				if(className != null) {
					className = className.trim();
					
					Class<?> cls = Class.forName(className);
					// String 타입으로 되어진 className 을 클래스화 시켜주는 것이다.
		            // 주의할 점은 실제로 String 으로 되어져 있는 문자열이 클래스로 존재해야만 한다는 것이다.
					
					Object obj = cls.newInstance();
					
					cmdMap.put(key, obj);
					// cmdMap 에서 키값으로 Command.properties 파일에 저장되어진 url 을 주면 
		            // cmdMap 에서 해당 클래스에 대한 객체(인스턴스)를 얻어오도록 만든 것이다.
				}
			}
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}
	
	
	private void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		String ctxPath = request.getContextPath();
		
		String key = uri.substring(ctxPath.length());

		AbstractController action = (AbstractController) cmdMap.get(key);
		if(action == null) {
			System.out.println("⚠️⚠️⚠️ " +key +" URL 패턴에 맵핑된 클래스는 없습니다. ⚠️⚠️⚠️");
		} else {
			try {
				action.execute(request, response);
				
				boolean isRedirect = action.isRedirect();
				String viewPage = action.getViewPage();
				
				if(!isRedirect) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				} else {
					response.sendRedirect(viewPage);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
			
		}
	}

}
