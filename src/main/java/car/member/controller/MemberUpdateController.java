package car.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import car.member.control.Controller;
import car.member.dao.MemberDAO;
import car.member.dto.MemberDTO;
import car.member.hander.MemberHandlerAdapter;

public class MemberUpdateController implements Controller {

private static final Log log = LogFactory.getLog(MemberUpdateController.class);

	@Override
	public MemberHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		int member_code = Integer.parseInt(request.getParameter("member_code"));
		String member_id = request.getParameter("member_id");
		String member_name = request.getParameter("member_name");
		String member_password = request.getParameter("member_password");
		String member_email = request.getParameter("member_email");
		String member_callnumber =request.getParameter("member_callnumber");
		String member_birthday = request.getParameter("member_birthday");
		String member_gender = request.getParameter("member_gender");
		String member_joinday = request.getParameter("member_joinday");
		String member_car_num1 = request.getParameter("member_car_num1");
		String member_car_num2 = request.getParameter("member_car_num2");
		String member_car_num3 = request.getParameter("member_car_num3");
		String member_rating = request.getParameter("member_rating");
		
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		
		memberDTO.setMember_code(member_code);
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_name(member_name);
		memberDTO.setMember_password(member_password);
		memberDTO.setMember_email(member_email);
		memberDTO.setMember_callnumber(member_callnumber);
		memberDTO.setMember_birthday(member_birthday);
		memberDTO.setMember_gender(member_gender);
		memberDTO.setMember_joinday(member_joinday);
		memberDTO.setMember_car_num1(member_car_num1);
		memberDTO.setMember_car_num1(member_car_num2);
		memberDTO.setMember_car_num1(member_car_num3);
		memberDTO.setMember_rating(member_rating);
		
		memberDTO = memberDAO.memberUpdate(memberDTO);
		log.info(memberDTO);
		
		request.setAttribute("memberDTO", memberDTO);
		MemberHandlerAdapter memberHandlerAdapter = new MemberHandlerAdapter();
		
		memberHandlerAdapter.setPath("/WEB-INF/view/member/member_update.jsp");
		return memberHandlerAdapter;
	}

}
