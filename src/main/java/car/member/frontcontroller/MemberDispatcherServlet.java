package car.member.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import car.member.control.Controller;
import car.member.controller.MemberDeleteController;
import car.member.controller.MemberInsertController;
import car.member.controller.MemberLoginController;
import car.member.controller.MemberLogoutController;
import car.member.controller.MemberSelectController;
import car.member.controller.MemberSelectDetailController;
import car.member.controller.MemberUpdateController;
import car.member.hander.MemberHandlerAdapter;


public class MemberDispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log log = LogFactory.getLog(MemberDispatcherServlet.class);

	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String pathURL = requestURI.substring(contextPath.length());
		log.info("매핑명 조회" + pathURL);
		MemberHandlerAdapter memberHandlerAdapter = null;
		Controller controller =null;
		
		if(pathURL.equals("/MemberSelect.jh")) {
			controller = new MemberSelectController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("회원 조회 확인" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberSelectDetail.jh")) {
			controller = new MemberSelectDetailController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("상세 회원 조회 확인" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberInsertView.jh")) {
			memberHandlerAdapter = new MemberHandlerAdapter();
			memberHandlerAdapter.setPath("/WEB-INF/view/member/member_insert_view.jsp");
			log.info("회원가입" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberInsertDuplicateCheck.jh")) {
			memberHandlerAdapter = new MemberHandlerAdapter();
			memberHandlerAdapter.setPath("/WEB-INF/view/member/member_duplicate_check.jsp");
			log.info("회원가입" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberInsert.jh")) {
			controller = new MemberInsertController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("회원가입 후 홈페이지 이동" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberUpdateView.jh")) {
			memberHandlerAdapter = new MemberHandlerAdapter();
			memberHandlerAdapter.setPath("/WEB-INF/view/member/member_update_view.jsp");
			log.info("회원수정" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberUpdate.jh")) {
			controller = new MemberUpdateController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("회원수정 후 회원조회 이동" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberDeleteView.jh")) {
			memberHandlerAdapter = new MemberHandlerAdapter();
			memberHandlerAdapter.setPath("/WEB-INF/view/member/member_delete_view.jsp");
			log.info("회원삭제" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberDelete.jh")) {
			log.info("뭐애1");
			controller = new MemberDeleteController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("회원삭제 후 메인화면 이동" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberLoginView.jh")) {
			memberHandlerAdapter = new MemberHandlerAdapter();
			memberHandlerAdapter.setPath("/WEB-INF/view/login/login_view.jsp");
			log.info("회원삭제" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberLogin.jh")) {
			controller = new MemberLoginController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("회원삭제 후 메인화면 이동" + memberHandlerAdapter);
		}
		else if(pathURL.equals("/MemberLogout.jh")) {
			controller = new MemberLogoutController();
			memberHandlerAdapter = controller.execute(request, response);
			log.info("회원삭제 후 메인화면 이동" + memberHandlerAdapter);
		}
		
		if(memberHandlerAdapter !=null) {
			if(memberHandlerAdapter.isRedirect()) {
				response.sendRedirect(memberHandlerAdapter.getPath());
			}else {
				log.info("힘들다");
				RequestDispatcher dispatcher = request.getRequestDispatcher(memberHandlerAdapter.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}