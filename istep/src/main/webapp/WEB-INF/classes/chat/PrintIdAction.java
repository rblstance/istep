package chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDao;
import user.UserDto;

/**
 * Servlet implementation class PrintId
 */
//@WebServlet("/PrintIdAction")
public class PrintIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrintIdAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		String param = URLDecoder.decode(request.getParameter("user_id"), "utf8");
		String memList = URLDecoder.decode(request.getParameter("user_id"), "utf8");
		PrintWriter out = response.getWriter();

		UserDao dao = UserDao.getInstance();
		UserDto result=null;
		try {
			result = dao.getUserById(param);
			result.getId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		ServletContext app = this.getServletContext();
		RequestDispatcher dispatcher = app.getRequestDispatcher("/chatForm");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			out.println(e);
		}
	}

}