package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteAction
 */
//@WebServlet("/DeleteAction")
public class deleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String log = (String) session.getAttribute("log");
		String password = request.getParameter("password");
		
		UserDao dao = UserDao.getInstance();
		int check = dao.deleteuser(log, password);

		if (check == 1) {
			session.invalidate();
			out.println("<script>alert('회원탈퇴가 완료되었습니다.');location.href='index';</script>");
			//response.sendRedirect("deleteOk");
		} else {
			out.println("<script>alert('비밀번호가 틀렸습니다. 다시 입력해주세요.');location.href='deleteForm';</script>");
			//response.sendRedirect("deleteForm");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
