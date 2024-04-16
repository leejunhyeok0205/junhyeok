package car.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import car.member.dto.MemberDTO;
import car.member.service.MemberService;

public class MemberDAO implements MemberService {

	private static final Log log = LogFactory.getLog(MemberDAO.class);

	@Override
	public ArrayList<MemberDTO> memberSelectAll() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<MemberDTO> arrayList = new ArrayList<MemberDTO>();
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select member_code, member_id, member_name, member_email, member_callnumber, member_birthday, member_gender, member_joinday, member_car_num1, member_car_num2, member_car_num3, member_rating from member";
			log.info(sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setMember_code(Integer.parseInt(resultSet.getString("member_code")));
				memberDTO.setMember_id(resultSet.getString("member_id"));
				memberDTO.setMember_name(resultSet.getString("member_name"));
				memberDTO.setMember_email(resultSet.getString("member_email"));
				memberDTO.setMember_callnumber(resultSet.getString("member_callnumber"));
				memberDTO.setMember_birthday(resultSet.getString("member_birthday"));
				memberDTO.setMember_gender(resultSet.getString("member_gender"));
				memberDTO.setMember_joinday(resultSet.getString("member_joinday"));
				memberDTO.setMember_car_num1(resultSet.getString("member_car_num1"));
				memberDTO.setMember_car_num2(resultSet.getString("member_car_num2"));
				memberDTO.setMember_car_num3(resultSet.getString("member_car_num3"));
				memberDTO.setMember_rating(resultSet.getString("member_rating"));
				arrayList.add(memberDTO);
			}
			resultSet.getRow();
			if (resultSet.getRow() == 0) {
				log.info("등록된 회원이 없습니다 회원을 등록해주세요");
			}
		} catch (Exception e) {
			log.info("전체 부서 조회 실패" + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return arrayList;
	}

	@Override
	public MemberDTO memberSelect(int member_code) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		MemberDTO memberDTO = new MemberDTO();
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql= "select member_code, member_id, member_name, member_password, member_email, member_callnumber, member_birthday, member_gender, member_joinday, member_car_num1, member_car_num2, member_car_num3, member_rating from member ";
			sql += " where member_code = ? ";
			log.info("쿼리문 확인 - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, member_code);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				memberDTO.setMember_code(Integer.parseInt(resultSet.getString("member_code")));
				memberDTO.setMember_id(resultSet.getString("member_id"));
				memberDTO.setMember_name(resultSet.getString("member_name"));
				memberDTO.setMember_password(resultSet.getString("member_password"));
				memberDTO.setMember_email(resultSet.getString("member_email"));
				memberDTO.setMember_callnumber(resultSet.getString("member_callnumber"));
				memberDTO.setMember_birthday(resultSet.getString("member_birthday"));
				memberDTO.setMember_gender(resultSet.getString("member_gender"));
				memberDTO.setMember_joinday(resultSet.getString("member_joinday"));
				memberDTO.setMember_car_num1(resultSet.getString("member_car_num1"));
				memberDTO.setMember_car_num2(resultSet.getString("member_car_num2"));
				memberDTO.setMember_car_num3(resultSet.getString("member_car_num3"));
				memberDTO.setMember_rating(resultSet.getString("member_rating"));
			}
		} catch (Exception e) {
			log.info("특정 회원 검색 실패" + e);
		}finally {
			try {
				connection.close();
				preparedStatement.close();
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public MemberDTO memberInsert(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "insert into member (member_code, member_id, member_name, member_password, member_email, member_callnumber, member_birthday, member_gender, member_joinday, member_car_num1, member_car_num2, member_car_num3)";
			sql += " values(member_seq.nextval , ? , ? ,? , ? , ? , to_date( ? , 'yyyy-mm-dd') , ? , SYSDATE , ? , ? , ?)";
			log.info("SQL 확인" + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getMember_id());
			preparedStatement.setString(2, memberDTO.getMember_name());
			preparedStatement.setString(3, memberDTO.getMember_password());
			preparedStatement.setString(4, memberDTO.getMember_email());
			preparedStatement.setString(5, memberDTO.getMember_callnumber());
			preparedStatement.setString(6, memberDTO.getMember_birthday());
			preparedStatement.setString(7, memberDTO.getMember_gender());//			preparedStatement.setString(9, memberDTO.getMember_joinday());
			preparedStatement.setString(8, memberDTO.getMember_car_num1());
			preparedStatement.setString(9, memberDTO.getMember_car_num2());
			preparedStatement.setString(10, memberDTO.getMember_car_num3());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			log.info("부서 입력 실패" + e);
		}finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public MemberDTO memberUpdate(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection =dataSource.getConnection();
			String sql="update member set member_id = ? , member_name = ?, member_password = ?, member_email = ?, member_callnumber = ?, member_birthday = to_date(?,'yyyy-mm-dd'), member_gender = ?, member_car_num1 = ?, member_car_num2 = ?, member_car_num3 = ?, member_rating = ?";
			sql +=" where member_code = ?";
			log.info("SQL 확인 - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getMember_id());
			preparedStatement.setString(2, memberDTO.getMember_name());
			preparedStatement.setString(3, memberDTO.getMember_password());
			preparedStatement.setString(4, memberDTO.getMember_email());
			preparedStatement.setString(5, memberDTO.getMember_callnumber());
			preparedStatement.setString(6, memberDTO.getMember_birthday());
			preparedStatement.setString(7, memberDTO.getMember_gender());
			preparedStatement.setString(8, memberDTO.getMember_car_num1());
			preparedStatement.setString(9, memberDTO.getMember_car_num2());
			preparedStatement.setString(10, memberDTO.getMember_car_num3());
			preparedStatement.setString(11, memberDTO.getMember_rating());
			preparedStatement.setInt(12, memberDTO.getMember_code());

			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			log.info("부서 수정 실패" + e);
		}finally {
			try {
				connection.close();
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public MemberDTO memberDelete(int member_code) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection =dataSource.getConnection();
			String sql = "delete from member ";
			sql +=" where member_code = ?";
			log.info("SQL확인" + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, member_code);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			log.info("부서 삭제 실패" + e);
		}finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public MemberDTO memberLogin(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext( );
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection( );
			String sql = "select * from member ";
			sql +=" where member_id = ?";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getMember_id( ));
			// SQL 문인 select…from…where 문을 실행하고 데이터를 조회한다.
			resultSet = preparedStatement.executeQuery( );
			// 커서를 현재 위치에서 한 행 앞으로 이동하면서 조건을 확인한다.
			if(resultSet.next( )) {
				// 입력한 아이디와 비밀번호가 기존의 아이디와 비밀번호가 일치하는지를 검사한다.
				memberDTO.setMember_code(resultSet.getInt("member_code"));
				memberDTO.setMember_id(resultSet.getString("member_id"));
				log.info("아이디 확인 - " + resultSet.getString("member_id"));
				if(resultSet.getString("member_password").equals(memberDTO.getMember_password( ))) {
					memberDTO.setMember_password(resultSet.getString("member_password"));
					log.info("비밀번호 확인 - " + resultSet.getString("member_password"));
				} else {
					memberDTO.setMember_password("");
				}
			} else {
				memberDTO.setMember_id("");
			}
		} catch(Exception e) {
			log.info("로그인 실패 - " + e);
		} finally {
			try {
				resultSet.close( );
				preparedStatement.close( );
				connection.close( );
			} catch(SQLException e) {
				e.printStackTrace( );
			}
		}
		return memberDTO;
	}
}