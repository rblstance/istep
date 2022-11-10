package lecture;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.sql.Date;

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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code");
		String sbjCodeParam = request.getParameter("sbjCode");
		String name = request.getParameter("title");
		String thumbnail = request.getParameter("thumbnail");
		String url = request.getParameter("url");
		String timeParam = request.getParameter("playTime");
		String regParam = request.getParameter("regDate");
		System.out.printf("%s/%s/%s/%s/%s/%s/%s",code, sbjCodeParam, name, thumbnail, url, timeParam, regParam);
		if(code!=null && sbjCodeParam!=null && name!=null && thumbnail!=null && url!=null
				&& timeParam!=null && regParam!=null) {
			int sbjCode = Integer.parseInt(sbjCodeParam);
			int time = Integer.parseInt(timeParam);
			String[] regTemp = regParam.split("-");
			int[] regData = new int[regTemp.length];
			for(int i=0;i<regTemp.length;i++) {
				regData[i] = Integer.parseInt(regTemp[i]);
			}
			Timestamp regDate = new Timestamp(regData[0], regData[1], regData[2], 0, 0, 0, 0);
			LectureDao dao = LectureDao.getInstance();
			LectureDto lecture = new LectureDto(code, sbjCode, name, thumbnail, url, time, regDate);
			dao.addLecture(lecture);
			out.println("<script>alert('강의가 추가되었습니다.');</script>");
			response.sendRedirect("lectureM");
		}else {
			out.println("<script>alert('오류 발생! 다시시도해 주십시오.');</script>");
			request.getRequestDispatcher("loadLecture").forward(request, response);			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
