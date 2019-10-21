package notice.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;


/**
 * Servlet implementation class InsertNoticeSelvlet
 */
@WebServlet("/insert.no")
public class InsertNoticeSelvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeSelvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title =request.getParameter("title");
		String text =request.getParameter("text");
		
		HttpSession session= request.getSession();
		String user_Id =request.getParameter("userId");
	
		
		
		// 생성자를 만들때는 매개변수의 순서 및 자료형을 잘 체크하자
		Notice n = new Notice(title, text ,user_Id);
		
		int result = new NoticeService().insertNotice(n);
		
		if(result>0) {
			response.sendRedirect("list.no");// 상대경로로 다른 서블릿의 url-mapping을 찾아가자(다른 서블릿으로 이동)
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 등록 실패!");
			
			view.forward(request,response);
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
