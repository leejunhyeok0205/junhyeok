package car.connect.dbcp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@WebServlet("/DBCP")
public class ConectionDB extends HttpServlet {
	private static Log log = LogFactory.getLog(ConectionDB.class);
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		Boolean bool = true;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			log.info(connection);
			log.info("데이터베이스와 연결되었습니다.");
			request.setAttribute("bool", bool);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./WEB-INF/view/connection/Connection_db.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			log.info("데이터베이스 연결 실패 - " + e);
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}