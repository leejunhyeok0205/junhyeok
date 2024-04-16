package car.member.service;

import java.util.ArrayList;

import car.member.dto.MemberDTO;

public interface MemberService {
	public ArrayList<MemberDTO> memberSelectAll();

	public MemberDTO memberSelect(int member_code);

	public MemberDTO memberInsert(MemberDTO memberDTO);

	public MemberDTO memberUpdate(MemberDTO memberDTO);

	public MemberDTO memberDelete(int member_code);
	
	public MemberDTO memberLogin(MemberDTO memberDTO);

}