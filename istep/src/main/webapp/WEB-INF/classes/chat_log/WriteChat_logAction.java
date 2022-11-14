package chat_log;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WriteChat_logAction
 */
//@WebServlet("/WriteChat_logAction")
public class WriteChat_logAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteChat_logAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("log");
		String c_code = request.getParameter("c_code");
		String content = request.getParameter("content");
		
		Chat_logDao dao = Chat_logDao.getInstance();
		Chat_logDto chat_log = new Chat_logDto(user_id, c_code, content);
		dao.createChat_log(chat_log);
		
		request.getRequestDispatcher("chatView?c_Code"+c_code).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}