package car.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import car.member.control.Controller;
import car.member.hander.MemberHandlerAdapter;

public class MemberLogoutController implements Controller {

private static final Log log = LogFactory.getLog(MemberLogoutController.class);

	@Override
	public MemberHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession( );
		String member_id = (String) httpSession.getAttribute("member_id");
		request.setAttribute("member_id", member_id);
		
		httpSession.invalidate( );
		Cookie[ ] cookies = request.getCookies( );
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName( ).equals("member_id")) {
					log.info(cookie.getName( ).equals("member_id"));
					// cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}

		MemberHandlerAdapter memberhandlerAdapter = new MemberHandlerAdapter( );
		memberhandlerAdapter.setPath("/WEB-INF/view/login/logout.jsp");
		return memberhandlerAdapter;
	}
}