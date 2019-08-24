package global.sesoc.ConsolGame.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String loginId = (String)request.getSession().getAttribute("loginId");
		
		if (loginId == null) {
			String path = request.getContextPath()+"/login";
			response.sendRedirect(path);
			
			return false;
		}
		
		return true;
	}

	
}
