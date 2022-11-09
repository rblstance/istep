package answer;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AnswerWriteAction
 */
@WebServlet("/AnswerWriteAction")
public class AnswerWriteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerWriteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Date now = new Date(System.currentTimeMillis());
		
		AnswerDao dao = AnswerDao.getInstance();
		int code = dao.noAnswerGenerator();
		int b_num = Integer.parseInt(request.getParameter("no"));
		String user_id = request.getParameter("id");
		String content = request.getParameter("content");
		Date regdate = now;
		
		AnswerDto ans = new AnswerDto(code, b_num, user_id, content, regdate);
		dao.createAnswer(ans);
		response.flushBuffer();
		response.resetBuffer();
		request.getRequestDispatcher("boardView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
