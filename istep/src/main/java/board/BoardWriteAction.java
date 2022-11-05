package board;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardWriteAction
 */
@WebServlet("/BoardWriteAction")
public class BoardWriteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date now = new Date(System.currentTimeMillis());
		
		BoardDao dao = BoardDao.getInstance();
		int no = dao.noGenerator();
		String title = request.getParameter("title");
		String id = "manager"; // 나중에 꼭 수정해야됨
		String content = request.getParameter("content");
		
		Date regdate = now;
		int check = 0;
		String sbjParam = request.getParameter("code");
		System.out.println(title + "/" + content + "/" + sbjParam);
		int sbj_code = Integer.parseInt(sbjParam);
		
		BoardDto board = new BoardDto(no, id, title, content, regdate, check, sbj_code);
		dao.createBoard(board);
		
		request.getRequestDispatcher("lecture.jsp").forward(request, response);

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
