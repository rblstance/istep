package lecture;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import subject.SubjectDao;

/**
 * Servlet implementation class addLectureAction
 */
//@WebServlet("/addLectureAction")
public class addLectureAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addLectureAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String code = request.getParameter("code");
		int sbjCode = Integer.parseInt(request.getParameter("sbjCode"));
		String name = request.getParameter("title");
		String thumbnail = request.getParameter("subject");
		String url = request.getParameter("subject");
//		int time = request.getParameter("subject");
//		Timestamp regDate = request.getParameter("subject");
		
//		if(name!=null && teacher!=null && explain!=null && kind!=null) {
//			SubjectDao dao = SubjectDao.getInstance();
//			dao.addSubject(name, teacher, explain, kind);
//			response.sendRedirect("subjectM.jsp");
//		}else {
//			response.sendRedirect("addSubject.jsp");			
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
