package car.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import car.member.control.Controller;
import car.member.dao.MemberDAO;
import car.member.dto.MemberDTO;
import car.member.hander.MemberHandlerAdapter;

public class MemberInsertController implements Controller{
	private static final Log log = LogFactory.getLog(MemberInsertController.class);

	@Override
	public MemberHandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_callnumber = request.getParameter("member_callnumber");
		String member_birthday = request.getParameter("member_birthday");
		String member_gender = request.getParameter("member_gender");
		String member_car_num1 = request.getParameter("member_car_num1");
		String member_car_num2 = request.getParameter("member_car_num2");
		String member_car_num3 = request.getParameter("member_car_num3");
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_password(member_password);
		memberDTO.setMember_name(member_name);
		memberDTO.setMember_email(member_email);
		memberDTO.setMember_callnumber(member_callnumber);
		memberDTO.setMember_birthday(member_birthday);
		memberDTO.setMember_gender(member_gender);
		memberDTO.setMember_car_num1(member_car_num1);
		memberDTO.setMember_car_num2(member_car_num2);
		memberDTO.setMember_car_num3(member_car_num3);
		memberDTO = memberDAO.memberInsert(memberDTO);
		log.info(memberDTO);
		request.setAttribute("memberDTO", memberDTO);
		MemberHandlerAdapter memberHandlerAdapter = new MemberHandlerAdapter();
		
		memberHandlerAdapter.setPath("./WEB-INF/view/member/member_insert.jsp");
		return memberHandlerAdapter;
	}

}
