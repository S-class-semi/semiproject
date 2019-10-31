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

import company.model.vo.Company;
import member.model.vo.Member;
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
		
		
		HttpSession user = request.getSession();
		Company cominfo = (Company) user.getAttribute("companyinfo");
		
		String title =request.getParameter("title");
		String text =request.getParameter("content");
		
		

		
		String c_name= cominfo.getC_name();
		
		Notice n = new Notice(c_name,title,text);
		
		int result = new NoticeService().insertNotice(n);
		System.out.println(result);
		if(result>0) {
			response.sendRedirect("list.ng");
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
