package car.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.member.control.Controller;
import car.member.dao.MemberDAO;
import car.member.dto.MemberDTO;
import car.member.hander.MemberHandlerAdapter;

public class MemberLoginController implements Controller {

	@Override
	public MemberHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		
		MemberDTO memberDTO = new MemberDTO( );
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_password(member_password);
		
		MemberDAO memberDAO = new MemberDAO( );
		memberDTO = memberDAO.memberLogin(memberDTO);
		request.setAttribute("member_name", memberDTO.getMember_name( ));
		request.setAttribute("memberDTO", memberDTO);
		if(!memberDTO.getMember_id( ).equals("") & !memberDTO.getMember_password( ).equals("")) {
			HttpSession httpSession = request.getSession( );
			httpSession.setAttribute("mebmer_id", memberDTO.getMember_id( ));
			httpSession.setAttribute("member_name", memberDTO.getMember_name( ));
			Cookie cookie = new Cookie("member_id", memberDTO.getMember_id( ));
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		MemberHandlerAdapter memberHandlerAdapter = new MemberHandlerAdapter( );
		memberHandlerAdapter.setPath("/WEB-INF/view/login/login_check.jsp");
		return memberHandlerAdapter;
	}

}
